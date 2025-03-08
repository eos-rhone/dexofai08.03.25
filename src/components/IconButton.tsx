import { LucideIcon } from 'lucide-react';
import { cn } from '../lib/utils';

interface IconButtonProps {
  icon: LucideIcon;
  label?: string;
  onClick?: () => void;
  size?: 'sm' | 'md' | 'lg';
  variant?: 'solid' | 'outline' | 'ghost';
  color?: 'primary' | 'secondary' | 'success' | 'warning' | 'danger';
  className?: string;
  disabled?: boolean;
}

const sizeStyles = {
  sm: 'p-1.5 text-sm',
  md: 'p-2 text-base',
  lg: 'p-2.5 text-lg',
};

const variantStyles = {
  solid: {
    primary: 'bg-blue-600 hover:bg-blue-700 text-white',
    secondary: 'bg-purple-600 hover:bg-purple-700 text-white',
    success: 'bg-green-600 hover:bg-green-700 text-white',
    warning: 'bg-yellow-600 hover:bg-yellow-700 text-white',
    danger: 'bg-red-600 hover:bg-red-700 text-white',
  },
  outline: {
    primary: 'border-2 border-blue-600 text-blue-600 hover:bg-blue-50 dark:hover:bg-blue-900/20',
    secondary: 'border-2 border-purple-600 text-purple-600 hover:bg-purple-50 dark:hover:bg-purple-900/20',
    success: 'border-2 border-green-600 text-green-600 hover:bg-green-50 dark:hover:bg-green-900/20',
    warning: 'border-2 border-yellow-600 text-yellow-600 hover:bg-yellow-50 dark:hover:bg-yellow-900/20',
    danger: 'border-2 border-red-600 text-red-600 hover:bg-red-50 dark:hover:bg-red-900/20',
  },
  ghost: {
    primary: 'text-blue-600 hover:bg-blue-50 dark:hover:bg-blue-900/20',
    secondary: 'text-purple-600 hover:bg-purple-50 dark:hover:bg-purple-900/20',
    success: 'text-green-600 hover:bg-green-50 dark:hover:bg-green-900/20',
    warning: 'text-yellow-600 hover:bg-yellow-50 dark:hover:bg-yellow-900/20',
    danger: 'text-red-600 hover:bg-red-50 dark:hover:bg-red-900/20',
  },
};

export function IconButton({
  icon: IconComponent,
  label,
  onClick,
  size = 'md',
  variant = 'solid',
  color = 'primary',
  className,
  disabled = false,
}: IconButtonProps) {
  return (
    <button
      onClick={onClick}
      disabled={disabled}
      className={cn(
        'rounded-lg transition-colors duration-200 inline-flex items-center gap-2',
        sizeStyles[size],
        variantStyles[variant][color],
        disabled && 'opacity-50 cursor-not-allowed',
        className
      )}
    >
      <IconComponent size={size === 'sm' ? 16 : size === 'md' ? 20 : 24} />
      {label && <span>{label}</span>}
    </button>
  );
}
