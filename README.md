# exp6final — React + Vite Deployment

A default React 19 application bootstrapped with Vite, configured for instant deployment across multiple cloud providers and containers.

## 🚀 Quick Deployment Options

### 1. GitHub Pages (Automated CI/CD)
This repository includes a GitHub Actions workflow (`.github/workflows/deploy.yml`):
1. In the GitHub repository settings, go to **Settings > Pages**.
2. Under **Build and deployment > Source**, select **GitHub Actions**.
3. Every commit pushed to `main` will automatically build and publish the live site.

### 2. Vercel
Configuration is pre-set in `vercel.json`.
```bash
# Deploy to production
npx vercel --prod
# or via npm script
npm run deploy:vercel
```
Or import the repository directly on [vercel.com](https://vercel.com/new).

### 3. Netlify
Configuration is pre-set in `netlify.toml`.
```bash
# Deploy to production
npm run deploy:netlify
```
Or import the repository directly on [netlify.com](https://app.netlify.com).

### 4. Docker & Docker Compose
```bash
# Build and run with Docker Compose
docker compose up -d
```
The application will be accessible at `http://localhost:8080`.

---

## 💻 Local Development

```bash
# Install dependencies
npm install

# Start local development server
npm run dev

# Build for production
npm run build

# Preview production build locally
npm run preview
```
