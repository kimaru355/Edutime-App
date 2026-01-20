
### 2. CONTRIBUTING.md

```markdown
# Contributing to Edutime

Thank you for considering contributing to Edutime! 🎉  
This project is mainly built **by students for students** at Chuka University — every bit of help is valuable.

## Ways to Contribute

- Reporting bugs 🐛
- Suggesting new features 💡
- Improving documentation ✍️
- Fixing typos or UI/UX issues
- Writing tests
- Implementing small/medium features (especially good first issues)
- Helping test on real devices

## Before You Start

1. **Search** existing [issues](https://github.com/your-org/edutime/issues) and [discussions](https://github.com/your-org/edutime/discussions) — your question or bug might already be known.
2. If it's new → feel free to open an issue first (especially for big changes).

## Development Workflow

```bash
# 1. Fork the repo on GitHub

# 2. Clone your fork
git clone https://github.com/<your-username>/edutime.git
cd edutime

# 3. Add upstream (optional but recommended)
git remote add upstream https://github.com/your-org/edutime.git

# 4. Create a feature branch (use conventional naming)
git checkout -b feat/offline-venue-search
# or fix/crash-on-past-date
# or docs/improve-supabase-setup

# 5. Make changes

# 6. Commit using Conventional Commits
git commit -m "feat: add venue availability checker offline"
# or "fix: handle null venue in lecture model"
# or "docs: clarify Firebase token refresh"

# 7. Push
git push origin feat/offline-venue-search

# 8. Open Pull Request against main