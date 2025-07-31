import React from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import { CheckCircle, ShoppingBag, Home, ShoppingCart } from 'lucide-react';

export default function OrderSuccess() {
    const { state } = useLocation();
    const navigate = useNavigate();
    const orderId = state?.orderId;

    return (
        <div className="container mx-auto px-4 py-12 max-w-4xl">
            <div className="bg-white rounded-lg shadow-md p-8 text-center">
                <div className="flex justify-center mb-6">
                    <CheckCircle className="w-16 h-16 text-green-500" strokeWidth={1.5} />
                </div>

                <h1 className="text-3xl font-bold text-gray-800 mb-4">ご注文ありがとうございます！</h1>
                <p className="text-lg text-gray-600 mb-6">
                    ご注文が正常に処理されました。注文確認メールを送信しました。
                </p>

                {orderId && (
                    <div className="bg-gray-50 rounded-lg p-4 mb-8">
                        <div className="flex items-center justify-center gap-2 mb-2">
                            <ShoppingBag className="text-gray-700" />
                            <span className="font-medium text-gray-700">注文番号: {orderId}</span>
                        </div>
                        <p className="text-sm text-gray-500">
                            注文に関するお問い合わせの際は、この注文番号をお伝えください。
                        </p>
                    </div>
                )}

                <div className="flex flex-col sm:flex-row justify-center gap-4">
                    <button
                        onClick={() => navigate('/')}
                        className="flex items-center justify-center gap-2 px-6 py-3 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors"
                    >
                        <Home size={18} />
                        ホームに戻る
                    </button>
                    <button
                        onClick={() => navigate('/products')}
                        className="flex items-center justify-center gap-2 px-6 py-3 bg-gray-200 text-gray-800 rounded-md hover:bg-gray-300 transition-colors"
                    >
                        <ShoppingCart size={18} />
                        他の商品を見る
                    </button>
                </div>

                <div className="mt-10 pt-6 border-t border-gray-200">
                    <h2 className="text-lg font-semibold text-gray-700 mb-4">次に何をしますか？</h2>
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                        <div className="p-4 bg-gray-50 rounded-lg">
                            <h3 className="font-medium text-gray-800 mb-2">注文を確認</h3>
                            <p className="text-gray-600">
                                注文の詳細を確認するには、送信された確認メールをチェックしてください。
                            </p>
                        </div>
                        <div className="p-4 bg-gray-50 rounded-lg">
                            <h3 className="font-medium text-gray-800 mb-2">配送状況</h3>
                            <p className="text-gray-600">
                                注文の配送状況は、後ほどメールでお知らせします。
                            </p>
                        </div>
                        <div className="p-4 bg-gray-50 rounded-lg">
                            <h3 className="font-medium text-gray-800 mb-2">お問い合わせ</h3>
                            <p className="text-gray-600">
                                ご質問がある場合は、お問い合わせページからご連絡ください。
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}