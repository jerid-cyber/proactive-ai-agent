#!/usr/bin/env bash
# Packages skills/proactive-agent into dist/proactive-agent.skill (a zip archive).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/dist"
rm -f "$ROOT/dist/proactive-agent.skill"
cd "$ROOT/skills"
zip -rq "$ROOT/dist/proactive-agent.skill" proactive-agent -x "*.DS_Store"
echo "Built $ROOT/dist/proactive-agent.skill"
