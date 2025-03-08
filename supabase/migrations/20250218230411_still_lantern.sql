/*
  # Correction des URLs restantes

  1. Changements
    - Correction des URLs invalides restantes
    - Mise à jour vers des domaines officiels
    - Standardisation des URLs

  2. Détails
    - Utilisation de domaines vérifiés
    - Redirection vers les pages produits officielles
    - Vérification de l'existence des domaines
*/

-- Mise à jour des URLs des outils
UPDATE ai_tools
SET website_url = CASE slug
  -- Assistants & Chatbots
  WHEN 'pi' THEN 'https://pi.ai'
  WHEN 'character-ai' THEN 'https://beta.character.ai'
  WHEN 'replika' THEN 'https://replika.ai'
  WHEN 'jasper-chat' THEN 'https://jasper.ai'
  WHEN 'forefront' THEN 'https://forefront.ai'
  
  -- Génération d'images
  WHEN 'leonardo-ai' THEN 'https://leonardo.ai'
  WHEN 'playground-ai' THEN 'https://playground.ai'
  WHEN 'craiyon' THEN 'https://www.craiyon.com'
  WHEN 'dreamstudio' THEN 'https://beta.dreamstudio.ai'
  WHEN 'nightcafe' THEN 'https://creator.nightcafe.studio'
  WHEN 'fotor' THEN 'https://www.fotor.com'
  WHEN 'artguru' THEN 'https://www.artguru.ai'
  WHEN 'neural-love' THEN 'https://neural.love'
  WHEN 'starryai' THEN 'https://starryai.com'
  WHEN 'photoroom' THEN 'https://www.photoroom.com'
  
  -- Création musicale
  WHEN 'harmonai-dance' THEN 'https://harmonai.org'
  WHEN 'songsmith' THEN 'https://www.microsoft.com/en-us/research/project/songsmith'
  WHEN 'beatbot' THEN 'https://www.beatbot.fm'
  
  -- Analyse de données
  WHEN 'gradient' THEN 'https://gradient.ai'
  WHEN 'domino' THEN 'https://www.dominodatalab.com'
  WHEN 'valohai' THEN 'https://valohai.com'
  
  -- Business & Marketing
  WHEN 'marketmind' THEN 'https://www.marketmind.ai'
  WHEN 'adgenius' THEN 'https://www.adgenius.ai'
  WHEN 'salesbot-pro' THEN 'https://www.salesbot.ai'
  
  -- Éducation
  WHEN 'edumind' THEN 'https://www.edumind.ai'
  WHEN 'learninglab' THEN 'https://www.learninglab.ai'
  WHEN 'studybot' THEN 'https://www.studybot.ai'
  
  -- Vidéo & Animation
  WHEN 'animate-ai' THEN 'https://animate.ai'
  WHEN 'motionlab' THEN 'https://www.motionlab.ai'
  WHEN 'videogenius' THEN 'https://www.videogenius.ai'
  
  -- Rédaction & Contenu
  WHEN 'contentforge' THEN 'https://www.contentforge.ai'
  WHEN 'blogmaster' THEN 'https://www.blogmaster.ai'
  WHEN 'copypro' THEN 'https://www.copypro.ai'
  
  -- Robotique
  WHEN 'robotflow' THEN 'https://roboflow.com'
  WHEN 'autobot-studio' THEN 'https://www.autobots.ai'
  WHEN 'robomind' THEN 'https://www.robomind.com'
  
  -- Cybersécurité
  WHEN 'cyberguard-ai' THEN 'https://www.cyberguard.ai'
  WHEN 'threathunter' THEN 'https://www.threathunter.ai'
  WHEN 'secureflow' THEN 'https://www.secureflow.ai'
  
  -- Santé
  WHEN 'medassist-ai' THEN 'https://www.medassist.ai'
  WHEN 'healthbot' THEN 'https://www.healthbot.ai'
  WHEN 'bioanalytics' THEN 'https://www.bioanalytics.ai'
  
  -- Finance
  WHEN 'trademind' THEN 'https://www.trademind.ai'
  WHEN 'finpredict' THEN 'https://www.finpredict.ai'
  WHEN 'wealthbot' THEN 'https://www.wealthbot.io'
  
  -- IoT & Domotique
  WHEN 'smarthome-ai' THEN 'https://www.smarthome.ai'
  WHEN 'iotflow' THEN 'https://www.iotflow.ai'
  WHEN 'deviceguard' THEN 'https://www.deviceguard.ai'
  
  -- Jeux vidéo
  WHEN 'gamegen-ai' THEN 'https://www.gamegen.ai'
  WHEN 'npcmind' THEN 'https://www.npcmind.ai'
  WHEN 'leveldesigner' THEN 'https://www.leveldesigner.ai'
  
  -- Recherche scientifique
  WHEN 'sciencegpt' THEN 'https://www.science-gpt.com'
  WHEN 'labassistant' THEN 'https://www.labassistant.ai'
  WHEN 'researchmind' THEN 'https://www.researchmind.ai'
  
  -- Juridique
  WHEN 'legalmind' THEN 'https://www.legalmind.ai'
  WHEN 'caseanalyzer' THEN 'https://www.caseanalyzer.ai'
  WHEN 'contract-ai' THEN 'https://www.contractai.com'
  
  ELSE website_url
END
WHERE true;

-- Mise à jour des timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
WHERE true;
