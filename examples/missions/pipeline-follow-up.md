# Mission: Pipeline Follow-Up
status: active
last_run: 2026-10-06T08:00:00-06:00
mode: shadow
owner: Sales lead
report_to: email to owner

## Charter
- Outcome: No open deal goes more than 7 days without a logged touch, and every deal has a next step with a date.
- Measure (baseline -> current value): % open deals touched in last 7 days 48% -> 81%; % with dated next step 35% -> 90%
- Cadence / deadline: daily at 8 AM, Mon–Fri
- Signals to watch: CRM pipeline "Active"; Gmail sent + received with deal contacts; Calendar meetings
- Constraints: consultative tone; no discounts or pricing in drafts; CAN-SPAM footer on templates
- Stop rule: ongoing

## Authority Policy
- T0 Observe: CRM deals, email history, calendar
- T1 Prepare: nudge drafts; deal-note summaries; proposed next steps
- T2 Execute: log email/meeting activity to CRM | active deals | activity only | n/a | 50; set "next step" field when the owner stated one in email | active deals | owner's own words | n/a | 30
- T3 Approval required: sending nudges; stage changes; closing deals; anything else
- Graduations: (none yet)

## Limits
max_tool_calls: 25 | max_actions: 10 | max_retries: 2 | daily_send_cap: 0

## Tasks
| id | task | acceptance criteria | impact | urgency | effort | status | notes |
|----|------|---------------------|--------|---------|--------|--------|-------|
| 1 | Log yesterday's activity | every deal-contact email/meeting logged | 3 | 3 | 2 | ready | |
| 2 | Find stalled deals (>7 days) | list in digest | 5 | 4 | 1 | ready | |
| 3 | Draft nudge per stalled deal | draft exists referencing last conversation | 5 | 4 | 2 | ready | |
| 4 | Flag deals missing next step | listed in digest with suggestion | 4 | 3 | 1 | ready | |

## Awaiting Approval

## Action Log (append-only)

## Lessons
