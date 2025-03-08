import { LucideProps } from 'lucide-react';

export function Lemon(props: LucideProps) {
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
      <path 
        d="M12 6 L18 12 A6 6 0 1 1 12 6" 
        fill="currentColor"
        fillOpacity="0.2"
      />
      <path 
        d="M12 6 L18 12 A6 6 0 1 1 12 6"
        fill="none"
      />
      <path 
        d="M12 6 L12 12 M12 12 L15 9 M12 12 L9 9 M12 12 L15 15 M12 12 L9 15"
        fill="none"
      />
    </svg>
  );
}
