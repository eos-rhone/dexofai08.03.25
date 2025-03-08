/*
  # Schema for AI Tools Platform

  1. New Tables
    - `ai_tools`
      - Main table for AI tools
      - Stores tool information, ratings, stats
    - `categories`
      - Categories for AI tools
    - `reviews`
      - User reviews for tools
    - `tool_stats`
      - Daily statistics tracking
    - `tool_features`
      - Features and capabilities of tools
    - `tool_pricing`
      - Pricing plans for tools

  2. Security
    - Enable RLS on all tables
    - Public read access
    - Authenticated write access for reviews
    
  3. Relationships
    - Tools belong to categories
    - Tools have many reviews
    - Tools have one stats record
    - Tools have many features
    - Tools have many pricing plans
*/

-- Categories Table
CREATE TABLE IF NOT EXISTS categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  description text,
  icon text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- AI Tools Table
CREATE TABLE IF NOT EXISTS ai_tools (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  description text NOT NULL,
  category_id uuid REFERENCES categories(id),
  image_url text,
  website_url text NOT NULL,
  is_verified boolean DEFAULT false,
  is_featured boolean DEFAULT false,
  average_rating numeric(3,2) DEFAULT 0,
  total_reviews integer DEFAULT 0,
  monthly_users integer DEFAULT 0,
  total_views integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Reviews Table
CREATE TABLE IF NOT EXISTS reviews (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id uuid REFERENCES ai_tools(id),
  user_id uuid REFERENCES auth.users(id),
  rating integer NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment text,
  created_at timestamptz DEFAULT now()
);

-- Tool Stats Table (Daily tracking)
CREATE TABLE IF NOT EXISTS tool_stats (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id uuid REFERENCES ai_tools(id),
  date date DEFAULT CURRENT_DATE,
  views integer DEFAULT 0,
  clicks integer DEFAULT 0,
  unique_visitors integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Tool Features Table
CREATE TABLE IF NOT EXISTS tool_features (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id uuid REFERENCES ai_tools(id),
  name text NOT NULL,
  description text,
  created_at timestamptz DEFAULT now()
);

-- Tool Pricing Table
CREATE TABLE IF NOT EXISTS tool_pricing (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id uuid REFERENCES ai_tools(id),
  plan_name text NOT NULL,
  price numeric(10,2),
  billing_period text CHECK (billing_period IN ('monthly', 'yearly', 'one-time')),
  features text[],
  created_at timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE ai_tools ENABLE ROW LEVEL SECURITY;
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_stats ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_features ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_pricing ENABLE ROW LEVEL SECURITY;

-- RLS Policies

-- Categories: Anyone can read, only authenticated admins can modify
CREATE POLICY "Public read access for categories"
  ON categories FOR SELECT
  TO public
  USING (true);

-- AI Tools: Anyone can read, only authenticated admins can modify
CREATE POLICY "Public read access for ai_tools"
  ON ai_tools FOR SELECT
  TO public
  USING (true);

-- Reviews: Anyone can read, authenticated users can create their own reviews
CREATE POLICY "Public read access for reviews"
  ON reviews FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Authenticated users can create reviews"
  ON reviews FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

-- Tool Stats: Anyone can read
CREATE POLICY "Public read access for tool_stats"
  ON tool_stats FOR SELECT
  TO public
  USING (true);

-- Tool Features: Anyone can read
CREATE POLICY "Public read access for tool_features"
  ON tool_features FOR SELECT
  TO public
  USING (true);

-- Tool Pricing: Anyone can read
CREATE POLICY "Public read access for tool_pricing"
  ON tool_pricing FOR SELECT
  TO public
  USING (true);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_ai_tools_category ON ai_tools(category_id);
CREATE INDEX IF NOT EXISTS idx_reviews_tool ON reviews(tool_id);
CREATE INDEX IF NOT EXISTS idx_tool_stats_tool_date ON tool_stats(tool_id, date);
CREATE INDEX IF NOT EXISTS idx_tool_features_tool ON tool_features(tool_id);
CREATE INDEX IF NOT EXISTS idx_tool_pricing_tool ON tool_pricing(tool_id);
