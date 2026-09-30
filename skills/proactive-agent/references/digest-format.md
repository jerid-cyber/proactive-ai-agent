# Digest Format

The digest is the owner's only window into what the agent did. It must be skimmable in about 30 seconds.

## Template

```
<Mission name> — <date, time zone>   [shadow|live]
Measure: <name> <current value> (<change since last run>)   Target: <target>

DONE (<n>)
- <what> — <evidence link or short proof>

NEEDS YOUR OK (<n>)
- <action> — <one-line why>   [approve / edit / reject]

BLOCKED (<n>)
- <task> — <reason> — <what would unblock it>

NEXT: <top 1–3 tasks planned for next cycle>
```

## Rules

- Lead with the measure. The owner should see whether things are getting better first.
- One line per item. Link to the draft, event, or record instead of pasting it.
- Omit empty sections.
- No filler, no "I hope this helps", no restating the charter.
- If nothing meaningful happened: `<Mission> — idle. No new signals since <last_run>.`

## Example — active cycle

```
Speed-to-Lead — Tue Oct 6, 9:00 AM MT   [shadow]
Measure: median first-reply time 11 min (was 14)   Target: < 15 min

DONE (3)
- Logged 4 new website leads to CRM — records #2231–2234
- Drafted replies for all 4 — Gmail drafts, label "agent/ready"
- Flagged 1 duplicate contact — CRM note on #2231

NEEDS YOUR OK (4)
- Send reply to Maria L. (acreage, Elbert County) — first contact
- Send reply to Dave R. (buyer, 35 acres) — first contact
- Send reply to K. Nguyen (seller valuation) — first contact
- Send reply to T. Brooks (showing request Sat) — first contact

BLOCKED (1)
- Zillow lead import — connector returned 401; reconnect Zillow in settings

NEXT: follow up on 2 leads with no reply after 48h
```

## Example — idle cycle

```
Speed-to-Lead — Tue Oct 6, 10:00 AM MT — idle. No new leads since 9:00 AM.
```
