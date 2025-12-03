#!/usr/bin/env bash
set -euo pipefail

# WORKING shadcn/ui complete setup - December 2025
# Handles both fresh installs and existing projects
# Run: bash setup.sh

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT_DIR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "shadcn/ui Complete Setup"
echo "Working in: $ROOT_DIR"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check if already initialized
NEEDS_INIT=false
if [ ! -f components.json ]; then
  NEEDS_INIT=true
  echo "==> No components.json found, will run init"
else
  echo "==> components.json exists, skipping init"
fi

# Create directories
mkdir -p src src/lib scripts public

# package.json
if [ ! -f package.json ]; then
  cat > package.json <<'EOF'
{
  "name": "shadcn-complete",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview"
  }
}
EOF
fi

# Only create configs if they don't exist
if [ ! -f tsconfig.json ]; then
cat > tsconfig.json <<'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    },
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
EOF
fi

if [ ! -f tsconfig.node.json ]; then
cat > tsconfig.node.json <<'EOF'
{
  "compilerOptions": {
    "composite": true,
    "skipLibCheck": true,
    "module": "ESNext",
    "moduleResolution": "bundler",
    "allowSyntheticDefaultImports": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["vite.config.ts"]
}
EOF
fi

if [ ! -f vite.config.ts ]; then
cat > vite.config.ts <<'EOF'
import path from 'node:path'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
EOF
fi

if [ ! -f index.html ]; then
cat > index.html <<'EOF'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>shadcn/ui Complete</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
EOF
fi

if [ ! -f src/main.tsx ]; then
cat > src/main.tsx <<'EOF'
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
)
EOF
fi

if [ ! -f src/App.tsx ]; then
cat > src/App.tsx <<'EOF'
function App() {
  return (
    <main className="min-h-screen bg-background text-foreground flex items-center justify-center">
      <div className="text-center">
        <h1 className="text-4xl font-bold tracking-tight mb-4">
          shadcn/ui Ready
        </h1>
        <p className="text-muted-foreground">
          All components installed. Start building.
        </p>
      </div>
    </main>
  )
}

export default App
EOF
fi

if [ ! -f src/index.css ]; then
cat > src/index.css <<'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --muted: 210 40% 96.1%;
    --muted-foreground: 215.4 16.3% 46.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 222.2 84% 4.9%;
    --card: 0 0% 100%;
    --card-foreground: 222.2 84% 4.9%;
    --border: 214.3 31.8% 91.4%;
    --input: 214.3 31.8% 91.4%;
    --primary: 221.2 83.2% 53.3%;
    --primary-foreground: 210 40% 98%;
    --secondary: 210 40% 96.1%;
    --secondary-foreground: 222.2 47.4% 11.2%;
    --accent: 210 40% 96.1%;
    --accent-foreground: 222.2 47.4% 11.2%;
    --destructive: 0 72.22% 50.59%;
    --destructive-foreground: 210 40% 98%;
    --ring: 221.2 83.2% 53.3%;
    --radius: 0.75rem;
  }

  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
    --muted: 217.2 32.6% 17.5%;
    --muted-foreground: 215 20.2% 65.1%;
    --accent: 217.2 32.6% 17.5%;
    --accent-foreground: 210 40% 98%;
    --popover: 222.2 84% 4.9%;
    --popover-foreground: 210 40% 98%;
    --border: 217.2 32.6% 17.5%;
    --input: 217.2 32.6% 17.5%;
    --card: 222.2 84% 4.9%;
    --card-foreground: 210 40% 98%;
    --primary: 217.2 91.2% 59.8%;
    --primary-foreground: 222.2 47.4% 11.2%;
    --secondary: 217.2 32.6% 17.5%;
    --secondary-foreground: 210 40% 98%;
    --destructive: 0 62.8% 30.6%;
    --destructive-foreground: 210 40% 98%;
    --ring: 224.3 76.3% 48%;
  }

  * {
    @apply border-border;
  }

  body {
    @apply bg-background text-foreground;
    font-feature-settings: 'rlig' 1, 'calt' 1;
  }
}
EOF
fi

