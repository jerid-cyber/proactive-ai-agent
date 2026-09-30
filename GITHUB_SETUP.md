# GitHub Setup — Copy & Paste Kit

Everything you need to publish this repository and make its value obvious at a glance.

---

## 1. Create the repository

1. Go to **github.com → New repository**.
2. **Repository name:** `proactive-agent`
3. **Description:** paste the one-liner from section 2.
4. Visibility: **Public** (so others can find and use it).
5. Do **not** add a README, license, or .gitignore — this repo already has them.
6. Click **Create repository**.

### Upload option A — drag and drop (no command line)

1. On the new empty repo page, click **uploading an existing file**.
2. Unzip `proactive-agent-github.zip` on your computer.
3. Open the unzipped `proactive-agent` folder, select **everything inside it** (including the `.github` folder — on Mac press `Cmd+Shift+.` to show hidden files), and drag it into the browser.
4. Commit message: `Initial release v1.1.0`
5. Click **Commit changes**.

### Upload option B — command line

```bash
cd proactive-agent
git init
git add .
git commit -m "Initial release v1.1.0"
git branch -M main
git remote add origin https://github.com/<your-username>/proactive-agent.git
git push -u origin main
```

---

## 2. Repository description (the "About" box, max 350 characters)

**Recommended:**

> A Claude Skill that turns a plain-English goal into a scheduled, self-directed AI agent. It picks its own next task, acts within a 4-tier safety policy, queues risky actions for approval, verifies results, never double-sends, and learns from your feedback. No code required.

**Shorter alternative:**

> Put any recurring business outcome on autopilot with Claude — scheduled, safe, self-directed, and auditable. No code.

**Website field:** your site (e.g. `https://titanonerealty.com`) or leave blank.

---

## 3. Topics (tags)

Add these in **About → ⚙ → Topics** (GitHub allows up to 20):

```
claude  claude-skill  anthropic  ai-agent  autonomous-agent  agentic-ai
proactive-agent  ai-automation  workflow-automation  business-automation
no-code  scheduled-tasks  human-in-the-loop  ai-safety  lead-management
sales-automation  crm-automation  real-estate  productivity  llm
```

---

## 4. First release

1. Go to **Releases → Draft a new release**.
2. **Tag:** `v1.1.0` (create new tag on publish).
3. **Title:** `Proactive Agent v1.1.0`
4. **Attach binary:** drag in `dist/proactive-agent.skill` so people can download it directly.
5. **Release notes** — paste:

```markdown
## Proactive Agent v1.1.0

Turn any recurring outcome into a scheduled, self-directed Claude agent that stays inside the limits you set.

### Highlights
- **Three modes:** Setup, Run Cycle, and new **Maintain** (review, pause, graduate, demote, retire, compact)
- **4-tier authority policy** by risk and reversibility; anything unlisted requires approval
- **Shadow mode + graduation:** earns autonomy one action type at a time
- **Idempotent actions:** action keys + append-only log prevent duplicate sends
- **Evidence-based completion** and check-before-retry error handling
- **Prompt-injection resistant:** monitored content is data, never instructions
- **Lessons:** learns from approvals, edits, and rejections, with no fine-tuning
- **30-second digests** with the key measure up front

### Install
Download `proactive-agent.skill` below → Claude → Settings → Capabilities → Skills → Upload.

### Docs
See the README and `docs/INSTRUCTION_MANUAL.md`.
```

6. Click **Publish release**.

---

## 5. Social preview image (optional but recommended)

**Settings → General → Social preview → Upload an image** (1280×640 px).
Suggested text for the image:

> **Proactive Agent**
> Your goals. On autopilot. Inside your limits.
> A Claude Skill · No code

---

## 6. Pin it

On your GitHub profile, click **Customize your pins** and pin `proactive-agent` so visitors see it first.

---

## 7. Share it (sample post)

> I just open-sourced **Proactive Agent**, a Claude Skill that turns a goal like "every new lead gets a reply in 15 minutes" into a scheduled AI agent that works without being asked.
>
> It picks its own next task, drafts and queues anything risky for one-click approval, never double-sends, and learns from every edit you make. It starts supervised and earns autonomy one action at a time.
>
> Free, MIT-licensed, no code: github.com/<your-username>/proactive-agent
