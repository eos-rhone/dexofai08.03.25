-- Mise à jour avec des images HD pour toutes les catégories (Partie 1)
UPDATE ai_tools 
SET image_url = CASE category_id
    -- Première partie (déjà validée)
    WHEN 'db440759-dda1-44d9-9519-6cef2519578d' THEN 'https://images.unsplash.com/photo-1620428268482-cf1851a36764?q=80&w=2000'
    WHEN '94bc9f43-9d0e-4b2a-8f7e-07bf0abf3882' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000'
    WHEN '4a4b9c8e-1251-47b1-a482-5aab928d83c2' THEN 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=2000'
    WHEN 'de00d22b-e03a-482d-9651-b790b0864e8f' THEN 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'
    WHEN 'ad8fab95-7b1d-4de1-943d-753d7c80c870' THEN 'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?q=80&w=2000'
    WHEN 'eacf2933-d747-4633-9844-f7ba64d5d9fb' THEN 'https://images.unsplash.com/photo-1576867757603-05b134ebc379?q=80&w=2000'
    WHEN '66df8c12-3367-461e-b5fa-d6d7f011e187' THEN 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=2000'
    WHEN 'b10fac54-ae44-4148-aea5-9bf0ca0e2582' THEN 'https://images.unsplash.com/photo-1599930113854-d6d7fd521f10?q=80&w=2000'
    WHEN '52515112-99b5-4616-a1dd-4ca600f68248' THEN 'https://images.unsplash.com/photo-1487958449943-2429e8be8625?q=80&w=2000'
    WHEN 'f6a08051-1292-48d4-83ee-c93b7d3d33d3' THEN 'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?q=80&w=2000'
    
    -- Suite des catégories
    WHEN 'f4561023-dc5e-4635-ba93-d15d6d5ac783' THEN 'https://images.unsplash.com/photo-1527430253228-e93688616381?q=80&w=2000'
    WHEN 'd7b0d971-3d4c-414b-b177-44781a81de01' THEN 'https://images.unsplash.com/photo-1543722530-d2c3201371e7?q=80&w=2000'
    WHEN '50472ed2-5e54-4071-8e85-3af83c00b9fa' THEN 'https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?q=80&w=2000'
    WHEN 'd256036f-2e7e-4884-9560-4321cbb3663c' THEN 'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?q=80&w=2000'
    WHEN '9408b32c-63c5-4652-bdc3-e18909b23a34' THEN 'https://images.unsplash.com/photo-1518432031352-d6fc5c10da5a?q=80&w=2000'
    WHEN 'fbed46fd-c63f-40e4-8107-d10bf2c15406' THEN 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'
    WHEN 'cfd8fde7-0e72-4f63-8bc2-33c418ba992c' THEN 'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?q=80&w=2000'
    WHEN '0ff0051e-351a-4b54-8a0b-f64e562c9069' THEN 'https://images.unsplash.com/photo-1559686043-e65d4a2b57a3?q=80&w=2000'
    WHEN '2bb89390-6e63-4c8e-9559-2ae349618667' THEN 'https://images.unsplash.com/photo-1576086213369-97a306d36557?q=80&w=2000'
    WHEN 'f8633105-1202-47a3-a366-aee5e7d98909' THEN 'https://images.unsplash.com/photo-1644143379190-08a5f055de1d?q=80&w=2000'
    WHEN '54d1db79-7040-4eea-824a-7df88bcd9437' THEN 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=2000'
    WHEN 'e6dfef97-2c75-4a51-b23d-b6d9630ab130' THEN 'https://images.unsplash.com/photo-1603126857599-f6e157fa2fe6?q=80&w=2000'
    WHEN 'a47d205b-e226-4018-8809-012a758f091e' THEN 'https://images.unsplash.com/photo-1552664730-d307ca884978?q=80&w=2000'
    WHEN 'd6e27a41-75ad-4b89-8a11-608106f156e2' THEN 'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?q=80&w=2000'
    WHEN '0c964d21-777b-4ffc-b550-6b0ebd3d8f62' THEN 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?q=80&w=2000'
    WHEN '85d01604-ff50-4247-b394-aa7cd177ca01' THEN 'https://images.unsplash.com/photo-1563986768609-322da13575f3?q=80&w=2000'
    WHEN '7985e32f-5560-42c5-bb86-d877b8281ca1' THEN 'https://images.unsplash.com/photo-1561070791-2526d30994b5?q=80&w=2000'
    WHEN 'e17dc7f4-a974-4ad4-9fae-582502fc8025' THEN 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=2000'
    WHEN 'b1f7d876-05d4-4fe9-be98-8eb72796c6dc' THEN 'https://images.unsplash.com/photo-1535378917042-10a22c95931a?q=80&w=2000'
    WHEN 'cae28601-fd49-4465-ab1e-52d59476af28' THEN 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?q=80&w=2000'
    ELSE image_url
END;
