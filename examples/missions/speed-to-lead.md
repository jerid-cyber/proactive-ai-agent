# Mission: Speed-to-Lead
status: active
last_run: 2026-10-06T09:00:00-06:00
mode: shadow
owner: Brokerage owner
report_to: chat

## Charter
- Outcome: Every new inbound lead (website form, Zillow, Realtor.com) gets a personal first reply within 15 minutes during business hours, and a second touch within 48 hours if they haven't replied.
- Measure (baseline -> current value): median first-reply time 42 min -> 11 min; % leads with 2nd touch in 48h 30% -> 85%
- Cadence / deadline: hourly, 8 AM–7 PM, Mon–Sat; ongoing
- Signals to watch: Gmail label "Leads/Inbound"; CRM saved view "New leads – last 24h"; Google Calendar (owner) for showing availability
- Constraints: quiet hours 7 PM–8 AM America/Denver and Sundays; friendly, plain-spoken voice, no hype; fair housing — never describe neighborhoods by who lives there, schools as "good/bad", or safety; RESPA — no mention of referral fees or lender/title steering; no texts without documented consent (TCPA); do-not-contact tag in CRM is absolute
- Stop rule: ongoing; PAUSE on status line pauses

## Authority Policy
- T0 Observe: read Leads/Inbound label, CRM leads, owner calendar
- T1 Prepare: reply drafts in Gmail with label "agent/ready"; lead summary notes; proposed showing times
- T2 Execute (scope | allowed content | per-contact frequency | daily cap):
  - create/update CRM lead record | inbound leads only | source, property, timeline, contact fields | once per lead | 50
  - apply Gmail labels | Leads/* labels only | n/a | n/a | 100
  - hold on owner's own calendar (no invitees) | proposed showings | n/a | 10
- T3 Approval required: every outbound email or text; calendar invites to leads; anything else
- Graduations: (none yet)

## Limits
max_tool_calls: 25 | max_actions: 10 | max_retries: 2 | daily_send_cap: 0 (shadow)

## Tasks
| id | task | acceptance criteria | impact | urgency | effort | status | notes |
|----|------|---------------------|--------|---------|--------|--------|-------|
| 1 | Log each new lead to CRM | record exists with source, property, contact | 4 | 5 | 1 | ready | recurring |
| 2 | Draft personal first reply | Gmail draft exists, labeled agent/ready, references their property | 5 | 5 | 2 | ready | recurring |
| 3 | Queue 48h follow-up for non-responders | draft exists + approval item queued | 4 | 3 | 2 | ready | recurring |
| 4 | Report median reply time | measure updated in charter | 3 | 2 | 1 | ready | each cycle |

## Awaiting Approval
- [ ] reply:18c2f… | Send reply to Maria L. (35 ac, Elbert Co.) | first contact | Gmail draft "Re: 35 acres off CR-13"

## Action Log (append-only)
- 2026-10-06T09:02 | crm:lead-2231:create | created | CRM #2231
- 2026-10-06T09:03 | draft:reply:18c2f… | draft created | Gmail draft id r-5521

## Lessons
- Edited: owner prefers first names and signs "— J", not full signature block.
- Rejected: don't propose Sunday showings.
