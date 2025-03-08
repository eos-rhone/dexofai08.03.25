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
    },
    {
        name: "GPT Engineer",
        description: "Spécifie ce que vous voulez construire, l'IA pose des questions de clarification et crée le code. Idéal pour le développement rapide de projets.",
        website_url: "https://gptengineer.app/",
        category: "Génération de Code",
        pricing: [{ plan_name: "Free", price: 0 }]
    },
    {
        name: "Midjourney",
        description: "Outil de génération d'images IA créant des visuels artistiques de haute qualité à partir de descriptions textuelles.",
        website_url: "https://www.midjourney.com/",
        category: "Génération d'Images",
        pricing: [
            { plan_name: "Basic", price: 10 },
            { plan_name: "Standard", price: 30 }
        ]
    },
    {
        name: "DALL-E",
        description: "Système de génération d'images par OpenAI capable de créer des images réalistes et artistiques à partir de descriptions textuelles.",
        website_url: "https://openai.com/dall-e-2",
        category: "Génération d'Images",
        pricing: [
            { plan_name: "Pay-per-use", price: -1 }
        ]
    },
    {
        name: "ElevenLabs",
        description: "Plateforme de synthèse vocale IA offrant des voix naturelles et expressives dans plusieurs langues.",
        website_url: "https://elevenlabs.io/",
        category: "Audio & Voix",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Creator", price: 22 }
        ]
    },
    {
        name: "Synthesia",
        description: "Plateforme de création vidéo IA permettant de générer des vidéos avec des avatars parlants à partir de texte.",
        website_url: "https://www.synthesia.io/",
        category: "Vidéo",
        pricing: [{ plan_name: "Business", price: 30 }]
    },
    {
        name: "Notion AI",
        description: "Assistant d'écriture et d'organisation intégré à Notion, aidant à la rédaction, au résumé et à l'analyse de contenu.",
        website_url: "https://www.notion.so/product/ai",
        category: "Productivité",
        pricing: [
            { plan_name: "With Notion", price: 10 }
        ]
    },
    {
        name: "Figma AI",
        description: "Ensemble d'outils IA intégrés à Figma pour améliorer le processus de design, incluant la génération de variantes et l'aide à la mise en page.",
        website_url: "https://www.figma.com/ai",
        category: "Design",
        pricing: [{ plan_name: "Included", price: 0 }]
    },
    {
        name: "Adala",
        description: "Framework d'annotation de données qui utilise l'IA pour automatiser et améliorer le processus d'étiquetage des données, avec un focus sur la qualité et l'efficacité.",
        website_url: "https://github.com/HumanSignal/Adala",
        category: "Outils de Données",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "Agent4Rec",
        description: "Système de recommandation basé sur des agents IA qui personnalise les suggestions en fonction des préférences et du comportement des utilisateurs.",
        website_url: "https://github.com/LehengTHU/Agent4Rec",
        category: "Recommandation",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "AgentForge",
        description: "Plateforme de développement d'agents IA qui simplifie la création et le déploiement d'agents autonomes pour diverses tâches.",
        website_url: "https://github.com/DataBassGit/AgentForge",
        category: "Développement d'Agents",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "AgentVerse",
        description: "Environnement multi-agents pour créer des simulations complexes avec des agents IA collaboratifs et compétitifs.",
        website_url: "https://github.com/OpenBMB/AgentVerse",
        category: "Simulation",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "AI Legion",
        description: "Framework pour créer des équipes d'agents IA qui collaborent sur des tâches complexes avec une coordination automatisée.",
        website_url: "https://github.com/eumemic/ai-legion",
        category: "Collaboration IA",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "Aider",
        description: "Assistant de programmation IA qui aide au développement en temps réel avec des suggestions de code contextuelles.",
        website_url: "https://github.com/paul-gauthier/aider",
        category: "Génération de Code",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "AIlice",
        description: "Agent sous forme de chatbot qui planifie indépendamment les tâches données en langage naturel et crée dynamiquement un arbre d'appels d'agents pour les exécuter. Dispose d'un mécanisme d'interaction entre agents pour assurer la tolérance aux pannes.",
        website_url: "https://github.com/myshell-ai/AIlice",
        category: "Productivité",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "AutoGPT",
        description: "Agent IA autonome qui peut accomplir des tâches complexes en les décomposant en sous-tâches et en les exécutant de manière itérative. Utilise GPT-4 pour la planification et l'exécution.",
        website_url: "https://agpt.co",
        category: "Chatbots & Assistants",
        pricing: [
            { plan_name: "Open Source", price: 0 },
            { plan_name: "Cloud", price: 20 }
        ]
    },
    {
        name: "Automata",
        description: "Plateforme d'agents IA spécialisée dans l'automatisation des tâches de développement logiciel et d'analyse de code, avec un focus sur la qualité et la sécurité.",
        website_url: "https://github.com/emrgnt-cmplxty/automata",
        category: "Développement",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "AutoPR",
        description: "Agent IA qui automatise la création et la gestion des Pull Requests sur GitHub, en analysant le code et en suggérant des améliorations.",
        website_url: "https://github.com/irgolic/AutoPR",
        category: "Développement",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "BabyAGI",
        description: "Framework simple pour la gestion des tâches utilisant l'IA. Crée et priorise automatiquement des tâches basées sur un objectif prédéfini, utilisant GPT-3.5/4 et la recherche vectorielle Pinecone.",
        website_url: "https://github.com/yoheinakajima/babyagi",
        category: "Gestion des Tâches",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "BabyBeeAGI",
        description: "Version améliorée de BabyAGI avec une gestion des tâches plus complexe, permettant une analyse et une synthèse plus complètes des informations.",
        website_url: "https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyBeeAGI.py",
        category: "Gestion des Tâches",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "BabyCatAGI",
        description: "Modification de BabyBeeAGI avec seulement 300 lignes de code. Inclut un agent de création de tâches unique, un agent d'exécution en boucle, et des outils de recherche et de complétion de texte.",
        website_url: "https://replit.com/@YoheiNakajima/BabyCatAGI",
        category: "Gestion des Tâches",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "BabyDeerAGI",
        description: "Version de BabyAGI avec environ 350 lignes de code, offrant des tâches parallèles, utilisant GPT-3.5-turbo, et incluant des outils de saisie utilisateur et de recherche web améliorée.",
        website_url: "https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyDeerAGI.py",
        category: "Gestion des Tâches",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "BabyElfAGI",
        description: "Évolution de BabyDeerAGI avec environ 895 lignes de code. Inclut une classe de compétences personnalisables, une liste de tâches dynamique avec recherche vectorielle, et un agent de réflexion beta.",
        website_url: "https://github.com/yoheinakajima/babyagi/blob/main/classic/BabyElfAGI/main.py",
        category: "Gestion des Tâches",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "BabyCommandAGI",
        description: "Agent conçu pour tester la combinaison entre CLI et LLM. Peut exécuter des commandes shell et automatiser la programmation et la configuration d'environnements.",
        website_url: "https://github.com/saten-private/BabyCommandAGI",
        category: "Automatisation",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "BabyFoxAGI",
        description: "Version modifiée de BabyElfAGI avec une nouvelle interface utilisateur parallèle et des listes de tâches auto-améliorantes. Inclut des compétences DALL-E, un lecteur de musique et un analyste de startups.",
        website_url: "https://github.com/yoheinakajima/babyagi/tree/main/classic/babyfoxagi",
        category: "Gestion des Tâches",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    },
    {
        name: "BambooAI",
        description: "Plateforme de données pour non-programmeurs. Utilise différents modèles d'IA pour décomposer les tâches et générer du code Python pour l'analyse.",
        website_url: "https://github.com/pgalko/BambooAI",
        category: "Analyse de Données",
        pricing: [{ plan_name: "Open Source", price: 0 }]
    }
];

