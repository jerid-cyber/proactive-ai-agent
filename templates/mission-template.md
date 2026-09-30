# Mission: <NAME>
status: active            # active | PAUSE | complete
last_run: <ISO datetime>
mode: shadow              # shadow | live
owner: <name>
report_to: <chat | email address | Slack DM>

## Charter
- Outcome:
- Measure (baseline -> current value):
- Cadence / deadline:
- Signals to watch:
- Constraints (quiet hours + time zone, voice, compliance, budget, do-not-contact):
- Stop rule:

## Authority Policy
- T0 Observe:
- T1 Prepare:
- T2 Execute (scope | allowed content | per-contact frequency | daily cap):
- T3 Approval required: everything else
- Graduations: <date> <action type> moved T3 -> T2 (<n> clean approvals)

## Limits
max_tool_calls: 25 | max_actions: 10 | max_retries: 2 | daily_send_cap: <n>

## Tasks
| id | task | acceptance criteria | impact | urgency | effort | status | notes |
|----|------|---------------------|--------|---------|--------|--------|-------|
<!-- status: ready | in_progress | awaiting_approval | blocked | done -->

## Awaiting Approval
- [ ] <action key> | <action> | why | exact draft/change

## Action Log (append-only)
- <datetime> | <action key> | <result> | <evidence>

## Lessons
- <what the user approved/rejected and the rule that follows>
