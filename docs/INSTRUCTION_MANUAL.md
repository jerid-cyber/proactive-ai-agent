# Proactive Agent — Instruction Manual

This manual walks you from zero to a running, safe, self-directed agent. No coding required.

## Contents

1. [Before you start](#1-before-you-start)
2. [Install the skill](#2-install-the-skill)
3. [Connect your apps](#3-connect-your-apps)
4. [Choose where the mission file lives](#4-choose-where-the-mission-file-lives)
5. [Run Setup](#5-run-setup)
6. [Understand the mission file](#6-understand-the-mission-file)
7. [Shadow mode and approvals](#7-shadow-mode-and-approvals)
8. [Reading the digest](#8-reading-the-digest)
9. [Graduating actions to autopilot](#9-graduating-actions-to-autopilot)
10. [Maintaining a mission](#10-maintaining-a-mission)
11. [Pausing, resuming, and retiring](#11-pausing-resuming-and-retiring)
12. [Writing a great charter](#12-writing-a-great-charter)
13. [Compliance and safety checklist](#13-compliance-and-safety-checklist)
14. [Command cheat sheet](#14-command-cheat-sheet)
15. [Troubleshooting](#15-troubleshooting)

---

## 1. Before you start

You need:

| Requirement | Why |
|---|---|
| A Claude plan with Skills enabled | To install the skill |
| Scheduled tasks available in your Claude app | The heartbeat that runs cycles without you |
| At least one connected app (e.g. Gmail) | The agent's "hands" |
| A durable storage location (Google Drive, Notion, or a connected folder) | The agent's memory between runs |

Have ready: the one outcome you want handled, how you'd measure it, and a rough idea of which actions you're comfortable automating.

## 2. Install the skill

**Option A — upload the package (easiest)**

1. Download `dist/proactive-agent.skill` from this repository.
2. In Claude, go to **Settings → Capabilities → Skills** (menu names can vary by app version).
3. Choose **Upload skill** and select the file.
4. Confirm the skill appears in your list and is enabled.

**Option B — build from source**

```bash
git clone https://github.com/<your-username>/proactive-agent.git
cd proactive-agent
./scripts/build.sh          # creates dist/proactive-agent.skill
```

Then upload as in Option A.

> A `.skill` file is a standard zip archive containing the `proactive-agent/` folder (`SKILL.md` plus `references/`).

## 3. Connect your apps

Connect only what the mission needs. Fewer connections = smaller blast radius.

| Mission type | Typical connections |
|---|---|
| Lead response | Gmail, CRM, Google Calendar, Drive |
| Inbox triage | Gmail, Drive |
| Pipeline follow-up | CRM, Gmail, Drive |
| Reporting | Analytics/ads sources, Drive or Sheets |

Tip: where a connector offers limited scopes (read-only, draft-only), prefer them. Limits enforced by the tool are stronger than limits written in a prompt.

## 4. Choose where the mission file lives

The mission file is the agent's memory. Every scheduled run starts fresh, so the file **must** live somewhere durable:

- **Google Drive** — recommended for most people; easy to open and edit from your phone.
- **Notion** — good if your team already works there.
- **A connected folder on your computer** — works when that computer is online.

Never let it live in temporary session space.

## 5. Run Setup

Open a new chat and describe the outcome:

> Use the proactive-agent skill to set up a mission: every new website lead gets a personal reply within 15 minutes, 8 AM–7 PM Mountain, Monday–Saturday.

Claude will walk through six steps:

| Step | What Claude does | What you do |
|---|---|---|
| 1. Charter | Asks questions until the outcome, measure, cadence, tasks, signals, constraints, and stop rule are concrete | Answer specifically — name labels, CRM views, folders |
| 2. Authority policy | Proposes which actions are T0/T1/T2/T3 | Push anything you're unsure about to T3 |
| 3. Mission file | Writes the file and reads it back | Open it and skim it |
| 4. Heartbeat | Creates the scheduled task | Note the approval setting it reports |
| 5. Shadow mode | Sets `mode: shadow` | Nothing — it's automatic |
| 6. First cycle | Offers to run one cycle now | Say yes; review the first digest |

## 6. Understand the mission file

```markdown
# Mission: Speed-to-Lead
status: active            # active | PAUSE | complete
last_run: 2026-10-06T09:00:00-06:00
mode: shadow              # shadow | live
```

| Section | Purpose | Who edits it |
|---|---|---|
| Header | Status, last run, mode | You (status) / agent (last_run) |
| Charter | The goal and its rules | You, via Claude |
| Authority Policy | What it may do alone | You, via Claude |
| Limits | Per-cycle caps | You |
| Tasks | Work queue with acceptance criteria | Agent (you can add) |
| Awaiting Approval | Actions waiting for you | Agent adds; you tick/edit |
| Action Log | Append-only history | Agent only |
| Lessons | Rules learned from your feedback | Agent (you can add) |

You can edit this file directly at any time. The agent reads it at the start of every cycle.

## 7. Shadow mode and approvals

For the first 3–5 runs, **everything beyond drafts waits for you**. This is intentional — it lets you see the agent's judgment before trusting it.

Ways to approve:

- Tick the box `- [x]` next to the item in **Awaiting Approval**, or
- Reply in chat: "Approve 1 and 3, edit 2 to say ..., reject 4."

On the next cycle, the agent executes approved items (still checking the log for duplicates), and records a Lesson for every edit or rejection.

## 8. Reading the digest

```
Speed-to-Lead — Tue Oct 6, 9:00 AM MT   [shadow]
Measure: median first-reply time 11 min (was 14)   Target: < 15 min

DONE (3)          ← finished, with evidence
NEEDS YOUR OK (4) ← your action items
BLOCKED (1)       ← something only you can fix (e.g. reconnect an app)
NEXT              ← what it plans to do next
```

Read the **Measure** line first — it tells you whether the mission is working. An idle run is one line; that's a feature, not a bug.

## 9. Graduating actions to autopilot

When the same action type has been approved several times in a row (default 3) with **no edits**, ask:

> Graduate the lead-acknowledgement template to T2 for mission Speed-to-Lead.

Claude will confirm the streak, write the T2 permission with its scope, allowed content, frequency, and daily cap, and log the graduation. You can switch `mode: live` once the important action types have graduated.

If a graduated action ever goes wrong — undo it and tell Claude. It is **demoted** back to T3 immediately.

## 10. Maintaining a mission

| Ask Claude | Result |
|---|---|
| "Review mission X" | Recent activity, approval rates, measure trend, one suggested change |
| "Change mission X to run every 2 hours" | Updates the scheduled task and the file |
| "Add a task to mission X: ..." | New task with acceptance criteria |
| "Compact mission X" | Archives old log lines, keeps the last 50 plus a summary |
| "Why did mission X do ...?" | Explains from the Action Log and Lessons |

## 11. Pausing, resuming, and retiring

- **Pause:** change the status line to `status: PAUSE` (or ask Claude). Runs still fire but stop immediately.
- **Resume:** set `status: active`.
- **Retire:** ask Claude to retire the mission. It sets `status: complete`, writes a summary, and disables the scheduled task.

## 12. Writing a great charter

| Weak | Strong |
|---|---|
| "Grow my business" | "Book 8 listing appointments per month from past-client outreach" |
| "Handle my email" | "Every email in the Clients label gets a reply or a draft within 1 business day" |
| "Follow up with leads" | "Every lead in CRM stage 'New' gets a first touch within 15 min and a second within 48h" |
| "Keep me posted" | "Monday 7 AM one-page KPI report in Drive/Reports with week-over-week change" |

A good test: could a new hire read the charter and know exactly what "done" looks like?

## 13. Compliance and safety checklist

Before going live, confirm:

- [ ] Quiet hours and time zone are in Constraints.
- [ ] Industry rules are named in Constraints (e.g. RESPA, fair housing, CAN-SPAM, TCPA, HIPAA as relevant).
- [ ] A do-not-contact list or rule exists.
- [ ] Nothing that spends money, signs, deletes, or posts publicly is T2.
- [ ] Every T2 permission has scope, content, frequency, and daily cap.
- [ ] Connector scopes are as narrow as the mission allows.
- [ ] You know how to pause it in under 10 seconds.

This skill is a workflow method, not legal advice. Review your own obligations with a qualified professional.

## 14. Command cheat sheet

| You say | Mode |
|---|---|
| "Use the proactive-agent skill to put ___ on autopilot" | Setup |
| "Run cycle for mission ___" | Run cycle |
| "Review / pause / resume / retire mission ___" | Maintain |
| "Graduate ___ to T2 for mission ___" | Maintain |
| "Approve 1 and 3, reject 2" | Approvals |
| "Show me the last 10 actions for mission ___" | Maintain |

## 15. Troubleshooting

See [`skills/proactive-agent/references/troubleshooting.md`](../skills/proactive-agent/references/troubleshooting.md) for a full symptom → cause → fix table. The top three:

1. **It forgot what it did** → mission file isn't in a durable location.
2. **It never runs** → the scheduled task wasn't created with the scheduled-task tools, or is disabled.
3. **It stops halfway** → the scheduled task requires approvals; switch to automatic approval if your org allows, or keep the mission draft-only.
