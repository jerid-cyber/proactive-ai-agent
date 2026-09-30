# Contributing

Thanks for helping improve Proactive Agent.

## Ways to contribute
- **Share an example mission** — add a filled-in file to `examples/missions/` (remove any real names, emails, or client data).
- **Report a problem** — open an issue using the Bug Report template.
- **Suggest an improvement** — open an issue using the Feature Request template.
- **Improve the docs** — typo fixes and clearer explanations are always welcome.

## Pull request guidelines
1. Keep `SKILL.md` concise; put detail in `references/`.
2. Do not weaken the safety-critical rules (see `docs/ARCHITECTURE.md` → "Change with care") without a clear rationale in the PR.
3. Run `./scripts/build.sh` so `dist/proactive-agent.skill` matches your changes.
4. Add a line to `CHANGELOG.md` under an "Unreleased" heading.

## Privacy
Never commit real mission files that contain customer names, emails, phone numbers, or deal details.
