# Architecture & Design Decisions

This document explains *why* Proactive Agent is built the way it is, so you can adapt it without breaking the parts that keep it safe.

## The four-part model

| Part | Provided by | Failure if missing |
|---|---|---|
| Brain | `SKILL.md` | No consistent method; each run improvises |
| Heartbeat | A scheduled task | Nothing happens unless you ask — not proactive |
| Hands | Connected apps | Can only advise, not act |
| Memory | Mission file in durable storage | Repeats work, loses track, double-sends |

A skill is instructions. It cannot wake itself up, and each scheduled run begins with no memory of the last. Proactivity therefore has to be *assembled* from these four parts. The skill's first job in Setup is to make sure all four exist.

## Design decisions

### 1. One mission file, human-readable
**Decision:** All state lives in a single Markdown file.
**Why:** It is the simplest durable memory that works across any storage provider, and the owner can read, audit, and edit it without special tools. Transparency is a safety feature.

### 2. Tiers by risk and reversibility, not confidence
**Decision:** Authority is set per *action type* by how risky and reversible it is.
**Why:** Model-reported confidence is not calibrated. A gate based on "I'm 90% sure" fails exactly when the model is confidently wrong. Reversibility is an objective property of the action.

### 3. Default to T3
**Decision:** Any action not written into the policy requires approval.
**Why:** Allow-lists fail safe; deny-lists fail open. New situations are where agents make their worst mistakes.

### 4. Shadow mode and graduation
**Decision:** New missions queue everything; action types earn autonomy through consecutive clean approvals.
**Why:** It mirrors how you'd onboard a new employee: supervise first, delegate what's proven. It also generates the Lessons that tune the agent to the owner.

### 5. Idempotency via action keys
**Decision:** Every send/write has a stable key checked against an append-only log.
**Why:** Scheduled runs can be retried, time out mid-action, or overlap. Without idempotency, "send follow-up" becomes "send follow-up three times."

### 6. Verify before "done"
**Decision:** Tasks close only when acceptance criteria are met with evidence gathered by reading results back.
**Why:** Tool calls can silently fail or partially succeed. "I called the tool" is not proof.

### 7. Check before retrying
**Decision:** After an error or timeout, confirm whether the action happened before trying again; max 2 retries.
**Why:** Many timeouts happen *after* the action succeeded. Blind retries cause duplicates.

### 8. Data is never instructions
**Decision:** Monitored content (email, web, docs) cannot change the mission or grant authority.
**Why:** Prompt injection is the main attack surface for agents that read untrusted inboxes and pages.

### 9. Hard per-cycle limits
**Decision:** Caps on tool calls (25), actions (10), and retries (2) per cycle, plus daily send caps.
**Why:** Bounded cost and bounded blast radius. A runaway loop stops itself.

### 10. Lessons instead of fine-tuning
**Decision:** Feedback is stored as plain-language rules the agent reads each cycle.
**Why:** Immediate, transparent, reversible, and requires no ML infrastructure.

### 11. Idle is a valid outcome
**Decision:** If nothing moves the measure, record "idle" and stop.
**Why:** Agents rewarded for activity invent busywork. The measure — not activity — defines progress.

## Selection formula

```
priority = (impact × urgency) / effort      each scored 1–5
```

Simple enough to be consistent across runs and explainable in a digest.

## Extending the skill

Safe to change:

- Default limits, graduation streak length, digest format.
- Cadence guidance for your industry.
- Additional reference files (e.g. industry compliance notes).

Change with care (these are safety-critical):

- Default-to-T3 rule
- Action-key check before writes
- Data-is-never-instructions rule
- Verify-before-done rule
