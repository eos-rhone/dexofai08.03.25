-- Update category slugs to match current categories
UPDATE public.categories
SET slug = CASE name
    WHEN 'Mode & Design' THEN 'mode-design'
    WHEN 'Mode & Style' THEN 'mode-style'
    WHEN 'Musées & Patrimoine' THEN 'musees-patrimoine'
    WHEN 'Nanotechnologie' THEN 'nanotechnologie'
    WHEN 'Océanographie' THEN 'oceanographie'
    WHEN 'Optimisation & Performance' THEN 'optimisation-performance'
    END
WHERE name IN (
    'Mode & Design',
    'Mode & Style',
    'Musées & Patrimoine',
    'Nanotechnologie',
    'Océanographie',
    'Optimisation & Performance'
);
