
This script was put together by [Frank I. (@frankrevops)](https://linkedin.com/in/frankrevops) to offer a straightforward way to kickstart a new frontend project. The goal is to get you up and running with a modern, component-based setup without the usual hassle, so you can dive straight into building your application.

# Frontend Setup Script

This script automates the setup of a complete frontend development environment. It is designed to be run from the `frontend` directory.

## Features

- **Project Scaffolding**: Creates a standard Vite + React + TypeScript project structure.
- **Dependency Management**: Installs all necessary Node.js dependencies.
- **Tailwind CSS v3**: Specifically installs and configures Tailwind CSS version 3 to ensure compatibility and avoid breaking changes from later versions.
- **`shadcn/ui` Integration**: Initializes the `shadcn/ui` library.
- **Component Installation**: Installs all available `shadcn/ui` components, ensuring the project is ready for immediate use.
- **Idempotent**: The script can be run multiple times without overwriting existing configuration files. It only creates files that are missing.

## How to Run

Navigate to the `frontend/scripts` directory and execute the script:

```bash
bash setup.sh
```

## What it Does

1.  **Checks for Initialization**: It looks for a `components.json` file to determine if `shadcn/ui` has already been initialized.
2.  **Creates Project Structure**: If they don't exist, it creates the following directories:
    -   `src/`
    -   `src/lib/`
    -   `public/`
3.  **Generates Configuration Files**: It creates the following files if they are not already present:
    -   `package.json`
    -   `tsconfig.json`
    -   `tsconfig.node.json`
    -   `vite.config.ts`
    -   `index.html`
    -   `postcss.config.js`
    -   `tailwind.config.js`
4.  **Creates Source Files**: It generates basic boilerplate for:
    -   `src/main.tsx`
    -   `src/App.tsx`
    -   `src/index.css`
    -   `src/lib/utils.ts`
5.  **Installs Dependencies**:
    -   It first removes any existing Tailwind CSS v4 installations to prevent conflicts.
    -   It then installs `react`, `react-dom`, and all necessary development dependencies for a Vite + TypeScript + Tailwind CSS project.
6.  **Initializes `shadcn/ui`**: If not already initialized, it runs `npx shadcn@latest init`.
7.  **Installs All `shadcn/ui` Components**: The script attempts to install all `shadcn/ui` components automatically. It first tries the `-a` flag, and if that fails, it falls back to installing each component individually.

After the script finishes, the frontend environment is ready. You can start the development server by running `npm run dev` from the `frontend` directory.
