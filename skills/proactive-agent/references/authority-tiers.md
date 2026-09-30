# Authority Tiers — Reference

The authority policy is the single most important safety feature of a proactive agent. It decides what the agent may do **without asking**.

## The core rule

> Tier by **risk and reversibility**, never by how confident the model feels.

Language models do not produce calibrated confidence scores. "I'm 95% sure" is not evidence. A reversible, internal, low-stakes action can be automated; an irreversible, external, or costly one must be approved.

## Tier definitions

| Tier | Name | Who sees the result | Reversible? | Needs approval? |
|---|---|---|---|---|
| T0 | Observe | Nobody (reading only) | n/a | No |
| T1 | Prepare | Only the owner | Yes | No |
| T2 | Execute within limits | Internal systems, or a pre-approved audience with a pre-approved message | Yes, or bounded | No — but only inside written limits |
| T3 | Approval required | Anyone else, or money, or permanent | Often not | **Always** |

## Deciding the tier — four questions

1. **Does it leave the owner's private space?** (Someone else will see it.) If yes → at least T2.
2. **Can it be undone completely within a minute?** If no → T3.
3. **Does it spend money, sign, commit, or delete?** If yes → T3.
4. **Is this the first time this person hears from us?** If yes → T3.

If none of the above trips T3 and the action is written into the T2 list with limits, it may be T2. Otherwise it is T3.

## Writing a T2 permission

Every T2 line needs four parts. A permission missing any part is treated as T3.

```
T2: <action> | scope: <who/what> | content: <template or rule> | frequency: <per contact> | daily cap: <n>
```

Example:

```
T2: send "new-inquiry acknowledgement" template | scope: inbound web leads from the website form, existing CRM contacts only | content: templates/lead-ack.md, name + property address merged, no other edits | frequency: once per lead | daily cap: 20
```

## Common action → tier mappings

| Action | Default tier | Notes |
|---|---|---|
| Read email, calendar, CRM, files, analytics | T0 | |
| Summarize, analyze, score, rank | T0 | |
| Create an email draft (not sent) | T1 | |
| Create an internal doc, sheet, or note | T1 | |
| Propose a CRM change (listed in digest) | T1 | |
| Apply/remove a label, archive (not delete) | T2 | Reversible |
| Update a CRM field, tag, stage, or task | T2 | Keep a log line with the old value |
| Create/move a task in a task tracker | T2 | |
| Send a pre-approved template to an existing contact | T2 | Needs scope, frequency, cap |
| Create a calendar hold on the owner's own calendar | T2 | No invitees |
| Send a calendar invite to another person | T3 | External |
| First contact with a new person | T3 | |
| Any custom-written outbound message | T3 | Until graduated |
| Post publicly (social, reviews, forums) | T3 | |
| Spend money, change ad budgets, buy, refund | T3 | |
| Contract, legal, pricing, commission language | T3 | |
| Delete anything | T3 | |
| Change sharing permissions | T3 | |
| Anything not listed | T3 | Default |

## Shadow mode and graduation

- New missions start in `mode: shadow`: every T2 action is queued as if T3.
- An action type graduates to T2 after **3 consecutive approvals with no edits** (the user may choose a different number).
- Graduation always needs the user's explicit yes and a line in the mission file:
  `2026-10-04 lead-ack template moved T3 -> T2 (3 clean approvals)`
- Any undo, complaint, or edited approval **demotes** the action back to T3 and adds a Lesson.

## Enforce limits in the tools, too

A limit that exists only in the prompt is weaker than one the tool enforces. Where possible:

- Give the connector draft-only or read-only scopes for T1-only missions.
- Use a dedicated label/folder the agent may act on, and nothing else.
- Use a CRM user or API key with restricted permissions.
- Keep ad-account and payment access out of the agent's reach entirely unless the mission needs it.
