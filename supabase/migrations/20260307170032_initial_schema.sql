-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Define custom enum types
CREATE TYPE display_type AS ENUM ('auto', 'manual');
CREATE TYPE content_status AS ENUM ('draft', 'published');
CREATE TYPE curation_section AS ENUM ('hero', 'editors_pick', 'category_feature');

-------------------------------------------------------------------
-- 1. Categories Table
-------------------------------------------------------------------
CREATE TABLE public.categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    display_type display_type DEFAULT 'auto',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-------------------------------------------------------------------
-- 2. Questions Table (Primary Asset)
-------------------------------------------------------------------
CREATE TABLE public.questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug TEXT UNIQUE NOT NULL,
    question TEXT NOT NULL,
    short_answer TEXT NOT NULL,
    content JSONB NOT NULL DEFAULT '{}'::jsonb,
    faqs JSONB DEFAULT '[]'::jsonb,
    summary TEXT,
    category_id UUID REFERENCES public.categories(id) ON DELETE SET NULL,
    status content_status DEFAULT 'draft',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Trigger for updated_at
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_timestamp_questions
BEFORE UPDATE ON public.questions
FOR EACH ROW
EXECUTE FUNCTION trigger_set_timestamp();

-------------------------------------------------------------------
-- 3. Blogs Table
-------------------------------------------------------------------
CREATE TABLE public.blogs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug TEXT UNIQUE NOT NULL,
    title TEXT NOT NULL,
    excerpt TEXT,
    content JSONB NOT NULL DEFAULT '{}'::jsonb,
    category_id UUID REFERENCES public.categories(id) ON DELETE SET NULL,
    status content_status DEFAULT 'draft',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TRIGGER set_timestamp_blogs
BEFORE UPDATE ON public.blogs
FOR EACH ROW
EXECUTE FUNCTION trigger_set_timestamp();

-------------------------------------------------------------------
-- 4. Stories Table (Google Web Stories)
-------------------------------------------------------------------
CREATE TABLE public.stories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug TEXT UNIQUE NOT NULL,
    title TEXT NOT NULL,
    pages JSONB NOT NULL DEFAULT '[]'::jsonb,
    linked_entity_type TEXT CHECK (linked_entity_type IN ('question', 'blog')),
    linked_entity_id UUID,
    status content_status DEFAULT 'draft',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TRIGGER set_timestamp_stories
BEFORE UPDATE ON public.stories
FOR EACH ROW
EXECUTE FUNCTION trigger_set_timestamp();

-------------------------------------------------------------------
-- 5. Comments Table
-------------------------------------------------------------------
CREATE TABLE public.comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    entity_type TEXT CHECK (entity_type IN ('question', 'blog')) NOT NULL,
    entity_id UUID NOT NULL,
    author_name TEXT,
    content TEXT NOT NULL,
    is_approved BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-------------------------------------------------------------------
-- 6. Homepage Curation
-------------------------------------------------------------------
CREATE TABLE public.homepage_curation (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    section curation_section NOT NULL,
    entity_type TEXT CHECK (entity_type IN ('question', 'blog', 'story', 'category')) NOT NULL,
    entity_id UUID NOT NULL,
    sort_order INTEGER DEFAULT 0
);

-------------------------------------------------------------------
-- Row Level Security (RLS)
-------------------------------------------------------------------

-- Enable RLS on all tables
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.blogs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.stories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.homepage_curation ENABLE ROW LEVEL SECURITY;

-- ADMIN POLICIES (Full Access for authenticated users)
CREATE POLICY "Admin All Access - Categories" ON public.categories FOR ALL TO authenticated USING (true);
CREATE POLICY "Admin All Access - Questions" ON public.questions FOR ALL TO authenticated USING (true);
CREATE POLICY "Admin All Access - Blogs" ON public.blogs FOR ALL TO authenticated USING (true);
CREATE POLICY "Admin All Access - Stories" ON public.stories FOR ALL TO authenticated USING (true);
CREATE POLICY "Admin All Access - Comments" ON public.comments FOR ALL TO authenticated USING (true);
CREATE POLICY "Admin All Access - Homepage Curation" ON public.homepage_curation FOR ALL TO authenticated USING (true);


-- PUBLIC POLICIES (Read-only for published content, Insert for comments)
CREATE POLICY "Public Read Categories" ON public.categories FOR SELECT TO anon USING (true);
CREATE POLICY "Public Read Published Questions" ON public.questions FOR SELECT TO anon USING (status = 'published');
CREATE POLICY "Public Read Published Blogs" ON public.blogs FOR SELECT TO anon USING (status = 'published');
CREATE POLICY "Public Read Published Stories" ON public.stories FOR SELECT TO anon USING (status = 'published');
CREATE POLICY "Public Read Homepage Curation" ON public.homepage_curation FOR SELECT TO anon USING (true);

-- Comments: Public can see approved comments, and public can insert new comments
CREATE POLICY "Public Read Approved Comments" ON public.comments FOR SELECT TO anon USING (is_approved = true);
CREATE POLICY "Public Insert Comments" ON public.comments FOR INSERT TO anon WITH CHECK (true);
