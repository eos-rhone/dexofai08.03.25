-- Mise à jour avec des images HD pour toutes les catégories (Partie 2)
UPDATE ai_tools 
SET image_url = CASE category_id
    -- E-commerce
    WHEN 'c6211689-fbf8-4b65-b34c-4ac331e91be7' THEN 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?q=80&w=2000'
    -- Éducation
    WHEN 'ea912764-0956-4088-b9aa-d9a95711976e' THEN 'https://images.unsplash.com/photo-1523580494863-6f3031224c94?q=80&w=2000'
    -- Énergie
    WHEN '4713fcdd-68c2-4e9c-beab-481442afe426' THEN 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'
    -- Énergie & Climat
    WHEN '3773d4fc-fbcc-41c6-8f26-d51bbfbe91c0' THEN 'https://images.unsplash.com/photo-1466611653911-95081537e5b7?q=80&w=2000'
    -- Environnement
    WHEN '818af20d-9521-4421-a36d-335b1ccb888c' THEN 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?q=80&w=2000'
    -- Finance
    WHEN 'd054c412-e7ef-4559-b224-ec1d9a8d3d4c' THEN 'https://images.unsplash.com/photo-1565514020179-026b92b2d0b5?q=80&w=2000'
    -- Frameworks & Bibliothèques
    WHEN '1715f3fe-c800-425e-b5d3-ee8af4477a39' THEN 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=2000'
    -- Gaming
    WHEN '0c3cf6f6-39ca-41d5-a924-86fe87f4459a' THEN 'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?q=80&w=2000'
    -- Génération de Code
    WHEN '7b48087c-6ec8-4b27-aba3-3c3418bf2828' THEN 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?q=80&w=2000'
    -- Génération d'images
    WHEN '315d7bf0-72f8-4387-bab4-2bcc6ceb524f' THEN 'https://images.unsplash.com/photo-1549421263-6064833b071b?q=80&w=2000'
    -- Géologie
    WHEN '6a616712-394f-4aec-8999-01418569a1c2' THEN 'https://images.unsplash.com/photo-1564419320461-6870880221ad?q=80&w=2000'
    -- Gestion des Tâches
    WHEN '815d0c57-f95a-4f9b-8f72-cb4732da73cb' THEN 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?q=80&w=2000'
    -- Immobilier
    WHEN 'e784a647-5bda-4439-9a40-721de1ae7fd0' THEN 'https://images.unsplash.com/photo-1560518883-ce09059eeffa?q=80&w=2000'
    -- Impression 3D
    WHEN 'c040716f-51fb-47e4-af7f-40eaf2f63769' THEN 'https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?q=80&w=2000'
    -- Industrie
    WHEN 'd663d958-92df-48bd-ad3b-8684c6992f92' THEN 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?q=80&w=2000'
    -- Industrie 4.0
    WHEN 'dc56acc3-b386-4e1c-b893-59b5c44acdfa' THEN 'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?q=80&w=2000'
    -- Intelligence Artificielle Générale
    WHEN '3413b2b6-2023-4539-9dda-770813e5ebf0' THEN 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=2000'
    -- IoT & Domotique
    WHEN '921f5bc9-2988-4ec0-bd92-638c32125bb5' THEN 'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?q=80&w=2000'
    -- IoT & Robotique
    WHEN 'd580e5b2-9e0b-4c7a-8dab-df96bdc9b573' THEN 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000'
    -- Jeux vidéo
    WHEN 'b1230acd-170b-4490-a64d-c55e33e5a19e' THEN 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?q=80&w=2000'
    -- Juridique
    WHEN 'f411314b-4031-4b49-92ae-1ae40ad243b8' THEN 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?q=80&w=2000'
    -- Logistique
    WHEN 'a1f038ce-f8bd-4a33-9fd9-2c1663af1147' THEN 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?q=80&w=2000'
    -- Médias & Divertissement
    WHEN 'f5bd99ea-826a-47f7-b9fe-fff09aa3391a' THEN 'https://images.unsplash.com/photo-1578022761797-b8636ac614f0?q=80&w=2000'
    -- Métavers & Mondes virtuels
    WHEN 'a24c34eb-773a-46a1-8200-18dea759b32f' THEN 'https://images.unsplash.com/photo-1617802690992-15d93263d3a9?q=80&w=2000'
    -- Météo
    WHEN '70c9a8fc-4d9b-45d6-85bd-c635ae86871b' THEN 'https://images.unsplash.com/photo-1504608524841-42fe6f032b4b?q=80&w=2000'
    -- MLOps & Déploiement
    WHEN 'd9b58ce7-fe51-482c-ab9b-538a3e8f9ab2' THEN 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
    -- Mode & Design
    WHEN '9f7ce0c8-4bad-4053-a45f-54f60c7d72c9' THEN 'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=2000'
    -- Mode & Style
    WHEN '569e7429-97ca-4bad-b8b0-94c2e2e58d97' THEN 'https://images.unsplash.com/photo-1445205170230-053b83016050?q=80&w=2000'
    -- Musées & Patrimoine
    WHEN '44b52541-cfd6-4b8e-938c-a28a0e4b326c' THEN 'https://images.unsplash.com/photo-1544967082-d9d25d867d66?q=80&w=2000'
    -- Nanotechnologie
    WHEN '4d88a004-5fca-4062-8049-6335cbd8c07d' THEN 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?q=80&w=2000'
    ELSE image_url
END;