if [ ! -f tailwind.config.js ]; then
cat > tailwind.config.js <<'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  darkMode: ['class'],
  content: ['./index.html', './src/**/*.{ts,tsx,js,jsx}'],
  theme: {
    container: {
      center: true,
      padding: '2rem',
      screens: {
        '2xl': '1400px',
      },
    },
    extend: {
      colors: {
        border: 'hsl(var(--border))',
        input: 'hsl(var(--input))',
        ring: 'hsl(var(--ring))',
        background: 'hsl(var(--background))',
        foreground: 'hsl(var(--foreground))',
        primary: {
          DEFAULT: 'hsl(var(--primary))',
          foreground: 'hsl(var(--primary-foreground))',
        },
        secondary: {
          DEFAULT: 'hsl(var(--secondary))',
          foreground: 'hsl(var(--secondary-foreground))',
        },
        destructive: {
          DEFAULT: 'hsl(var(--destructive))',
          foreground: 'hsl(var(--destructive-foreground))',
        },
        muted: {
          DEFAULT: 'hsl(var(--muted))',
          foreground: 'hsl(var(--muted-foreground))',
        },
        accent: {
          DEFAULT: 'hsl(var(--accent))',
          foreground: 'hsl(var(--accent-foreground))',
        },
        popover: {
          DEFAULT: 'hsl(var(--popover))',
          foreground: 'hsl(var(--popover-foreground))',
        },
        card: {
          DEFAULT: 'hsl(var(--card))',
          foreground: 'hsl(var(--card-foreground))',
        },
      },
      borderRadius: {
        lg: 'var(--radius)',
        md: 'calc(var(--radius) - 2px)',
        sm: 'calc(var(--radius) - 4px)',
      },
      keyframes: {
        'accordion-down': {
          from: { height: '0' },
          to: { height: 'var(--radix-accordion-content-height)' },
        },
        'accordion-up': {
          from: { height: 'var(--radix-accordion-content-height)' },
          to: { height: '0' },
        },
      },
      animation: {
        'accordion-down': 'accordion-down 0.2s ease-out',
        'accordion-up': 'accordion-up 0.2s ease-out',
      },
    },
  },
  plugins: [require('tailwindcss-animate')],
}
EOF
fi

if [ ! -f postcss.config.js ]; then
cat > postcss.config.js <<'EOF'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF
fi

mkdir -p src/lib
if [ ! -f src/lib/utils.ts ]; then
cat > src/lib/utils.ts <<'EOF'
import { clsx, type ClassValue } from 'clsx'
import { twMerge } from 'tailwind-merge'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
EOF
fi

echo ""
echo "==> Checking dependencies..."
if [ ! -d node_modules ]; then
  echo "Installing dependencies..."
  npm install react@^18.3.1 react-dom@^18.3.1
  npm install -D \
    @types/react@^18.3.12 \
    @types/react-dom@^18.3.1 \
    @vitejs/plugin-react@^4.3.4 \
    typescript@^5.7.2 \
    vite@^6.0.3 \
    tailwindcss@latest \
    postcss \
    autoprefixer \
    tailwindcss-animate
  
  npm install clsx tailwind-merge class-variance-authority
else
  echo "node_modules exists, skipping base install"
fi

# Only run init if needed
if [ "$NEEDS_INIT" = true ]; then
  echo ""
  echo "==> Running shadcn init..."
  npx shadcn@latest init -y
fi

echo ""
echo "==> Installing ALL components..."
echo "Attempting -a flag method first..."

if npx shadcn@latest add -a -y 2>/dev/null; then
  echo "✅ All components installed via -a flag"
else
  echo "⚠️  -a flag failed, using explicit component list..."
  
  COMPONENTS=(
    accordion alert-dialog alert aspect-ratio avatar badge breadcrumb
    button-group button calendar card carousel chart checkbox collapsible
    combobox command context-menu data-table date-picker dialog drawer
    dropdown-menu empty field form hover-card input-group input-otp input
    item kbd label menubar native-select navigation-menu pagination popover
    progress radio-group resizable scroll-area select separator sheet sidebar
    skeleton slider sonner spinner switch table tabs textarea toast
    toggle-group toggle tooltip typography
  )
  
  INSTALLED=0
  FAILED=()
  TOTAL=${#COMPONENTS[@]}
  
  for comp in "${COMPONENTS[@]}"; do
    INSTALLED=$((INSTALLED + 1))
    printf "[$INSTALLED/$TOTAL] Installing %s... " "$comp"
    if npx shadcn@latest add "$comp" -y &>/dev/null; then
      echo "✓"
    else
      echo "✗"
      FAILED+=("$comp")
    fi
  done
  
  echo ""
  if [ ${#FAILED[@]} -eq 0 ]; then
    echo "✅ All $TOTAL components installed successfully"
  else
    echo "⚠️  Installed: $((TOTAL - ${#FAILED[@]}))/$TOTAL"
    echo "Failed: ${FAILED[*]}"
    echo ""
    echo "Retry failed components manually:"
    echo "npx shadcn@latest add ${FAILED[*]} -y"
  fi
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ SETUP COMPLETE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Components: src/components/ui/"
echo "Utils: src/lib/utils.ts"
echo ""
echo "Run: npm run dev"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"