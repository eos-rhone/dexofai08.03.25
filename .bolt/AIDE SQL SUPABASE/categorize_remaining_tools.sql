-- Catégoriser les outils restants en fonction des mots-clés
BEGIN;

-- Science & Recherche
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Science & Recherche')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%research%'
    OR lower(name) LIKE '%science%'
    OR lower(name) LIKE '%lab%'
    OR lower(description) LIKE '%recherche%'
    OR lower(description) LIKE '%scientifique%'
    OR lower(description) LIKE '%laboratoire%'
);

-- Développement
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Développement')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%code%' 
    OR lower(name) LIKE '%dev%'
    OR lower(name) LIKE '%program%'
    OR lower(description) LIKE '%code%'
    OR lower(description) LIKE '%développement%'
    OR lower(description) LIKE '%programming%'
);

-- Art & Créativité
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Art & Créativité')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%art%'
    OR lower(name) LIKE '%draw%'
    OR lower(name) LIKE '%paint%'
    OR lower(name) LIKE '%design%'
    OR lower(description) LIKE '%artistic%'
    OR lower(description) LIKE '%créatif%'
    OR lower(description) LIKE '%dessin%'
);

-- Audio & Voix
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Audio & Voix')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%audio%'
    OR lower(name) LIKE '%music%'
    OR lower(name) LIKE '%sound%'
    OR lower(name) LIKE '%voice%'
    OR lower(description) LIKE '%audio%'
    OR lower(description) LIKE '%musique%'
    OR lower(description) LIKE '%voix%'
);

-- Traduction & Localisation
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Traduction & Localisation')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%translat%'
    OR lower(name) LIKE '%lang%'
    OR lower(description) LIKE '%traduction%'
    OR lower(description) LIKE '%langue%'
    OR lower(description) LIKE '%localisation%'
);

-- Assistants & Chatbots
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Assistants & Chatbots')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%assist%'
    OR lower(name) LIKE '%chat%'
    OR lower(name) LIKE '%bot%'
    OR lower(description) LIKE '%assistant%'
    OR lower(description) LIKE '%chatbot%'
    OR lower(description) LIKE '%conversation%'
);

-- Rédaction & Contenu
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Rédaction & Contenu')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%write%'
    OR lower(name) LIKE '%content%'
    OR lower(name) LIKE '%text%'
    OR lower(name) LIKE '%blog%'
    OR lower(description) LIKE '%rédaction%'
    OR lower(description) LIKE '%contenu%'
    OR lower(description) LIKE '%écriture%'
);

-- Vidéo & Animation
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Vidéo & Animation')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%video%'
    OR lower(name) LIKE '%anim%'
    OR lower(name) LIKE '%motion%'
    OR lower(description) LIKE '%vidéo%'
    OR lower(description) LIKE '%animation%'
);

-- 3D & Animation
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = '3D & Animation')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%3d%'
    OR lower(name) LIKE '%model%'
    OR lower(name) LIKE '%render%'
    OR lower(description) LIKE '%3d%'
    OR lower(description) LIKE '%modélisation%'
);

-- Blockchain & Web3
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Blockchain & Web3')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%blockchain%'
    OR lower(name) LIKE '%crypto%'
    OR lower(name) LIKE '%web3%'
    OR lower(name) LIKE '%nft%'
    OR lower(description) LIKE '%blockchain%'
    OR lower(description) LIKE '%web3%'
);

-- Métavers & Mondes virtuels
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Métavers & Mondes virtuels')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%meta%'
    OR lower(name) LIKE '%virtual%'
    OR lower(name) LIKE '%vr%'
    OR lower(description) LIKE '%métavers%'
    OR lower(description) LIKE '%virtuel%'
);

-- RH & Recrutement
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'RH & Recrutement')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%hr%'
    OR lower(name) LIKE '%recruit%'
    OR lower(name) LIKE '%talent%'
    OR lower(description) LIKE '%recrutement%'
    OR lower(description) LIKE '%ressources humaines%'
);

-- Santé
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Santé')
WHERE category_id IS NULL 
AND (
    lower(name) LIKE '%health%'
    OR lower(name) LIKE '%medical%'
    OR lower(name) LIKE '%care%'
    OR lower(description) LIKE '%santé%'
    OR lower(description) LIKE '%médical%'
);

-- Catégorie par défaut pour les outils restants
UPDATE public.ai_tools 
SET category_id = (SELECT id FROM public.categories WHERE name = 'Autres')
WHERE category_id IS NULL;

COMMIT;
