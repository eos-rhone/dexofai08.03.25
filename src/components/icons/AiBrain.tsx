import { LucideProps } from 'lucide-react';

export function AiBrain(props: LucideProps) {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      {...props}
    >
      {/* Cercle central avec AI */}
      <circle cx="12" cy="12" r="4" fill="white" stroke="currentColor" />
      <text
        x="12"
        y="13.5"
        fontSize="5"
        textAnchor="middle"
        fill="currentColor"
        style={{ fontWeight: 'bold' }}
      >
        AI
      </text>

      {/* Partie gauche (technologique) */}
      <path
        d="M8 12 C4 12 4 8 8 8"
        stroke="currentColor"
        fill="#87CEEB"
        fillOpacity="0.2"
      />
      <circle cx="5" cy="10" r="1" fill="#90EE90" stroke="currentColor" />
      <path
        d="M8 12 C4 12 4 16 8 16"
        stroke="currentColor"
        fill="#87CEEB"
        fillOpacity="0.2"
      />
      <circle cx="5" cy="14" r="1" fill="#90EE90" stroke="currentColor" />

      {/* Partie droite (organique) */}
      <path
        d="M16 12 C20 12 20 8 16 8"
        stroke="currentColor"
        fill="#FFB6C1"
        fillOpacity="0.2"
      />
      <path
        d="M16 12 C20 12 20 16 16 16"
        stroke="currentColor"
        fill="#FFB6C1"
        fillOpacity="0.2"
      />
      <path
        d="M17 9 Q18 9 19 10"
        stroke="currentColor"
      />
      <path
        d="M17 15 Q18 15 19 14"
        stroke="currentColor"
      />
    </svg>
  );
}
