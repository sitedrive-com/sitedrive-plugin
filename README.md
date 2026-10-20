# Sitedrive plugin for AI assistants

Connects your AI assistant to [Sitedrive](https://sitedrive.com) through the Sitedrive MCP server. Every action
runs with your own Sitedrive permissions after you sign in.

## Install

Claude Code:

```bash
claude plugin marketplace add sitedrive-com/sitedrive-plugin
claude plugin install sitedrive@sitedrive
```

Codex:

```bash
codex plugin marketplace add sitedrive-com/sitedrive-plugin
codex plugin add sitedrive@sitedrive
```

Then sign in to Sitedrive when prompted (`/mcp` in Claude Code).

Any other MCP client can connect directly to `https://api.app.sitedrive.com/mcp`.

## Submit to the OpenAI plugin directory

Run `scripts/build-openai-zip.sh` and upload the ZIP it prints at [platform.openai.com/plugins](https://platform.openai.com/plugins). Bump `version` in both manifests before each upload.

## Support

[sitedrive.com](https://sitedrive.com)
