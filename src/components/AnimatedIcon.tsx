import { LucideIcon } from 'lucide-react';
import { cn } from '../lib/utils';

interface AnimatedIconProps {
  icon: LucideIcon;
  size?: number;
  className?: string;
  animation?: 'pulse' | 'bounce' | 'spin' | 'ping';
}

const animationStyles = {
  pulse: 'animate-pulse',
  bounce: 'animate-bounce',
  spin: 'animate-spin',
  ping: 'animate-ping',
};

export function AnimatedIcon({ 
  icon: IconComponent, 
  size = 24, 
  className,
  animation = 'pulse'
}: AnimatedIconProps) {
  return (
    <div className={cn(
      'inline-flex',
      animation && animationStyles[animation],
      className
    )}>
      <IconComponent size={size} />
    </div>
  );
}