// Deuxième partie des outils
export const aiToolsPart2 = [
    {
        name: "GitHub Copilot",
        description: "Assistant de programmation IA qui suggère du code et des fonctions complètes directement dans votre éditeur.",
        website_url: "https://github.com/features/copilot",
        category: "Génération de Code",
        pricing: [{ plan_name: "Individual", price: 10 }]
    },
    {
        name: "Claude",
        description: "Assistant IA développé par Anthropic, connu pour sa précision et sa capacité à traiter de longs textes.",
        website_url: "https://claude.ai/",
        category: "Chatbots & Assistants",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Pro", price: 20 }
        ]
    },
    {
        name: "Stable Diffusion",
        description: "Modèle open source de génération d'images par IA, permettant de créer des images détaillées à partir de descriptions.",
        website_url: "https://stability.ai/",
        category: "Génération d'Images",
        pricing: [{ plan_name: "Free", price: 0 }]
    },
    {
        name: "Jasper",
        description: "Plateforme d'écriture IA pour créer du contenu marketing, des articles et des copies publicitaires.",
        website_url: "https://www.jasper.ai/",
        category: "Génération de Texte",
        pricing: [{ plan_name: "Creator", price: 39 }]
    },
    {
        name: "Codeium",
        description: "Alternative à GitHub Copilot, offrant des suggestions de code et une assistance à la programmation.",
        website_url: "https://codeium.com/",
        category: "Génération de Code",
        pricing: [{ plan_name: "Free", price: 0 }]
    },
    {
        name: "Runway",
        description: "Suite d'outils créatifs alimentés par l'IA pour l'édition vidéo, les effets spéciaux et la génération de contenu.",
        website_url: "https://runway.ml/",
        category: "Vidéo",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Pro", price: 15 }
        ]
    },
    {
        name: "Murf",
        description: "Studio de voix IA permettant de créer des voix off naturelles dans plusieurs langues et accents.",
        website_url: "https://murf.ai/",
        category: "Audio & Voix",
        pricing: [{ plan_name: "Basic", price: 29 }]
    },
    {
        name: "Microsoft Designer",
        description: "Outil de design IA qui aide à créer des visuels professionnels pour les réseaux sociaux et le marketing.",
        website_url: "https://designer.microsoft.com/",
        category: "Design",
        pricing: [{ plan_name: "Free", price: 0 }]
    },
    {
        name: "Mem AI",
        description: "Assistant de prise de notes et d'organisation qui utilise l'IA pour connecter et organiser vos informations.",
        website_url: "https://mem.ai/",
        category: "Productivité",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Pro", price: 10 }
        ]
    },
    {
        name: "Elicit",
        description: "Assistant de recherche IA qui aide à trouver, analyser et synthétiser des articles scientifiques.",
        website_url: "https://elicit.org/",
        category: "Recherche & Analyse",
        pricing: [{ plan_name: "Free Beta", price: 0 }]
    }
];

