#!/bin/bash

echo "🚀 Starting R-LLma Setup..."

# Project Structure
echo "📂 Creating project directories..."
mkdir -p R-LLma/src/{components,hooks,utils,services,styles} R-LLma/public R-LLma/scripts R-LLma/docs

# Initialize Git Repository
cd R-LLma
git init

# Initialize npm and add dependencies
echo "📦 Initializing npm and installing dependencies..."
npm init -y
npm install next react react-dom tailwindcss chart.js axios marked katex @codemirror/state @codemirror/view
npm install -D typescript @types/react autoprefixer postcss @types/node

# Add Tailwind CSS Configuration
echo "🎨 Setting up Tailwind CSS..."
npx tailwindcss init -p

cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './public/**/*.{html,js}',
    './src/**/*.{js,ts,jsx,tsx}'
  ],
  theme: {
    extend: {}
  },
  plugins: []
}
EOF

# Create Next.js Configuration
cat > next.config.js << 'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  output: 'export',
  images: {
    unoptimized: true
  },
  basePath: '/R-LLma',
  trailingSlash: true,
}

module.exports = nextConfig
EOF

# Setup .env file for sensitive data
echo "🔐 Creating .env.local file..."
cat > .env.local << 'EOF'
NEXT_PUBLIC_COHERE_API_KEY=your_cohere_api_key_here
EOF

# Add README
echo "📝 Adding README file..."
cat > README.md << 'EOF'
# R-LLma

R-LLma is an advanced LLM interface for real-time interaction, visualization, and code execution.

## Features

- **Cohere API Integration**: For intelligent language model responses.
- **Math Rendering**: Powered by KaTeX for rendering equations.
- **PDF Processing**: For parsing and summarizing PDF content.
- **Code Execution**: Interactive code editor and execution.
- **Modern UI**: Tailwind CSS for styling.
- **Deploy Anywhere**: Supports Vercel and GitHub Pages deployment.

## Project Structure

```
R-LLma/
├── src/
│   ├── components/    # React components
│   ├── hooks/         # Custom React hooks
│   ├── utils/         # Utility functions
│   ├── services/      # API services
│   └── styles/        # CSS styles
├── public/            # Static files
├── scripts/           # Build scripts
└── docs/              # Documentation
```

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/R-LLma.git
   cd R-LLma
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Add your API key in `.env.local`:
   ```env
   NEXT_PUBLIC_COHERE_API_KEY=your_api_key_here
   ```

4. Run the development server:
   ```bash
   npm run dev
   ```

## Deployment

1. Deploy to GitHub Pages:
   ```bash
   npm run export
   ```

2. Deploy to Vercel:
   ```bash
   vercel --prod
   ```

## Contributing

Contributions are welcome! Please follow the guidelines in `docs/CONTRIBUTING.md`.

## License

This project is licensed under the MIT License.
EOF

# Initialize Git repository and first commit
git add .
git commit -m "Initial setup for R-LLma"

echo "✅ Setup complete! Ready to code and deploy."
```

---

### 3. **Enhanced `README.md`**
A markdown file for documentation and guidance.

```markdown
# R-LLma

🚀 R-LLma is a modern and feature-rich project designed to leverage LLM capabilities with an intuitive interface.

---

## Features

- **Real-time Chat**: Powered by Cohere API for dynamic AI responses.
- **Mathematical Rendering**: Built-in KaTeX for equations and formulas.
- **Interactive UI**: Tailwind CSS for responsive, accessible design.
- **PDF Tools**: Read and process PDF files directly in the interface.
- **Code Execution**: Live code editor with visualization.
- **Deployment Flexibility**: Supports GitHub Pages and Vercel.

---

## Project Structure

```
R-LLma/
├── src/
│   ├── components/    # React components
│   ├── hooks/         # Custom React hooks
│   ├── utils/         # Utility functions
│   ├── services/      # API services
│   └── styles/        # CSS styles
├── public/            # Static files
├── scripts/           # Build scripts
└── docs/              # Documentation
```

---

## Installation

### Clone the Repository
```bash
git clone https://github.com/your-username/R-LLma.git
cd R-LLma
```

### Install Dependencies
```bash
npm install
```

### Environment Variables
Create a `.env.local` file with your Cohere API key:
```env
NEXT_PUBLIC_COHERE_API_KEY=your_api_key_here
```

---

## Development

Start the development server:
```bash
npm run dev
```

Build the project:
```bash
npm run build
```

Export for static hosting:
```bash
npm run export
```

---

## Deployment

### GitHub Pages
1. Run the export command:
   ```bash
   npm run export
   ```
2. Push to the `gh-pages` branch:
   ```bash
   git push origin gh-pages
   ```

### Vercel
Simply deploy with Vercel CLI:
```bash
vercel --prod
```

---

## Contributing

We welcome contributions! See the `docs/CONTRIBUTING.md` for details.

---

## License

This project is open source and available under the MIT License.
```
