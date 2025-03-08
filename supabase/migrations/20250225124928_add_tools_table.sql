-- Create the tools table
create table if not exists public.tools (
    id uuid default gen_random_uuid() primary key,
    name text not null,
    description text,
    website_url text,
    image_url text,
    monthly_users integer default 0,
    is_verified boolean default false,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null,
    updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create the pricing table for flexible pricing plans
create table if not exists public.tool_pricing (
    id uuid default gen_random_uuid() primary key,
    tool_id uuid references public.tools(id) on delete cascade,
    plan_name text not null,
    price numeric,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create the categories table
create table if not exists public.categories (
    id uuid default gen_random_uuid() primary key,
    name text not null unique,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create the tool_categories junction table
create table if not exists public.tool_categories (
    tool_id uuid references public.tools(id) on delete cascade,
    category_id uuid references public.categories(id) on delete cascade,
    primary key (tool_id, category_id)
);

-- Create the tags table
create table if not exists public.tags (
    id uuid default gen_random_uuid() primary key,
    name text not null unique,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create the tool_tags junction table
create table if not exists public.tool_tags (
    tool_id uuid references public.tools(id) on delete cascade,
    tag_id uuid references public.tags(id) on delete cascade,
    primary key (tool_id, tag_id)
);

-- Add indexes for better performance
create index if not exists tools_name_idx on public.tools(name);
create index if not exists tools_monthly_users_idx on public.tools(monthly_users);
create index if not exists categories_name_idx on public.categories(name);
create index if not exists tags_name_idx on public.tags(name);

-- Add RLS policies
alter table public.tools enable row level security;
alter table public.tool_pricing enable row level security;
alter table public.categories enable row level security;
alter table public.tool_categories enable row level security;
alter table public.tags enable row level security;
alter table public.tool_tags enable row level security;

-- Create policies
create policy "Allow public read access" on public.tools
    for select using (true);

create policy "Allow public read access" on public.tool_pricing
    for select using (true);

create policy "Allow public read access" on public.categories
    for select using (true);

create policy "Allow public read access" on public.tool_categories
    for select using (true);

create policy "Allow public read access" on public.tags
    for select using (true);

create policy "Allow public read access" on public.tool_tags
    for select using (true);

-- Create function to update updated_at timestamp
create or replace function public.handle_updated_at()
returns trigger as $$
begin
    new.updated_at = timezone('utc'::text, now());
    return new;
end;
$$ language plpgsql;

-- Create trigger for updated_at
create trigger handle_tools_updated_at
    before update on public.tools
    for each row
    execute function public.handle_updated_at();
