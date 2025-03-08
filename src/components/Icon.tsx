import { LucideIcon } from 'lucide-react';
import { cn } from '../lib/utils';

interface IconProps {
  icon: LucideIcon;
  size?: number;
  className?: string;
  variant?: 'default' | 'primary' | 'secondary' | 'success' | 'warning' | 'danger';
}

const variantStyles = {
  default: 'text-gray-600 dark:text-gray-400',
  primary: 'text-blue-600 dark:text-blue-400',
  secondary: 'text-purple-600 dark:text-purple-400',
  success: 'text-green-600 dark:text-green-400',
  warning: 'text-yellow-600 dark:text-yellow-400',
  danger: 'text-red-600 dark:text-red-400',
};

export function Icon({ icon: IconComponent, size = 24, className, variant = 'default' }: IconProps) {
  return (
    <IconComponent 
      size={size}
      className={cn(
        'transition-colors duration-200',
        className || variantStyles[variant]
      )}
    />
  );
}
