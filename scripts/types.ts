export interface PricingPlan {
    plan_name: string;
    price: number;
}

export interface ScrapedTool {
    name: string;
    description: string;
    website_url: string;
    pricing: PricingPlan[];
    categories: string[];
    tags: string[];
    monthly_users?: number;
    image_url?: string;
    source: 'producthunt' | 'alternativeto';
}

export interface ValidationResult {
    isValid: boolean;
    errors: string[];
    warnings: string[];
}

export interface CategorySuggestion {
    name: string;
    confidence: number;
    keywords: string[];
}

export interface ToolData {
    id?: string;
    name: string;
    description: string;
    website_url: string;
    image_url?: string;
    monthly_users: number;
    is_verified: boolean;
    created_at?: string;
    updated_at?: string;
}
