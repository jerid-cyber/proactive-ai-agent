# Mission: Inbox Zero Triage
status: active
last_run: 2026-10-06T07:00:00-06:00
mode: shadow
owner: Business owner
report_to: chat

## Charter
- Outcome: Every morning the inbox holds only messages that need the owner personally; everything else is labeled, archived, or has a draft ready.
- Measure (baseline -> current value): unread in Inbox at 8 AM 140 -> 12
- Cadence / deadline: daily at 6:50 AM America/Denver
- Signals to watch: Gmail Inbox (since last_run); labels Clients, Vendors, Newsletters
- Constraints: never delete; never unsubscribe without approval; client emails always stay in Inbox until the owner replies
- Stop rule: ongoing

## Authority Policy
- T0 Observe: read Inbox and labels
- T1 Prepare: reply drafts for routine questions; a "Needs you" summary
- T2 Execute: apply labels (Clients, Vendors, Newsletters, Receipts) | any message | n/a | 200/day; archive Newsletters and Receipts after labeling | n/a | 200/day
- T3 Approval required: sending anything, unsubscribing, deleting, forwarding, anything else
- Graduations: (none yet)

## Limits
max_tool_calls: 25 | max_actions: 10 | max_retries: 2 | daily_send_cap: 0

## Tasks
| id | task | acceptance criteria | impact | urgency | effort | status | notes |
|----|------|---------------------|--------|---------|--------|--------|-------|
| 1 | Label new mail | each message since last_run has exactly one category label | 3 | 4 | 1 | ready | |
| 2 | Archive newsletters & receipts | none remain in Inbox | 3 | 3 | 1 | ready | |
| 3 | Draft routine replies | draft exists for each routine question | 4 | 3 | 2 | ready | |
| 4 | "Needs you" list | top 5 messages with one-line why, in digest | 5 | 4 | 1 | ready | |

## Awaiting Approval

## Action Log (append-only)

## Lessons
