# Mission: Weekly KPI Report
status: active
last_run: 2026-10-05T06:30:00-06:00
mode: live
owner: Operator
report_to: chat + Drive link

## Charter
- Outcome: Every Monday by 7 AM, a one-page KPI report is in Drive/Reports with week-over-week changes and the top 3 anomalies explained.
- Measure (baseline -> current value): on-time reports 0/4 -> 4/4 last month
- Cadence / deadline: weekly, Monday 6:30 AM America/Denver
- Signals to watch: ad platform spend/leads (via connected analytics), CRM new leads & closed deals, website sessions
- Constraints: numbers only from tool results — never estimate; label any gap as "data unavailable"
- Stop rule: ongoing

## Authority Policy
- T0 Observe: analytics, ads, CRM reports
- T1 Prepare: the report doc; anomaly notes
- T2 Execute: create doc in Drive/Reports | owner's folder only | report template | weekly | 1
- T3 Approval required: sharing the report with anyone; changing any ad budget or campaign; anything else
- Graduations: 2026-09-14 create weekly report doc moved T3 -> T2 (3 clean approvals)

## Limits
max_tool_calls: 25 | max_actions: 5 | max_retries: 2 | daily_send_cap: 0

## Tasks
| id | task | acceptance criteria | impact | urgency | effort | status | notes |
|----|------|---------------------|--------|---------|--------|--------|-------|
| 1 | Pull last 7 days vs prior 7 | all KPIs have both values or "unavailable" | 4 | 5 | 2 | ready | weekly |
| 2 | Write one-page report | doc in Drive/Reports, dated title | 5 | 5 | 2 | ready | weekly |
| 3 | Explain top 3 anomalies | each has a likely cause + suggested action | 4 | 3 | 3 | ready | weekly |

## Awaiting Approval

## Action Log (append-only)
- 2026-10-05T06:34 | doc:weekly-kpi:2026-10-05 | created | Drive/Reports/KPI 2026-10-05

## Lessons
- Edited: owner wants cost per lead shown before total spend.
