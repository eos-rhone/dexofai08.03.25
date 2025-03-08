// Conversion du fichier TypeScript en JavaScript
export const aiTools = [
    // Catégorie : Chatbots & Assistants
    {
        name: "AgentGPT",
        description: "Plateforme no-code basée sur le navigateur permettant de créer et déployer des agents IA autonomes. Utilise les fonctions OpenAI et prend en charge GPT-3.5-16k avec des bases de données Pinecone et pg_vector.",
        website_url: "https://agentgpt.reworkd.ai/",
        category: "Chatbots & Assistants",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Pro", price: 20 }
        ]
    },
    {
        name: "AutoGen",
        description: "Framework Microsoft pour développer des agents LLM qui peuvent collaborer entre eux pour résoudre des tâches. Permet une conversation multi-agents avec différents rôles et capacités.",
        website_url: "https://github.com/microsoft/autogen",
        category: "Chatbots & Assistants",
        pricing: [{ plan_name: "Free", price: 0 }]
    },
    {
        name: "ChatDev",
        description: "Assistant de développement logiciel qui simule une entreprise de développement logiciel avec plusieurs agents IA collaborant sur des projets.",
        website_url: "https://github.com/OpenBMB/ChatDev",
        category: "Génération de Code",
        pricing: [{ plan_name: "Free", price: 0 }]
    }
];

export const aiToolsPart2 = [
    {
        name: "GPT Engineer",
        description: "Spécifie ce que vous voulez construire, l'IA pose des questions de clarification et crée le code. Idéal pour le développement rapide de projets.",
        website_url: "https://gptengineer.app/",
        category: "Génération de Code",
        pricing: [{ plan_name: "Free", price: 0 }]
    }
];

export const aiToolsPart3 = [
    {
        name: "Midjourney",
        description: "Outil de génération d'images IA créant des visuels artistiques de haute qualité à partir de descriptions textuelles.",
        website_url: "https://www.midjourney.com/",
        category: "Génération d'Images",
        pricing: [
            { plan_name: "Basic", price: 10 },
            { plan_name: "Standard", price: 30 }
        ]
    }
];

export const aiToolsPart4 = [
    {
        name: "DALL-E",
        description: "Système de génération d'images par OpenAI capable de créer des images réalistes et artistiques à partir de descriptions textuelles.",
        website_url: "https://openai.com/dall-e-2",
        category: "Génération d'Images",
        pricing: [{ plan_name: "Pay-per-use", price: -1 }]
    }
];

export const aiToolsPart5 = [
    {
        name: "ElevenLabs",
        description: "Plateforme de synthèse vocale IA offrant des voix naturelles et expressives dans plusieurs langues.",
        website_url: "https://elevenlabs.io/",
        category: "Audio & Voix",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Creator", price: 22 }
        ]
    }
];

export const aiToolsPart6 = [
    {
        name: "Synthesia",
        description: "Plateforme de création vidéo IA permettant de générer des vidéos avec des avatars parlants à partir de texte.",
        website_url: "https://www.synthesia.io/",
        category: "Vidéo",
        pricing: [{ plan_name: "Business", price: 30 }]
    }
];
