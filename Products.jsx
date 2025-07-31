import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import Product from "./Product";
import productsApi from "../api/products";

export default function Products() {
    const [products, setProducts] = useState([]);
    const [filteredProducts, setFilteredProducts] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const location = useLocation();

    // Get categoryId from URL query parameters
    const queryParams = new URLSearchParams(location.search);
    const categoryId = queryParams.get('categoryId');

    useEffect(() => {
        const fetchProducts = async () => {
            try {
                setLoading(true);
                setError(null);

                // Option 1: Fetch all products and filter client-side
                const response = await productsApi.getAllProducts();

                // 🔽 Sort by descending id (latest first)
                const sortedProducts = response.content.sort((a, b) => b.id - a.id);
                setProducts(sortedProducts);

                // Option 2: Fetch filtered products from server (more efficient)
                // const url = categoryId
                //   ? `/api/products/category/${categoryId}`
                //   : '/api/products';
                // const response = await productsApi.get(url);
                // setFilteredProducts(response.content);

            } catch (err) {
                console.error("商品リストの読み込みに失敗しました:", err);
                setError("商品リストを読み込むことができませんでした。サーバーの状態を確認してください。");
            } finally {
                setLoading(false);
            }
        };

        fetchProducts();
    }, [location.search]); // Add location.search as dependency

    // Filter products when categoryId or products change
    useEffect(() => {
        if (categoryId) {
            const filtered = products.filter(product =>
                product.categoryId === Number(categoryId)
            );
            setFilteredProducts(filtered);
        } else {
            // If no category filter, show all products
            setFilteredProducts(products);
        }
    }, [categoryId, products]);

    if (loading) {
        return (
            <main className="container mx-auto p-4 flex justify-center items-center min-h-[calc(100vh-100px)]">
                <p className="text-xl text-gray-700">商品リストを読み込み中...</p>
            </main>
        );
    }

    if (error) {
        return (
            <main className="container mx-auto p-4 flex justify-center items-center min-h-[calc(100vh-100px)]">
                <p className="text-xl text-red-600">{error}</p>
            </main>
        );
    }

    if (filteredProducts.length === 0) {
        return (
            <main className="container mx-auto p-4 flex justify-center items-center min-h-[calc(100vh-100px)]">
                <p className="text-xl text-gray-500">
                    {categoryId
                        ? "このカテゴリに登録された商品がありません。"
                        : "登録された商品がありません。"}
                </p>
            </main>
        );
    }

    return (
        <>
            <main className="container mx-auto p-4">
                <section className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                    {filteredProducts.map((product) => (
                        <Product key={product.id} product={product} />
                    ))}
                </section>
            </main>
        </>
    );
}