import { 
  createBrowserRouter, 
  createRoutesFromElements, 
  Route 
} from 'react-router-dom';
import App from './App';
import Home from './pages/Home';
import Categories from './pages/Categories';
import Rankings from './pages/Rankings';
import { CategoryPage } from './pages/CategoryPage';
import { Assistant } from './pages/Assistant';
import { Learn } from './pages/Learn';
import { AIDetails } from './pages/AIDetails';
import { News } from './pages/News';
import { Forum } from './pages/Forum';
import { Publish } from './pages/Publish';
import { Newsletter } from './pages/Newsletter';
import { Contact } from './pages/Contact';
import { PolitiqueConfidentialite } from './pages/PolitiqueConfidentialite';
import { CGV } from './pages/CGV';
import { MentionsLegales } from './pages/MentionsLegales';
import { ThemeProvider } from './contexts/ThemeContext';
import { ErrorBoundary } from './components/ErrorBoundary';

// Configuration du router avec les routes
const router = createBrowserRouter([
  {
    path: "/",
    element: (
      <ThemeProvider>
        <App />
      </ThemeProvider>
    ),
    errorElement: <ErrorBoundary />,
    children: [
      { index: true, element: <Home /> },
      { path: "categories", element: <Categories /> },
      { path: "categories/:slug", element: <CategoryPage /> },
      { path: "classement", element: <Rankings /> },
      { path: "assistant", element: <Assistant /> },
      { path: "apprendre", element: <Learn /> },
      { path: "ai/:slug", element: <AIDetails /> },
      { path: "actualites", element: <News /> },
      { path: "forum", element: <Forum /> },
      { path: "publier", element: <Publish /> },
      { path: "rester-informe", element: <Newsletter /> },
      { path: "contact", element: <Contact /> },
      { path: "politique-confidentialite", element: <PolitiqueConfidentialite /> },
      { path: "mentions-legales", element: <MentionsLegales /> },
      { path: "cgv", element: <CGV /> }
    ]
  }
]);

export default router;
