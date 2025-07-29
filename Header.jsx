import React, { useState, useEffect } from 'react';
import { Menu, MapPin, Search, Heart, ShoppingCart, User, LogOut, ChevronDown, X } from 'lucide-react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import axios from 'axios';

interface Category {
    id: number;
    name: string;
}

export default function Header() {
    const { isLoggedIn, user, logout } = useAuth();
    const navigate = useNavigate();
    const [categories, setCategories] = useState<Category[]>([]);
    const [isSidebarOpen, setIsSidebarOpen] = useState(false);

    const handleLogout = () => {
        logout();
        navigate('/');
    };

    // Fetch categories on component mount
    useEffect(() => {
        const fetchCategories = async () => {
            try {
                const response = await axios.get('http://localhost:8080/api/categories');
                setCategories(response.data);
            } catch (err) {
                console.error('Error fetching categories:', err);
            }
        };
        fetchCategories();
    }, []);

    const handleCategoryClick = (categoryId: number) => {
        navigate(`/products?categoryId=${categoryId}`);
        setIsSidebarOpen(false);
    };

    return (
        <>
            {/* Header */}
            <header className="bg-white shadow p-4 flex items-center justify-between relative">
                <div className="flex items-center gap-4">
                    {/* Mobile menu button that opens the sidebar */}
                    <button
                        onClick={() => setIsSidebarOpen(true)}
                        className="lg:hidden cursor-pointer"
                    >
                        <Menu className="w-6 h-6" />
                    </button>

                    {/* Logo */}
                    <Link to="/">
                        <div className="flex items-center gap-4">
                            <img
                                src="https://cal.co.jp/wordpress/wp-content/themes/temp_calrenew/img/logo.svg"
                                alt="Logo"
                                className="hidden lg:block h-8"
                            />
                            {/* Location */}
                            <button className="flex items-center gap-1 text-sm text-gray-700">
                                <MapPin size="16" />
                                Tokyo
                            </button>
                        </div>
                    </Link>

                    {/* Catalog Button for desktop - now opens sidebar */}
                    <button
                        className="hidden lg:flex items-center gap-1 text-sm font-semibold hover:text-purple-600"
                        onClick={() => setIsSidebarOpen(true)}
                    >
                        Catalog
                        <ChevronDown size="16" />
                    </button>
                </div>

                <div className="flex items-center gap-4">
                    {/* Search Section */}
                    <div className="flex items-center border rounded overflow-hidden bg-gray-50">
                        <input
                            type="search"
                            placeholder="Search..."
                            className="px-3 py-1 outline-none bg-gray-50"
                        />
                        <button className="p-3 bg-purple-600 text-white">
                            <Search size="16" />
                        </button>
                    </div>

                    {/* Liked Products */}
                    <Link to={`/wishes`}>
                        <Heart className="text-gray-700 w-6 h-6 hover:text-purple-600 cursor-pointer" />
                    </Link>

                    {/* Shopping Cart */}
                    <Link to="/cart" className="relative">
                        <ShoppingCart className="text-gray-700 w-6 h-6 hover:text-purple-600 cursor-pointer" />
                    </Link>

                    {/* Profile */}
                    {isLoggedIn ? (
                        <button
                            onClick={handleLogout}
                            className="flex items-center gap-1 text-sm font-semibold text-gray-700 hover:text-red-500 cursor-pointer"
                        >
                            <LogOut className="hidden lg:block" />
                            <span className="hidden lg:block">{user?.email ? user.email : 'Logout'}</span>
                        </button>
                    ) : (
                        <Link
                            to="/login"
                            className="flex items-center gap-1 text-sm font-semibold text-gray-700 hover:text-blue-500 cursor-pointer"
                        >
                            <User className="hidden lg:block" />
                            <span className="hidden lg:block">Login</span>
                        </Link>
                    )}
                </div>
            </header>

            {/* Sidebar */}
            {isSidebarOpen && (
                <div className="fixed inset-0 z-50 overflow-hidden">
                    {/* Overlay */}
                    <div
                        className="absolute inset-0 bg-black bg-opacity-50"
                        onClick={() => setIsSidebarOpen(false)}
                    ></div>

                    {/* Sidebar content */}
                    <div className="absolute inset-y-0 left-0 w-64 bg-white shadow-lg flex flex-col">
                        {/* Sidebar header */}
                        <div className="p-4 border-b flex justify-between items-center">
                            <h2 className="text-lg font-semibold">Catalog</h2>
                            <button
                                onClick={() => setIsSidebarOpen(false)}
                                className="text-gray-500 hover:text-gray-700"
                            >
                                <X className="w-6 h-6" />
                            </button>
                        </div>

                        {/* Sidebar content */}
                        <div className="flex-1 overflow-y-auto">
                            <Link
                                to="/products"
                                className="block px-4 py-3 text-gray-700 hover:bg-gray-100 border-b"
                                onClick={() => setIsSidebarOpen(false)}
                            >
                                All Products
                            </Link>
                            {categories.map((category) => (
                                <button
                                    key={category.id}
                                    onClick={() => handleCategoryClick(category.id)}
                                    className="block w-full text-left px-4 py-3 text-gray-700 hover:bg-gray-100 border-b"
                                >
                                    {category.name}
                                </button>
                            ))}
                        </div>
                    </div>
                </div>
            )}
        </>
    );
}
