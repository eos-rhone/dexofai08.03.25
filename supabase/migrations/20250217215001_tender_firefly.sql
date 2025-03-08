/*
  # Create newsletter subscriptions table

  1. New Tables
    - `newsletter_subscriptions`
      - `id` (uuid, primary key)
      - `email` (text, unique)
      - `interests` (text array)
      - `frequency` (text)
      - `created_at` (timestamp)
      - `active` (boolean)

  2. Security
    - Enable RLS on `newsletter_subscriptions` table
    - Add policy for inserting new subscriptions
    - Add policy for users to manage their own subscriptions
*/

CREATE TABLE IF NOT EXISTS newsletter_subscriptions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text UNIQUE NOT NULL,
  interests text[] DEFAULT '{}',
  frequency text NOT NULL DEFAULT 'weekly',
  created_at timestamptz DEFAULT now(),
  active boolean DEFAULT true
);

ALTER TABLE newsletter_subscriptions ENABLE ROW LEVEL SECURITY;

-- Allow anyone to subscribe
CREATE POLICY "Anyone can subscribe to newsletter"
  ON newsletter_subscriptions
  FOR INSERT
  WITH CHECK (true);

-- Allow users to manage their own subscriptions
CREATE POLICY "Users can manage their own subscriptions"
  ON newsletter_subscriptions
  USING (auth.jwt() ->> 'email' = email);
