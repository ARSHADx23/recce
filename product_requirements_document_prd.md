# Product Requirements Document (PRD)

## 1. Product Overview

### 1.1 Product Name
Working title (can be changed later): **Answer-first Editorial Platform**

### 1.2 Product Summary
This product is a **human-written, editorial, answer-first content platform** designed to:
- Rank highly on Google SERPs
- Be reliably picked up and cited by Google AI Mode / AI Overviews
- Deliver long, structured, satisfying answers to complex real‑world questions
- Drive large-scale organic traffic
- Monetize primarily through ads without harming user experience

The platform is **not** a traditional blog, not a content farm, and not an AI-generated site. Articles and answers are written, structured, and curated manually by a single admin through a CMS.

---

## 2. Core Goals & Success Metrics

### 2.1 Primary Goals
1. High organic visibility on Google Search
2. Inclusion in Google AI summaries for relevant queries
3. Long dwell time and strong reading satisfaction
4. Sustainable ad-based monetization
5. Strong internal authority within selected topical domains

### 2.2 Success Metrics (KPIs)
- Average ranking position for target queries
- Number of pages cited in AI Overviews
- Organic sessions (MoM growth)
- Average session duration
- Scroll depth
- Pages per session
- Ad revenue per 1,000 sessions

---

## 3. Target Users

### 3.1 Reader (Public User)
- No login, no account
- Visits from Google Search, Discover, Web Stories
- Intent-driven (looking for answers or explanations)
- Values clarity, depth, neutrality, and trust

Capabilities:
- Read content
- Search
- Like content
- Bookmark content
- Post comments (named or anonymous)

Restrictions:
- No profile
- No posting content
- No moderation powers

### 3.2 Admin (Single User)
- Full system access via /admin
- Responsible for all content and moderation

Capabilities:
- Create, edit, publish, update content
- Manage homepage sections
- Moderate comments
- Manage categories and settings

---

## 4. Content Architecture

### 4.1 Content Types

#### A. Question Pages (Primary Asset)
Purpose:
- Answer **one exact complex question per page**
- Optimized for AI extraction and SERP features

Structure:
1. Short direct answer (40–70 words)
2. Expanded explanation with H2/H3 sections
3. Examples or scenarios
4. Steps / breakdowns / pros & cons (when relevant)
5. FAQ section
6. Concise summary

Rules:
- One intent per page
- Neutral, structured tone
- No fluff

---

#### B. Blog Articles (Discovery & Context)
Purpose:
- Capture trending searches
- Provide analysis, narrative, and broader context
- Feed traffic into Question pages

Characteristics:
- Discovery-oriented
- Can be opinionated but grounded
- Not optimized for one single question

Rules:
- Blogs and Questions may cover overlapping knowledge
- Text must never be identical
- Intent, structure, and presentation must differ

---

#### C. Google Web Stories
Purpose:
- Capture Google Discover and Stories traffic
- Act as traffic funnels

Characteristics:
- Short, visual, swipe-based
- Always link back to a Blog or Question page

---

## 5. Information Architecture & Navigation

### 5.1 Main Sections
- Home
- Explore
- Blogs
- Questions
- Stories
- Bookmarks
- Likes
- Settings

### 5.2 Search
- Available globally
- Inline expanding search (no button)
- Line-by-line suggestions

---

## 6. UI / UX Requirements

### 6.1 Design Principles
- Human-first
- Reading-first
- Editorial, not social
- Calm, minimal, confident
- Zero "AI-generated" visual cues

---

### 6.2 Typography (Locked)
- **Syne**: Headings & subheadings
- **Inter**: Body text
- **Space Mono**: Footer, menu labels, metadata

Body text specs:
- Font size: 18.5–19px
- Line height: 1.8–1.9
- Short paragraphs (3–4 lines)

---

### 6.3 Color System (Locked)
- **Graphite**: Backgrounds, layout structure
- **Parchment**: Primary text color
- **Cherry Rose**: Accent only (links, highlights, UI focus)

- Supports Light / Dark / System themes
- Cherry Rose used sparingly

---

### 6.4 Layout

#### Desktop
- 3-column layout:
  - Left: Persistent menu
  - Center: Main reading content (720–760px)
  - Right: Suggested content + ads (visually muted)

#### Mobile
- Header: Logo (left), search, menu (right)
- Slide-in navigation from right
- Full-width content

---

## 7. Comment System

- No login required
- Immediate publishing
- Name or anonymous
- Admin can delete any comment

Anti-spam:
- Rate limiting
- Honeypot field
- Basic text checks

No CAPTCHA initially

---

## 8. Cookie-Based Personalization

### 8.1 Consent-Based
- Explicit cookie consent required
- Fully functional site without cookies

### 8.2 If Cookies Allowed
Store:
- Reading history
- Search history
- Likes
- Bookmarks
- Theme preference

Used for:
- Suggested content
- Continue reading
- Content ordering

### 8.3 If Cookies Denied
- Suggestions based on:
  - Most read
  - Trending
  - Editor’s Picks

---

## 9. Homepage Management

### 9.1 Hero Slider
- Automatic (latest content) OR
- Manual (admin-selected, ordered)

### 9.2 Editor’s Picks
- Flag-based
- Manually ordered

### 9.3 Category Sections
- Per-category toggle:
  - Automatic
  - Manual

---

## 10. CMS / Admin System

### 10.1 Access
- /admin route
- Server-protected
- Not indexed

### 10.2 Admin Sections
- Dashboard
- Blogs
- Questions
- Stories
- Homepage Manager
- Categories
- Comments
- Newsletter
- Media Library
- Settings

---

## 11. Content Editor

### 11.1 Editor Type
- Block + rich hybrid (Notion / Medium-like)

### 11.2 Supported Blocks
- Paragraph
- H2 / H3
- Image
- Video embed
- Quote box
- Info box (summary, key insight, warning)
- Lists
- Divider
- Internal links

---

## 12. Suggested Content Logic

### With Cookies
- Reading history
- Search history
- Category interest
- Editor’s Picks

### Without Cookies
- Most read
- Trending
- Editor’s Picks

---

## 13. Monetization

- Ads placed:
  - After first meaningful section
  - Between sections
  - Right sidebar (desktop)

Restrictions:
- No intrusive popups
- No autoplay media
- No excessive above-the-fold ads

---

## 14. SEO & AI Readiness

- One intent per page
- Structured headings
- Clear summaries
- FAQ schema where applicable
- Internal linking
- Content update tracking

Built for:
- Google SERPs
- Google AI Mode
- Long-term topical authority

---

## 15. Non-Functional Requirements

- Fast load times
- Excellent Core Web Vitals
- Mobile-first responsiveness
- Accessibility-friendly typography
- Scalable content architecture

---

## 16. Constraints & Assumptions

- Single admin
- No public user accounts
- Firebase used for database and services
- Code generated and managed via MCP servers

---

## 17. Final Definition

This product is a **solo, editorial, answer-first knowledge platform** that:
- Is written by a human
- Readable and trusted by AI
- Optimized for SEO
- Calm, satisfying, and timeless
- Built to scale without bloat

This PRD defines the complete scope and behavior of the system.