// Troisième partie des outils
export const aiToolsPart3 = [
    {
        name: "Perplexity AI",
        description: "Moteur de recherche alimenté par l'IA qui fournit des réponses détaillées avec des citations et des sources.",
        website_url: "https://www.perplexity.ai/",
        category: "Recherche & Analyse",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Pro", price: 20 }
        ]
    },
    {
        name: "Copy.ai",
        description: "Outil d'écriture IA pour créer du contenu marketing, des emails et des descriptions de produits.",
        website_url: "https://www.copy.ai/",
        category: "Génération de Texte",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Pro", price: 36 }
        ]
    },
    {
        name: "Character.ai",
        description: "Plateforme permettant de créer et d'interagir avec des personnages IA personnalisés.",
        website_url: "https://character.ai/",
        category: "Chatbots & Assistants",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Plus", price: 10 }
        ]
    },
    {
        name: "Gamma",
        description: "Plateforme de présentation alimentée par l'IA pour créer des présentations professionnelles rapidement.",
        website_url: "https://gamma.app/",
        category: "Productivité",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Pro", price: 10 }
        ]
    },
    {
        name: "Consensus",
        description: "Moteur de recherche IA spécialisé dans la littérature scientifique et académique.",
        website_url: "https://consensus.app/",
        category: "Recherche & Analyse",
        pricing: [{ plan_name: "Free Beta", price: 0 }]
    }
];

