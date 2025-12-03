# shadcn/ui Complete Setup

Author: Frank I. (@frankrevops)

## What this script does
- Bootstraps a Vite + React + TypeScript project configured for Tailwind CSS.
- Seeds project structure and default config files if they do not exist.
- Installs all base dependencies plus shadcn/ui CLI.
- Attempts to install the full shadcn/ui component set; falls back to individual installs if needed.
- Leaves existing installs/components in place so reruns stay idempotent.

## Requirements
- Node.js 18+ and npm.
- npx available in your PATH.

## Usage
- From the repo root, run `bash scripts/setup.sh`.
- If `components.json` is missing, the script runs `shadcn init` for you.
- If `node_modules` is missing, the script installs React/Vite/Tailwind and supporting packages.
- On success, components live under `src/components/ui/` with utilities in `src/lib/utils.ts`.
- Start the dev server afterward with `npm run dev`.

## Troubleshooting
- If the bulk `npx shadcn@latest add -a -y` step fails, the script automatically retries each component individually and prints any that need manual re-run.
- Re-run the script anytime; it only creates files or installs packages that are missing.
