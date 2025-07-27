import { useState } from 'react';

const JapanCheckout = () => {
    const [step, setStep] = useState(1);
    const [formData, setFormData] = useState({
        name: '',
        email: '',
        address: '',
        city: '',
        postalCode: '',
        paymentMethod: 'credit',
        cardNumber: '',
        expiry: '',
        cvv: ''
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        // Process checkout logic
        setStep(3);
    };

    return (
        <div className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
            <div className="max-w-md mx-auto bg-white rounded-lg shadow-md overflow-hidden">
                {/* Header with Japanese aesthetic */}
                <div className="bg-purple-600 py-4 px-6">
                    <h1 className="text-2xl font-bold text-white text-center">
                        チェックアウト <span className="font-light">| Checkout</span>
                    </h1>
                </div>

                {/* Progress Steps */}
                <div className="flex justify-between px-8 py-4 border-b">
                    {[1, 2, 3].map((i) => (
                        <div key={i} className="text-center">
                            <div className={`w-8 h-8 mx-auto rounded-full flex items-center justify-center 
                ${step >= i ? 'bg-purple-600 text-white' : 'bg-gray-200 text-gray-600'}`}>
                                {i}
                            </div>
                            <span className={`text-xs mt-1 ${step >= i ? 'text-purple-600 font-medium' : 'text-gray-500'}`}>
                {i === 1 ? '情報' : i === 2 ? '支払い' : '確認'}
              </span>
                        </div>
                    ))}
                </div>

                {/* Form Content */}
                <div className="p-6">
                    {step === 1 && (
                        <div className="space-y-4">
                            <h2 className="text-lg font-medium text-gray-900">お客様情報</h2>
                            <div>
                                <label htmlFor="name" className="block text-sm font-medium text-gray-700">
                                    お名前 (Name)
                                </label>
                                <input
                                    type="text"
                                    id="name"
                                    name="name"
                                    value={formData.name}
                                    onChange={handleChange}
                                    className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-red-500 focus:border-red-500"
                                />
                            </div>

                            <div>
                                <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                                    メールアドレス (Email)
                                </label>
                                <input
                                    type="email"
                                    id="email"
                                    name="email"
                                    value={formData.email}
                                    onChange={handleChange}
                                    className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-red-500 focus:border-red-500"
                                />
                            </div>

                            <div>
                                <label htmlFor="address" className="block text-sm font-medium text-gray-700">
                                    住所 (Address)
                                </label>
                                <input
                                    type="text"
                                    id="address"
                                    name="address"
                                    value={formData.address}
                                    onChange={handleChange}
                                    className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-red-500 focus:border-red-500"
                                />
                            </div>

                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <label htmlFor="city" className="block text-sm font-medium text-gray-700">
                                        市区町村 (City)
                                    </label>
                                    <input
                                        type="text"
                                        id="city"
                                        name="city"
                                        value={formData.city}
                                        onChange={handleChange}
                                        className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-red-500 focus:border-red-500"
                                    />
                                </div>
                                <div>
                                    <label htmlFor="postalCode" className="block text-sm font-medium text-gray-700">
                                        郵便番号 (Postal Code)
                                    </label>
                                    <input
                                        type="text"
                                        id="postalCode"
                                        name="postalCode"
                                        value={formData.postalCode}
                                        onChange={handleChange}
                                        className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-red-500 focus:border-red-500"
                                    />
                                </div>
                            </div>

                            <button
                                onClick={() => setStep(2)}
                                className="w-full bg-purple-600 text-white py-2 px-4 rounded-md hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
                            >
                                次へ (Next)
                            </button>
                        </div>
                    )}

                    {step === 2 && (
                        <div className="space-y-4">
                            <h2 className="text-lg font-medium text-gray-900">お支払い方法</h2>

                            <div className="space-y-2">
                                <label className="flex items-center space-x-3">
                                    <input
                                        type="radio"
                                        name="paymentMethod"
                                        value="credit"
                                        checked={formData.paymentMethod === 'credit'}
                                        onChange={handleChange}
                                        className="h-4 w-4 text-purple-600 focus:ring-purple-500 border-gray-300"
                                    />
                                    <span className="text-sm font-medium text-gray-700">クレジットカード (Credit Card)</span>
                                </label>
                                <label className="flex items-center space-x-3">
                                    <input
                                        type="radio"
                                        name="paymentMethod"
                                        value="konbini"
                                        checked={formData.paymentMethod === 'konbini'}
                                        onChange={handleChange}
                                        className="h-4 w-4 text-purple-600 focus:ring-purple-500 border-gray-300"
                                    />
                                    <span className="text-sm font-medium text-gray-700">コンビニ支払い (Konbini Payment)</span>
                                </label>
                                <label className="flex items-center space-x-3">
                                    <input
                                        type="radio"
                                        name="paymentMethod"
                                        value="bank"
                                        checked={formData.paymentMethod === 'bank'}
                                        onChange={handleChange}
                                        className="h-4 w-4 text-purple-600 focus:ring-purple-500 border-gray-300"
                                    />
                                    <span className="text-sm font-medium text-gray-700">銀行振込 (Bank Transfer)</span>
                                </label>
                            </div>

                            {formData.paymentMethod === 'credit' && (
                                <div className="space-y-4 mt-4">
                                    <div>
                                        <label htmlFor="cardNumber" className="block text-sm font-medium text-gray-700">
                                            カード番号 (Card Number)
                                        </label>
                                        <input
                                            type="text"
                                            id="cardNumber"
                                            name="cardNumber"
                                            value={formData.cardNumber}
                                            onChange={handleChange}
                                            placeholder="1234 5678 9012 3456"
                                            className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-red-500 focus:border-red-500"
                                        />
                                    </div>

                                    <div className="grid grid-cols-2 gap-4">
                                        <div>
                                            <label htmlFor="expiry" className="block text-sm font-medium text-gray-700">
                                                有効期限 (Expiry)
                                            </label>
                                            <input
                                                type="text"
                                                id="expiry"
                                                name="expiry"
                                                value={formData.expiry}
                                                onChange={handleChange}
                                                placeholder="MM/YY"
                                                className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-red-500 focus:border-red-500"
                                            />
                                        </div>
                                        <div>
                                            <label htmlFor="cvv" className="block text-sm font-medium text-gray-700">
                                                CVV
                                            </label>
                                            <input
                                                type="text"
                                                id="cvv"
                                                name="cvv"
                                                value={formData.cvv}
                                                onChange={handleChange}
                                                placeholder="123"
                                                className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-red-500 focus:border-red-500"
                                            />
                                        </div>
                                    </div>
                                </div>
                            )}

                            <div className="flex justify-between pt-4">
                                <button
                                    onClick={() => setStep(1)}
                                    className="text-gray-600 hover:text-gray-800 focus:outline-none"
                                >
                                    ← 戻る (Back)
                                </button>
                                <button
                                    onClick={handleSubmit}
                                    className="bg-purple-600 text-white py-2 px-6 rounded-md hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
                                >
                                    注文を確認 (Review Order)
                                </button>
                            </div>
                        </div>
                    )}

                    {step === 3 && (
                        <div className="text-center space-y-6">
                            <div className="text-green-500">
                                <svg className="w-16 h-16 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7"></path>
                                </svg>
                            </div>
                            <h2 className="text-2xl font-bold text-gray-900">ご注文ありがとうございます!</h2>
                            <p className="text-gray-600">Your order #12345 has been placed successfully.</p>
                            <p className="text-gray-600">確認メールを送信しました。</p>
                            <button
                                onClick={() => setStep(1)}
                                className="bg-purple-600 text-white py-2 px-6 rounded-md hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500"
                            >
                                買い物を続ける (Continue Shopping)
                            </button>
                        </div>
                    )}
                </div>

                {/* Footer with subtle Japanese design element */}
                <div className="bg-gray-100 px-6 py-4 border-t">
                    <div className="flex justify-center">
                        <div className="text-xs text-gray-500">
                            © 2025 CalMarket - All rights reserved
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default JapanCheckout;