// Quatrième partie des outils (Outils de développement spécialisés)
export const aiToolsPart4 = [
    {
        name: "Tabnine",
        description: "Assistant de codage IA qui fournit des suggestions de code contextuelles dans votre IDE.",
        website_url: "https://www.tabnine.com/",
        category: "Génération de Code",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Pro", price: 12 }
        ]
    },
    {
        name: "CodeWhisperer",
        description: "Service d'Amazon qui génère des suggestions de code en temps réel basées sur vos commentaires et code existant.",
        website_url: "https://aws.amazon.com/codewhisperer/",
        category: "Génération de Code",
        pricing: [{ plan_name: "Individual", price: 0 }]
    },
    {
        name: "Replit Ghostwriter",
        description: "Assistant de programmation intégré à Replit qui aide à expliquer, déboguer et générer du code.",
        website_url: "https://replit.com/site/ghostwriter",
        category: "Génération de Code",
        pricing: [{ plan_name: "With Replit", price: 10 }]
    },
    {
        name: "Cursor",
        description: "Éditeur de code avec IA intégrée pour l'aide à la programmation et la génération de code.",
        website_url: "https://cursor.sh/",
        category: "Génération de Code",
        pricing: [{ plan_name: "Free", price: 0 }]
    }
];

// Cinquième partie des outils (Outils créatifs et de design)
export const aiToolsPart5 = [
    {
        name: "Leonardo.ai",
        description: "Plateforme de génération d'images IA spécialisée dans la création d'assets pour les jeux et applications.",
        website_url: "https://leonardo.ai/",
        category: "Génération d'Images",
        pricing: [
            { plan_name: "Free", price: 0 },
            { plan_name: "Pro", price: 10 }
        ]
    },
    {
        name: "Firefly",
        description: "Outil de création d'images IA d'Adobe intégré à Creative Cloud.",
        website_url: "https://www.adobe.com/sensei/generative-ai/firefly.html",
        category: "Génération d'Images",
        pricing: [{ plan_name: "Creative Cloud", price: 0 }]
    },
    {
        name: "tinybio",
        description: "Assistant IA pour la génération et l'optimisation de biographies professionnelles sur les réseaux sociaux.",
        website_url: "https://tinybio.io/",
        category: "Génération de Texte",
        pricing: [{ plan_name: "Free", price: 0 }]
    },
    {
        name: "D-ID",
        description: "Plateforme pour créer des vidéos avec des avatars IA parlants à partir de photos.",
        website_url: "https://www.d-id.com/",
        category: "Vidéo",
        pricing: [{ plan_name: "Creator", price: 5.99 }]
    },
    {
        name: "Heygen",
        description: "Plateforme de création de vidéos IA avec des avatars personnalisés pour la formation et le marketing.",
        website_url: "https://www.heygen.com/",
        category: "Vidéo",
        pricing: [{ plan_name: "Creator", price: 25 }]
    }
];

// Sixième partie des outils (Nouveaux outils)
export const aiToolsPart6 = [
    {
        name: "tinybio",
        description: "Assistant IA pour la génération et l'optimisation de biographies professionnelles sur les réseaux sociaux.",
        website_url: "https://tinybio.io/",
        category: "Génération de Texte",
        pricing: [{ plan_name: "Free", price: 0 }]
    },
    {
        name: "NoteWizard",
        description: "Assistant IA pour la prise de notes intelligente et l'organisation automatique des informations.",
        website_url: "https://notewizard.app/",
        category: "Productivité",
        pricing: [{ plan_name: "Free Beta", price: 0 }]
    }
];
