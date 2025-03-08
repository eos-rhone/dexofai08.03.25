-- Mise à jour avec des images HD pour toutes les catégories (Partie 3 - Finale)
UPDATE ai_tools 
SET image_url = CASE category_id
    -- Océanographie
    WHEN 'e5f0d1f9-4f0b-4600-941f-0e99b597d9ac' THEN 'https://images.unsplash.com/photo-1582967788606-a171c1080cb0?q=80&w=2000'
    -- Optimisation & Performance
    WHEN 'c9115786-e082-40e3-a86d-b58e4913f9f7' THEN 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
    -- Outils de Données
    WHEN '02c1754e-6237-4737-96a8-bf04f30b9017' THEN 'https://images.unsplash.com/photo-1518186285589-2f7649de83e0?q=80&w=2000'
    -- Photographie
    WHEN '89c9a5ee-de9e-4bb2-9b66-0db21e787be6' THEN 'https://images.unsplash.com/photo-1452587925148-ce544e77e70d?q=80&w=2000'
    -- Productivité
    WHEN 'c8628147-9f98-493e-a825-cb451d6570ca' THEN 'https://images.unsplash.com/photo-1483389127117-b6a2102724ae?q=80&w=2000'
    -- Psychologie
    WHEN '814b6de6-fb05-4642-a858-a38fb2f9b569' THEN 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2000'
    -- Réalité augmentée & virtuelle
    WHEN 'dca8e4e4-e59e-4766-826a-50d8e407ece5' THEN 'https://images.unsplash.com/photo-1478416272538-5f7e51dc5400?q=80&w=2000'
    -- Réalité Mixte
    WHEN '8115fcce-39e1-43df-8c31-bc448d9a4116' THEN 'https://images.unsplash.com/photo-1593508512255-86ab42a8e620?q=80&w=2000'
    -- Recherche
    WHEN '9d4366ba-1717-4baa-9afe-4dcdf3eccecc' THEN 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2000'
    -- Recherche scientifique
    WHEN 'b48c7d48-0c92-4262-9a24-24c1d0d8faac' THEN 'https://images.unsplash.com/photo-1582719508461-905c673771fd?q=80&w=2000'
    -- Recommandation
    WHEN 'abe406c9-3248-436d-8c88-38269186e6a2' THEN 'https://images.unsplash.com/photo-1571867424488-4565932edb41?q=80&w=2000'
    -- Rédaction & Contenu
    WHEN '5fe29bc8-9c81-41a2-8f98-8b65d62627b0' THEN 'https://images.unsplash.com/photo-1455390582262-044cdead277a?q=80&w=2000'
    -- Ressources humaines
    WHEN 'b6f1eb4a-e3a4-4e90-92c6-1ef756b4db8a' THEN 'https://images.unsplash.com/photo-1521791136064-7986c2920216?q=80&w=2000'
    -- RH & Recrutement
    WHEN 'cfd5dd43-e199-4e06-b549-27c229e95955' THEN 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=2000'
    -- Robotique
    WHEN '2b768be2-0cc2-426a-99f5-03b313693fb2' THEN 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000'
    -- Santé
    WHEN 'a0f4015b-6bcc-4a7d-8f87-1302d9593054' THEN 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?q=80&w=2000'
    -- Science des données
    WHEN '0c3af87a-015c-438e-b9bb-38d019c0eaa7' THEN 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
    -- Science & Recherche
    WHEN '76956649-0867-41b9-b919-19a28ecdeb8c' THEN 'https://images.unsplash.com/photo-1576086213369-97a306d36557?q=80&w=2000'
    -- Simulation
    WHEN '5d8e5717-fb6a-4f1f-99a1-7368a63514f1' THEN 'https://images.unsplash.com/photo-1511174511562-5f7f18b874f8?q=80&w=2000'
    -- Sport & Fitness
    WHEN 'b224e083-7bf4-4a2f-a007-6282701322e3' THEN 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=2000'
    -- Télécommunications
    WHEN '8105b346-9a31-4ab3-9839-29d7ff9fc628' THEN 'https://images.unsplash.com/photo-1516387938699-a93567ec168e?q=80&w=2000'
    -- Traduction
    WHEN '15842a53-7b56-4b33-b02a-15b36d899970' THEN 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?q=80&w=2000'
    -- Traduction & Localisation
    WHEN '26396cdf-490c-4950-9a83-e0dcf489c29d' THEN 'https://images.unsplash.com/photo-1493612276216-ee3925520721?q=80&w=2000'
    -- Traitement du Langage Naturel
    WHEN '24bc5778-a08b-4474-ab3f-3e0c2f3606b9' THEN 'https://images.unsplash.com/photo-1456324504439-367cee3b3c32?q=80&w=2000'
    -- Transport
    WHEN 'e79da4f2-2f7e-438c-8270-0d152cb146a7' THEN 'https://images.unsplash.com/photo-1494522855154-9297ac14b55f?q=80&w=2000'
    -- Vidéo
    WHEN '1a261d29-48ff-43e7-96ab-d47ac3c5a893' THEN 'https://images.unsplash.com/photo-1492724441997-5dc865305da7?q=80&w=2000'
    -- Vidéo & Animation
    WHEN '4e4449a4-6978-4b9b-a533-60f36e0ef046' THEN 'https://images.unsplash.com/photo-1536240478700-b869070f9279?q=80&w=2000'
    -- Vision par Ordinateur
    WHEN '6c93c271-e8b3-4fea-b078-878fb9161e54' THEN 'https://images.unsplash.com/photo-1561883088-039e53143d73?q=80&w=2000'
    -- Visualisation & Analyse
    WHEN 'f847fcf1-e0c6-4011-9257-2b58e2b4c6b6' THEN 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
    -- Voix & Parole
    WHEN '596407c1-f50c-4c9b-a817-38ae438a01d0' THEN 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?q=80&w=2000'
    ELSE image_url
END;
