export interface ProductType {
    id: number;
    name: string;
    description: string;
    price: number;
    discountPrice?: number;
    stockQuantity: number;
    category?: {
        id: number;
        name: string;
        slug: string;
    };
    images?: Array<{
        imageUrl: string;
    }>;
}

export interface Category {
    id: number;
    name: string;
    slug: string;
}