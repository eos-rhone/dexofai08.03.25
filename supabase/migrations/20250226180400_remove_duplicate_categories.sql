-- Remove duplicate categories
BEGIN;

DELETE FROM categories WHERE slug IN ('acoustic', '3d', 'data-analysis', 'archaeology');

COMMIT;
