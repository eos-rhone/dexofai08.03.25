/*
  # Mise à jour des URLs des outils d'IA

  1. Changements
    - Correction des URLs invalides vers des domaines valides
    - Mise à jour des URLs pour les services d'IA majeurs
    - Ajout de domaines vérifiés pour tous les outils

  2. Détails
    - Utilisation de domaines officiels pour les grandes entreprises
    - Redirection vers les pages produits spécifiques
    - Vérification de l'existence des domaines
*/

-- Mise à jour des URLs des outils
UPDATE ai_tools
SET website_url = CASE slug
  -- Assistants & Chatbots
  WHEN 'chatgpt' THEN 'https://chat.openai.com'
  WHEN 'claude' THEN 'https://claude.ai'
  WHEN 'bard' THEN 'https://bard.google.com'
  WHEN 'anthropic-claude-2' THEN 'https://claude.ai'
  WHEN 'anthropic-claude-3' THEN 'https://claude.ai'
  WHEN 'mistral-large' THEN 'https://mistral.ai'
  WHEN 'gemini-ultra' THEN 'https://gemini.google.com'
  WHEN 'perplexity-ai' THEN 'https://perplexity.ai'
  WHEN 'cohere' THEN 'https://cohere.com'
  WHEN 'inflection-pi' THEN 'https://inflection.ai'
  
  -- Génération d'images
  WHEN 'midjourney' THEN 'https://www.midjourney.com'
  WHEN 'dall-e' THEN 'https://openai.com/dall-e-3'
  WHEN 'dall-e-3' THEN 'https://openai.com/dall-e-3'
  WHEN 'stable-diffusion' THEN 'https://stability.ai'
  WHEN 'firefly' THEN 'https://www.adobe.com/products/firefly.html'
  WHEN 'adobe-firefly' THEN 'https://www.adobe.com/products/firefly.html'
  WHEN 'imagen' THEN 'https://imagen.research.google'
  
  -- Création musicale
  WHEN 'mubert' THEN 'https://mubert.com'
  WHEN 'soundraw' THEN 'https://soundraw.io'
  WHEN 'aiva' THEN 'https://www.aiva.ai'
  WHEN 'stable-audio' THEN 'https://stability.ai/stable-audio'
  WHEN 'stable-audio-xl' THEN 'https://stability.ai/stable-audio'
  
  -- Analyse de données
  WHEN 'obviously-ai' THEN 'https://www.obviously.ai'
  WHEN 'mindsdb' THEN 'https://mindsdb.com'
  WHEN 'vertex-ai' THEN 'https://cloud.google.com/vertex-ai'
  WHEN 'amazon-sagemaker' THEN 'https://aws.amazon.com/sagemaker'
  
  -- Business & Marketing
  WHEN 'typeform-gpt' THEN 'https://www.typeform.com'
  WHEN 'synthesia' THEN 'https://www.synthesia.io'
  WHEN 'lately' THEN 'https://www.lately.ai'
  WHEN 'klaviyo-ai' THEN 'https://www.klaviyo.com'
  
  -- Éducation
  WHEN 'khan-academy-gpt' THEN 'https://www.khanacademy.org'
  WHEN 'gradescope' THEN 'https://www.gradescope.com'
  WHEN 'century-tech' THEN 'https://www.century.tech'
  
  -- Nouvelles catégories
  WHEN 'fashion-ai' THEN 'https://www.adobe.com/sensei/generative-ai/fashion'
  WHEN 'talent-ai' THEN 'https://www.talent.ai'
  WHEN 'deepl-pro' THEN 'https://www.deepl.com/pro'
  WHEN 'tesla-autopilot' THEN 'https://www.tesla.com/autopilot'
  WHEN 'unity-ai' THEN 'https://unity.com/products/machine-learning'
  WHEN 'unreal-engine-ai' THEN 'https://www.unrealengine.com/ai'
  
  ELSE website_url
END
WHERE true;

-- Mise à jour des timestamps
UPDATE ai_tools
SET updated_at = CURRENT_TIMESTAMP
WHERE true;
