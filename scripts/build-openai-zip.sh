#!/usr/bin/env bash
# Builds the ZIP for the OpenAI plugin portal (platform.openai.com/plugins).
# The portal only offers "Connect" when .mcp.json omits "type" (Claude Code requires it), and it ignores .claude-plugin/.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
src="$root/plugins/sitedrive"
version="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$src/.codex-plugin/plugin.json")"
out="$root/dist/sitedrive-plugin-openai-$version.zip"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT

cp -R "$src/.codex-plugin" "$src/assets" "$stage/"
python3 - "$src/.mcp.json" "$stage/.mcp.json" <<'PY'
import json, sys
config = json.load(open(sys.argv[1]))
for server in config["mcpServers"].values():
    server.pop("type", None)
    server.pop("oauth_resource", None)
open(sys.argv[2], "w").write(json.dumps(config, indent=2) + "\n")
PY

mkdir -p "$root/dist"
rm -f "$out"
(cd "$stage" && zip -q -X -r "$out" .mcp.json .codex-plugin assets)
echo "$out"
