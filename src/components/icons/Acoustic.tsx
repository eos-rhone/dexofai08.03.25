import { LucideProps } from 'lucide-react';

export function Acoustic(props: LucideProps) {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      {...props}
    >
      {/* Casque */}
      <path d="M3 14h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-5Z" />
      <path d="M21 14h-3a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1a2 2 0 0 0 2-2v-5Z" />
      <path d="M4 14v-3a8 8 0 0 1 16 0v3" />
      
      {/* Ondes sonores */}
      <path d="M8 15 C 6 15, 6 13, 8 13" strokeDasharray="0.5 1" />
      <path d="M16 15 C 18 15, 18 13, 16 13" strokeDasharray="0.5 1" />
      <path d="M10 16 C 7 16, 7 12, 10 12" strokeDasharray="0.5 1" />
      <path d="M14 16 C 17 16, 17 12, 14 12" strokeDasharray="0.5 1" />
    </svg>
  );
}
