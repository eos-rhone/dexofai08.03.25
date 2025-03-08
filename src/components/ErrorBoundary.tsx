import { useRouteError, isRouteErrorResponse, Link } from 'react-router-dom';
import { AlertTriangle, Home } from 'lucide-react';

export function ErrorBoundary() {
  const error = useRouteError();
  
  if (isRouteErrorResponse(error)) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-900">
        <div className="max-w-md w-full p-8 bg-gray-800 rounded-lg shadow-xl">
          <div className="flex flex-col items-center gap-4">
            <AlertTriangle className="w-16 h-16 text-yellow-500" />
            <h1 className="text-2xl font-bold text-white">
              {error.status === 404 ? 'Page non trouvée' : 'Une erreur est survenue'}
            </h1>
            <p className="text-gray-400 text-center">
              {error.status === 404
                ? "La page que vous recherchez n'existe pas ou a été déplacée."
                : "Quelque chose s'est mal passé. Veuillez réessayer plus tard."}
            </p>
            <Link
              to="/"
              className="mt-4 inline-flex items-center gap-2 px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors"
            >
              <Home className="w-4 h-4" />
              Retour à l'accueil
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-900">
      <div className="max-w-md w-full p-8 bg-gray-800 rounded-lg shadow-xl">
        <div className="flex flex-col items-center gap-4">
          <AlertTriangle className="w-16 h-16 text-red-500" />
          <h1 className="text-2xl font-bold text-white">Erreur inattendue</h1>
          <p className="text-gray-400 text-center">
            Une erreur inattendue s'est produite. Nos équipes ont été notifiées.
          </p>
          <Link
            to="/"
            className="mt-4 inline-flex items-center gap-2 px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors"
          >
            <Home className="w-4 h-4" />
            Retour à l'accueil
          </Link>
        </div>
      </div>
    </div>
  );
}
