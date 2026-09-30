# FAQ

### What is a Claude Skill?
A folder of instructions (a `SKILL.md` file plus optional references) that Claude loads when a task matches it. This skill teaches Claude a method for running goal-driven missions on a schedule.

### Do I need to know how to code?
No. Setup happens in conversation. The only file you touch is the mission file, which is plain text.

### What makes it "proactive"?
A scheduled task wakes it on a cadence you choose. Each run it decides what to do based on the mission, not on a new prompt from you.

### Where is my data stored?
In the apps you connect and in the mission file at the location you choose (e.g. your Google Drive). The skill itself stores nothing.

### Can it send messages or spend money on its own?
Spending money is always approval-required. Messages are approval-required unless you explicitly grant a narrow, capped, pre-approved template permission — and only after shadow mode.

### How does it avoid sending the same email twice?
Each send has a unique action key (e.g. `reply:<thread-id>`). Before sending, it checks the append-only Action Log; if the key is there, it skips.

### What happens if an email tries to trick it?
Monitored content is treated as data, never as instructions. It cannot change the mission, grant permissions, or bypass approvals. Suspicious content is reported in the digest.

### How does it "learn"?
Every approval, edit, rejection, or undo becomes a written Lesson in the mission file. It reads Lessons at the start of every cycle.

### Can I run more than one mission?
Yes. Each mission has its own file and its own scheduled task. Keep them focused on one outcome each.

### How often should it run?
Match cadence to how fast the signals change: hourly for leads, daily for most operations, weekly for reporting.

### How do I stop it immediately?
Set `status: PAUSE` in the mission file, or ask Claude to pause the mission. For a long stop, also disable the scheduled task.

### Will it work while my computer is off?
Cloud-scheduled tasks with cloud connectors (Gmail, Drive, etc.) run without your computer. Missions that depend on files on your computer need it to be online.

### Is it compliant with real estate / marketing regulations?
It lets you write rules like RESPA, fair housing, CAN-SPAM, and TCPA into the charter, and keeps outbound messages approval-gated by default. It is not legal advice — review your obligations with a qualified professional.

### Can I customize it?
Yes — it's MIT-licensed. See `docs/ARCHITECTURE.md` for which parts are safe to change and which are safety-critical.
