-- Ajouter des outils pour les 5 premières catégories vides
BEGIN;

-- Image HD pour Agriculture & Environnement
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'
WHERE name = 'Agriculture & Environnement';

-- Outils pour Agriculture & Environnement
WITH new_tools (name, description, url, image_url) AS (
    VALUES 
    ('FarmAI', 'IA pour l''optimisation des cultures et la gestion des ressources agricoles', 'https://farmai.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'),
    ('CropSense', 'Analyse prédictive pour la santé des cultures', 'https://cropsense.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'),
    ('EcoTrack', 'Surveillance environnementale et analyse d''impact', 'https://ecotrack.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'),
    ('SmartIrrigation', 'Système d''irrigation intelligent basé sur l''IA', 'https://smartirrigation.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'),
    ('SoilAnalytics', 'Analyse avancée des sols par IA', 'https://soilanalytics.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'),
    ('PestDetect', 'Détection automatique des parasites par vision par ordinateur', 'https://pestdetect.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'),
    ('YieldPredict', 'Prévision des rendements agricoles par ML', 'https://yieldpredict.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'),
    ('WeatherAI', 'Prévisions météo localisées pour l''agriculture', 'https://weatherai.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'),
    ('BioMonitor', 'Surveillance de la biodiversité par IA', 'https://biomonitor.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000'),
    ('AgriDrone', 'Solutions de drones agricoles intelligents', 'https://agridrone.example.com', 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2000')
)
INSERT INTO tools (name, description, url, image_url, category_id, created_at, updated_at)
SELECT 
    t.name, 
    t.description, 
    t.url, 
    t.image_url,
    c.id as category_id,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
FROM new_tools t
CROSS JOIN categories c
WHERE c.name = 'Agriculture & Environnement';

-- Image HD pour Astronomie & Espace
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'
WHERE name = 'Astronomie & Espace';

-- Outils pour Astronomie & Espace
WITH new_tools (name, description, url, image_url) AS (
    VALUES 
    ('StarMap AI', 'Cartographie stellaire assistée par IA', 'https://starmap.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'),
    ('ExoPlanet', 'Détection d''exoplanètes par apprentissage profond', 'https://exoplanet.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'),
    ('GalaxyNet', 'Classification des galaxies par réseaux de neurones', 'https://galaxynet.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'),
    ('CosmicFlow', 'Simulation de dynamique cosmique', 'https://cosmicflow.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'),
    ('AstroML', 'Machine Learning pour données astronomiques', 'https://astroml.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'),
    ('StellarSpec', 'Analyse spectrale stellaire automatisée', 'https://stellarspec.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'),
    ('SpaceDebris', 'Suivi des débris spatiaux par IA', 'https://spacedebris.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'),
    ('MarsRover AI', 'IA pour l''exploration robotique martienne', 'https://marsrover.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'),
    ('TelescopeAI', 'Optimisation automatique des télescopes', 'https://telescopeai.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000'),
    ('SolarFlare', 'Prédiction des éruptions solaires', 'https://solarflare.example.com', 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?q=80&w=2000')
)
INSERT INTO tools (name, description, url, image_url, category_id, created_at, updated_at)
SELECT 
    t.name, 
    t.description, 
    t.url, 
    t.image_url,
    c.id as category_id,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
FROM new_tools t
CROSS JOIN categories c
WHERE c.name = 'Astronomie & Espace';

-- Image HD pour Automobile & Transport
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'
WHERE name = 'Automobile & Transport';

-- Outils pour Automobile & Transport
WITH new_tools (name, description, url, image_url) AS (
    VALUES 
    ('AutoPilot Pro', 'Système de conduite autonome avancé', 'https://autopilot.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'),
    ('FleetOptimize', 'Optimisation de flotte par IA', 'https://fleetoptimize.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'),
    ('TrafficPredict', 'Prédiction du trafic en temps réel', 'https://trafficpredict.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'),
    ('CarDiagnostics', 'Diagnostic automobile par IA', 'https://cardiagnostics.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'),
    ('ParkingAI', 'Solution de stationnement intelligent', 'https://parkingai.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'),
    ('SafetyNet', 'Système de sécurité prédictif', 'https://safetynet.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'),
    ('EcoRoute', 'Optimisation écologique des trajets', 'https://ecoroute.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'),
    ('MaintPredict', 'Maintenance prédictive automobile', 'https://maintpredict.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'),
    ('ChargeMap AI', 'Localisation intelligente des bornes de recharge', 'https://chargemap.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000'),
    ('DriveAssist', 'Assistant de conduite intelligent', 'https://driveassist.example.com', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=2000')
)
INSERT INTO tools (name, description, url, image_url, category_id, created_at, updated_at)
SELECT 
    t.name, 
    t.description, 
    t.url, 
    t.image_url,
    c.id as category_id,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
FROM new_tools t
CROSS JOIN categories c
WHERE c.name = 'Automobile & Transport';

-- Image HD pour Énergie & Climat
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'
WHERE name = 'Énergie & Climat';

-- Outils pour Énergie & Climat
WITH new_tools (name, description, url, image_url) AS (
    VALUES 
    ('SmartGrid AI', 'Gestion intelligente des réseaux électriques', 'https://smartgrid.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'),
    ('ClimatePredict', 'Modélisation climatique par IA', 'https://climatepredict.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'),
    ('EnergyOptimize', 'Optimisation de la consommation énergétique', 'https://energyoptimize.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'),
    ('SolarFlow', 'Gestion intelligente de l''énergie solaire', 'https://solarflow.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'),
    ('WindPredict', 'Prévision de production éolienne', 'https://windpredict.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'),
    ('CarbonTrack', 'Suivi des émissions de carbone', 'https://carbontrack.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'),
    ('GridBalance', 'Équilibrage intelligent du réseau', 'https://gridbalance.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'),
    ('CleanTech AI', 'Solutions d''IA pour technologies propres', 'https://cleantech.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'),
    ('EnergyML', 'Machine Learning pour l''énergie', 'https://energyml.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000'),
    ('ClimateSim', 'Simulation d''impact climatique', 'https://climatesim.example.com', 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=2000')
)
INSERT INTO tools (name, description, url, image_url, category_id, created_at, updated_at)
SELECT 
    t.name, 
    t.description, 
    t.url, 
    t.image_url,
    c.id as category_id,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
FROM new_tools t
CROSS JOIN categories c
WHERE c.name = 'Énergie & Climat';

-- Image HD pour Géologie
UPDATE categories 
SET image_url = 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'
WHERE name = 'Géologie';

-- Outils pour Géologie
WITH new_tools (name, description, url, image_url) AS (
    VALUES 
    ('GeoScan AI', 'Analyse géologique par intelligence artificielle', 'https://geoscan.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'),
    ('SeismicAI', 'Analyse sismique par apprentissage profond', 'https://seismic.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'),
    ('MineralMap', 'Cartographie minérale automatisée', 'https://mineralmap.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'),
    ('StrataSense', 'Analyse stratigraphique par IA', 'https://stratasense.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'),
    ('RockClass', 'Classification des roches par vision par ordinateur', 'https://rockclass.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'),
    ('TerrainAI', 'Analyse de terrain par IA', 'https://terrain.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'),
    ('GeoPredict', 'Prédiction géologique', 'https://geopredict.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'),
    ('CoreScan', 'Analyse automatisée des carottes', 'https://corescan.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'),
    ('FaultDetect', 'Détection des failles géologiques', 'https://faultdetect.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000'),
    ('GeoModel3D', 'Modélisation géologique 3D', 'https://geomodel3d.example.com', 'https://images.unsplash.com/photo-1564324738197-19752055ea42?q=80&w=2000')
)
INSERT INTO tools (name, description, url, image_url, category_id, created_at, updated_at)
SELECT 
    t.name, 
    t.description, 
    t.url, 
    t.image_url,
    c.id as category_id,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
FROM new_tools t
CROSS JOIN categories c
WHERE c.name = 'Géologie';

-- Copier les mêmes outils dans ai_tools
INSERT INTO ai_tools (name, description, url, image_url, category_id, created_at, updated_at)
SELECT name, description, url, image_url, category_id, created_at, updated_at
FROM tools
WHERE category_id IN (
    SELECT id FROM categories 
    WHERE name IN (
        'Agriculture & Environnement',
        'Astronomie & Espace',
        'Automobile & Transport',
        'Énergie & Climat',
        'Géologie'
    )
);

COMMIT;
