# 🚀 exp6final — React + Vite Deployment on AWS

A default React 19 application bootstrapped with Vite, configured for deployment on **Amazon Web Services (AWS)**.

---

## ☁️ AWS Deployment Options

### Method 1: AWS Amplify Hosting (Recommended - Easiest & Fastest)
AWS Amplify Hosting natively integrates with GitHub and auto-deploys frontend applications.
1. Sign in to the [AWS Management Console](https://console.aws.amazon.com/) and navigate to **AWS Amplify**.
2. Click **Host web app**.
3. Select **GitHub** as the Git provider and authorize AWS.
4. Select repository: `Rathi1307/exp6final` and branch: `main`.
5. Amplify will automatically detect the included **`amplify.yml`** build specification.
6. Click **Save and Deploy**. Your live URL with free SSL will be generated automatically.

---

### Method 2: AWS S3 + CloudFront (Static Website Hosting)
Host static assets in Amazon S3 and distribute globally with Amazon CloudFront CDN.

#### Option A: One-Command CLI Deployment
Prerequisites: AWS CLI configured (`aws configure`).
```bash
# Build & sync to your S3 bucket
./aws-s3-deploy.sh <YOUR_S3_BUCKET_NAME> [YOUR_CLOUDFRONT_DISTRIBUTION_ID]
```

#### Option B: Automated CloudFormation Stack
Create your S3 bucket and CloudFront distribution with SPA error routing pre-configured:
```bash
aws cloudformation deploy \
  --template-file aws-cloudformation.yaml \
  --stack-name exp6final-react-stack \
  --parameter-overrides BucketName=my-unique-react-app-bucket-2026
```

---

### Method 3: AWS App Runner / ECS / Fargate / Lightsail (Docker Container)
Deploy the included production-ready multi-stage `Dockerfile` and `nginx.conf`:

```bash
# Build Docker image locally
docker build -t exp6final:latest .

# Run container locally on port 8080
docker run -p 8080:80 exp6final:latest
```

To push to Amazon ECR (Elastic Container Registry) and deploy to AWS App Runner or ECS:
```bash
# 1. Authenticate Docker with your ECR registry
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com

# 2. Tag and push image
docker tag exp6final:latest <aws_account_id>.dkr.ecr.<region>.amazonaws.com/exp6final:latest
docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/exp6final:latest
```

---

### Method 4: AWS Elastic Beanstalk
A pre-configured **`Dockerrun.aws.json`** is provided.
1. Go to **AWS Elastic Beanstalk** > **Create Application**.
2. Platform: **Docker**.
3. Upload the project zip or deploy via EB CLI:
   ```bash
   eb init
   eb create exp6final-env
   eb deploy
   ```

---

## 📁 AWS Deployment Files Reference

| File | Purpose |
| :--- | :--- |
| **`amplify.yml`** | Build & hosting specification for AWS Amplify Hosting |
| **`aws-s3-deploy.sh`** | Build & S3/CloudFront automated synchronization script |
| **`aws-cloudformation.yaml`** | Infrastructure-as-Code for S3 + CloudFront with SPA routing |
| **`Dockerrun.aws.json`** | Configuration for AWS Elastic Beanstalk Docker deployment |
| **`Dockerfile`** | Multi-stage production container build (Node -> Nginx) |
| **`nginx.conf`** | High-performance Nginx config with SPA routing and compression |
| **`docker-compose.yml`** | Local container testing orchestration |

---

## 💻 Local Development

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build production bundle
npm run build

# Preview build locally
npm run preview
```
