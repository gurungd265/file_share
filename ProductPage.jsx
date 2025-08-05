import React, { useState, useEffect, useContext, useCallback } from "react";
import { useParams, Link } from "react-router-dom";
import productsApi from '../api/products';
import cartApi from '../api/cart';
import wishlistApi from '../api/wishlist';
import { Heart } from "lucide-react";
import { CartContext } from '../contexts/CartContext';
import { useAuth } from "../contexts/AuthContext.jsx";

export default function ProductPage() {
    const { id } = useParams();
    const [product, setProduct] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [quantity, setQuantity] = useState(1);
    const [mainImage, setMainImage] = useState('');
    const [allCharacteristics, setAllCharacteristics] = useState([]);
    const [selectedCharacteristics, setSelectedCharacteristics] = useState({});
    const [wished, setWished] = useState(false);
    const [wishlistLoading, setWishlistLoading] = useState(false);
    const [imageLoading, setImageLoading] = useState(true);

    const productRating = product?.rating ?? 0;
    const productReviewCount = product?.reviewCount ?? 0;
    const { fetchCartCount } = useContext(CartContext);
    const { isLoggedIn, loading: authLoading } = useAuth();

    useEffect(() => {
        const checkWishStatus = async () => {
            if (authLoading || !isLoggedIn) {
                setWished(false);
                return;
            }

            try {
                const wishlistItems = await wishlistApi.getWishlistItems();
                const isProductWished = wishlistItems.some(item => item.productId === parseInt(id));
                setWished(isProductWished);
            } catch (err) {
                console.error("ウィッシュリストの状態を確認できませんでした。", err);
            }
        };

        checkWishStatus();
    }, [id, isLoggedIn, authLoading]);

    const handleWishlist = async (e) => {
        e.preventDefault();

        if (!isLoggedIn) {
            alert("ウィッシュリスト操作にはログインが必要です。");
            return;
        }

        setWishlistLoading(true);
        const previousWished = wished;
        setWished(!previousWished); // optimistic update

        try {
            if (!previousWished) {
                await wishlistApi.addWishlistItem(parseInt(id));
            } else {
                await wishlistApi.removeWishlistItemByProductId(parseInt(id));
            }
        } catch (err) {
            console.error("ウィッシュリスト操作に失敗しました。", err);
            setWished(previousWished); // rollback
            const message = err.response?.data || "不明なエラーが発生しました。";
            alert(`ウィッシュリスト操作中にエラーが発生しました: ${message}`);
        } finally {
            setWishlistLoading(false);
        }
    };

    useEffect(() => {
        const fetchProduct = async () => {
            try {
                setLoading(true);
                setError(null);

                const productIdNum = parseInt(id);
                if (isNaN(productIdNum)) {
                    setError('無効な商品IDです。');
                    setLoading(false);
                    return;
                }

                const data = await productsApi.getProductById(productIdNum);
                setProduct(data);

                if (data && data.images && data.images.length > 0 && mainImage === '') {
                    setMainImage(data.images[0].imageUrl);
                }

                if (data.characteristics) {
                    const characteristicsMap = data.characteristics.reduce((acc, c) => {
                        if (!acc[c.characteristicName]) {
                            acc[c.characteristicName] = new Set();
                        }
                        acc[c.characteristicName].add(c.characteristicValue);
                        return acc;
                    }, {});

                    const characteristicsArray = Object.entries(characteristicsMap).map(
                        ([name, values]) => ({
                            name,
                            values: Array.from(values)
                        })
                    );

                    setAllCharacteristics(characteristicsArray);
                }
            } catch (err) {
                console.error(`商品ID ${id}の読み込みに失敗しました:`, err);
                if (err.response && err.response.status === 404) {
                    setError('商品を見つけることができませんでした。');
                } else {
                    setError('商品情報を読み込むことができませんでした。サーバーの状態を確認してください。');
                }
            } finally {
                setLoading(false);
            }
        };
        fetchProduct();
    }, [id, mainImage]);

    const handleCharacteristicSelect = (charName, value) => {
        setSelectedCharacteristics(prev => ({
            ...prev,
            [charName]: value
        }));
    };

    const renderCharacteristics = useCallback(() => {
        return allCharacteristics.map((char) => (
            <div key={char.name} className="mb-4">
                <label className="block text-2xl font-medium text-gray-700 mb-1">
                    {char.name}
                </label>
                <div className="grid grid-cols-3 gap-2">
                    {char.values.map((value) => (
                        <button
                            key={value}
                            type="button"
                            onClick={() => handleCharacteristicSelect(char.name, value)}
                            className={`border p-2 rounded hover:bg-gray-100 ${
                                selectedCharacteristics[char.name] === value
                                    ? 'bg-gray-200 font-semibold'
                                    : ''
                            }`}
                        >
                            {value}
                        </button>
                    ))}
                </div>
            </div>
        ));
    }, [allCharacteristics, selectedCharacteristics]);

    const handleQuantityChange = (e) => {
        const value = parseInt(e.target.value);
        if (!isNaN(value) && value >= 1 && value <= product.stockQuantity) {
            setQuantity(value);
        } else if (value > product.stockQuantity) {
            setQuantity(product.stockQuantity);
            alert(`最大${product.stockQuantity}個まで注文可能です。`);
        } else if (value < 1) {
            setQuantity(1);
            alert('数量は1以上である必要があります。');
        }
    };

    const handleAddToCart = async() => {
        if (product.stockQuantity <= 0) {
            alert("この商品は現在、在庫がありません。");
            return;
        }
        if (quantity <= 0) {
            alert("数量は1以上である必要があります。");
            return;
        }
        try {
            await cartApi.addToCart(product.id, quantity);
            alert(`${product.name} ${quantity}個がカートに追加されました！`);
            fetchCartCount();
        } catch (err) {
            console.error('カートに追加できませんでした。', err);
            if (err.response && err.response.status === 401) {
                alert('カートに追加するにはログインが必要です。');
            } else if (err.response?.data?.message) {
                alert(`カートに追加中にエラーが発生しました: ${err.response.data.message}`);
            } else {
                alert('カートに追加中に不明なエラーが発生しました。');
            }
        }
    };

    const displayPrice = product?.discountPrice !== null && product?.discountPrice !== undefined
        ? product.discountPrice
        : product?.price;

    if (loading) {
        return <div className="p-6 text-center text-gray-700">商品情報を読み込み中...</div>;
    }

    if (error) {
        return <div className="p-6 text-center text-red-600">{error}</div>;
    }

    if (!product) {
        return <div className="p-6 text-center text-gray-500">商品情報がありません。</div>;
    }

    return (
        <div className="max-w-7xl mx-auto p-6">
            {/* Breadcrumb */}
            <div className="text-sm text-gray-500 mb-4">
                <Link to="/">
                    <span className="hover:underline cursor-pointer">ホーム</span> /{" "}
                </Link>
                <span className="hover:underline cursor-pointer">カテゴリー</span> /{" "}
                <span className="text-gray-700 font-semibold">{product.name}</span>
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                {/* Image Section */}
                <div className="lg:col-span-2">
                    <div className="relative">
                        <button
                            onClick={handleWishlist}
                            disabled={wishlistLoading}
                            className="absolute bg-white rounded-full top-2 right-2 z-10 w-9 h-9 flex items-center justify-center hover:scale-110 transition-transform"
                            title="マイリストに追加"
                            aria-label={wished ? "マイリストから削除" : "マイリストに追加"}
                        >
                            {wishlistLoading ? (
                                <span className="text-xs">...</span>
                            ) : (
                                <Heart
                                    size={18}
                                    className={`stroke-2 ${wished ? "text-purple-600 fill-purple-600" : "text-gray-400"}`}
                                />
                            )}
                        </button>
                        <img
                            src={mainImage || 'https://via.placeholder.com/600/CCCCCC/FFFFFF?text=No+Image'}
                            alt={product.name}
                            className={`w-full h-[420px] object-cover rounded-lg shadow ${
                                imageLoading ? 'bg-gray-200 animate-pulse' : ''
                            }`}
                            onLoad={() => setImageLoading(false)}
                            onError={(e) => {
                                e.target.src = 'https://via.placeholder.com/600/CCCCCC/FFFFFF?text=No+Image';
                                setImageLoading(false);
                            }}
                        />
                    </div>
                    <div className="flex gap-2 mt-2">
                        {product.images?.slice(0, 5).map((img) => (
                            <img
                                key={img.id || img.imageUrl}
                                src={img.imageUrl}
                                alt={`サムネイル ${img.id || ''}`}
                                className={`w-20 h-20 object-cover rounded border ${
                                    mainImage === img.imageUrl
                                        ? 'border-purple-600 ring-2 ring-purple-600'
                                        : 'border-gray-300'
                                } cursor-pointer`}
                                onClick={() => setMainImage(img.imageUrl)}
                                onError={(e) => {
                                    e.target.src = 'https://via.placeholder.com/80/CCCCCC/FFFFFF?text=No+Image';
                                }}
                            />
                        ))}
                        {(!product.images || product.images.length === 0) && (
                            <img
                                src="https://via.placeholder.com/80/CCCCCC/FFFFFF?text=No+Image"
                                alt="No Thumbnail"
                                className="w-20 h-20 object-cover rounded border"
                            />
                        )}
                    </div>

                    <div className="mt-6">
                        <h1 className="text-2xl font-bold">{product.name}</h1>
                        <p className="text-sm text-gray-600 mt-2">{product.description}</p>
                    </div>
                </div>

                {/* Info Section */}
                <div className="border rounded-lg shadow p-6 space-y-4">
                    <div>
                        <div className="text-yellow-500 font-bold text-lg">
                            ⭐ {product.rating ? product.rating.toFixed(1) : '評価なし'}
                        </div>
                        <div className="text-sm text-gray-600">
                            {product.reviewCount ? `${product.reviewCount} レビュー` : 'レビューなし'} • 100件以上注文されました
                        </div>
                    </div>

                    <div>
                        {product.discountPrice !== null && product.discountPrice !== undefined && (
                            <div className="text-xl text-gray-500 line-through mb-1">
                                {product.price.toLocaleString()}円
                            </div>
                        )}
                        <div className="text-4xl font-bold text-purple-700 mb-2">
                            {displayPrice.toLocaleString()}円
                        </div>
                        <div className="text-2xl text-gray-500">
                            {Math.floor(displayPrice / 24).toLocaleString()}円/月 24回払い
                        </div>

                        {allCharacteristics.length > 0 && renderCharacteristics()}
                    </div>

                    <div className="mb-6 flex items-center gap-4">
                        <label htmlFor="quantity" className="text-lg font-semibold">数量:</label>
                        <input
                            type="number"
                            id="quantity"
                            min="1"
                            max={product.stockQuantity}
                            value={quantity}
                            onChange={handleQuantityChange}
                            className="w-20 p-2 border rounded-md text-center"
                            aria-label="商品数量"
                        />
                    </div>

                    {product.stockQuantity > 0 ? (
                        <div className="text-sm text-green-600">
                            残り{product.stockQuantity}点 ご注文はお早めに
                        </div>
                    ) : (
                        <div className="text-sm text-red-600">在庫切れ</div>
                    )}
                    <div className="text-sm text-gray-500">今週109人が購入しました</div>

                    <div className="flex flex-col gap-2">
                        <button
                            onClick={handleAddToCart}
                            className="w-full bg-purple-600 text-white py-2 rounded hover:bg-purple-700"
                            disabled={product.stockQuantity <= 0}
                        >
                            カートに入れる
                        </button>
                    </div>
                </div>
            </div>

            <div className="mt-10">
                <h2 className="text-xl font-bold mb-2">商品の説明</h2>
                <p className="text-gray-700 text-sm leading-relaxed">
                    {product.description}
                </p>
            </div>
        </div>
    );
}