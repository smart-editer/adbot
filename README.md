# 🤖 adbot

> Production-ready Dockerized bot application powered by PostgreSQL and Redis.

<p align="center">
  <img src="https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white">
  <img src="https://img.shields.io/badge/PostgreSQL-17-4169E1?style=for-the-badge&logo=postgresql&logoColor=white">
  <img src="https://img.shields.io/badge/Redis-7-DC382D?style=for-the-badge&logo=redis&logoColor=white">
  <img src="https://img.shields.io/badge/License-Private-lightgrey?style=for-the-badge">
</p>

---

## 📖 Overview

`adbot` is a Dockerized bot application designed for production deployment.

The application runs with:

- 🤖 Bot
- 🗄️ PostgreSQL 17
- ⚡ Redis 7
- 🐳 Docker
- 🔗 Docker Compose
- 💾 Persistent volumes
- ❤️ Health checks
- 🔄 Automatic restart
- 🔐 Environment-based configuration
- 🌐 Isolated Docker networking

---

## 🏗️ Architecture

```text
                         ┌──────────────────────┐
                         │       Internet       │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │        adbot         │
                         │                      │
                         │   Bot Application    │
                         └──────────┬───────────┘
                                    │
                     ┌──────────────┴──────────────┐
                     │                             │
                     ▼                             ▼
          ┌─────────────────────┐       ┌─────────────────────┐
          │     PostgreSQL      │       │        Redis        │
          │        17           │       │         7           │
          │                     │       │                     │
          │ Persistent Storage  │       │ Persistent Storage  │
          └──────────┬──────────┘       └──────────┬──────────┘
                     │                             │
                     ▼                             ▼
              postgres_data                  redis_data
```

**Docker Network:** `backend`

Internal service addresses:

```
postgres:5432
redis:6379
```

> Inside the bot container, use `postgres` and `redis` as hostnames. Do not use `localhost`.

---

## 🧰 Tech Stack

| Component     | Technology         |
| ------------- | ------------------ |
| Application   | adbot              |
| Runtime       | PyInstaller        |
| Container     | Docker             |
| Orchestration | Docker Compose     |
| Database      | PostgreSQL 17      |
| Cache         | Redis 7            |
| Base Image    | Debian Trixie Slim |
| Network       | Docker Bridge      |
| Storage       | Docker Volumes     |

---

## 📁 Project Structure

```
adbot/
│
├── .env.example
├── .gitignore
├── Dockerfile
├── docker-compose.yml
├── README.md
└── adbot
```

---

## ⚙️ Requirements

Install:

- Linux
- Docker
- Docker Compose v2
- Git

Check Docker:

```bash
docker --version
```

Check Docker Compose:

```bash
docker compose version
```

---

## 🚀 Installation

### 1. Clone Repository

```bash
git clone https://github.com/sorabhyadavpalothar/adbot.git
```

Enter project:

```bash
cd adbot
```

---

## 🔐 Environment Setup

### 2. Create .env

Copy the example environment:

```bash
cp .env.example .env
```

Edit configuration:

```bash
nano .env
```

Example:

```env
POSTGRES_DB=app
POSTGRES_USER=app
POSTGRES_PASSWORD=change-this-password
```

> Configure all required variables before starting the application.

---

## 🏗️ Build

### 3. Build Docker Images

Build all services:

```bash
docker compose build
```

**Clean Build**

To build without cache:

```bash
docker compose build --no-cache
```

**Build Only Bot**

```bash
docker compose build bot
```

**Clean Bot Build**

```bash
docker compose build --no-cache bot
```

---

## ▶️ Run

### 4. Start All Services

Start the complete stack:

```bash
docker compose up -d
```

Or build and start:

```bash
docker compose up -d --build
```

---

## 📊 Check Status

### 5. Check Containers

```bash
docker compose ps
```

Expected services:

- postgres
- redis
- bot

PostgreSQL and Redis should become **healthy** before the bot starts.

---

## 📜 Logs

### 6. All Service Logs

View live logs:

```bash
docker compose logs -f
```

---

### 7. Bot Logs

View only bot logs:

```bash
docker compose logs -f bot
```

Recommended for debugging the bot.

---

### 8. PostgreSQL Logs

```bash
docker compose logs -f postgres
```

---

### 9. Redis Logs

```bash
docker compose logs -f redis
```

---

### 10. Recent Bot Logs

Last 100 lines:

```bash
docker compose logs --tail=100 bot
```

Last 200 lines:

```bash
docker compose logs --tail=200 bot
```

Press `CTRL + C` to stop following logs.

---

## ⚡ Complete First-Time Setup

For a fresh installation, run:

```bash
cp .env.example .env
nano .env
docker compose up -d --build
docker compose ps
docker compose logs -f
```

For bot-only logs:

```bash
docker compose logs -f bot
```

---

## 🤖 Bot Management

**Start Bot**

```bash
docker compose up -d bot
```

**Stop Bot**

```bash
docker compose stop bot
```

**Restart Bot**

```bash
docker compose restart bot
```

**Check Bot**

```bash
docker compose ps bot
```

**Bot Logs**

```bash
docker compose logs -f bot
```

---

## 🔄 Bot Rebuild & Update

Whenever `dist/adbot` is updated:

**1. Stop Bot**

```bash
docker compose stop bot
```

**2. Rebuild Bot**

```bash
docker compose build --no-cache bot
```

**3. Start Bot**

```bash
docker compose up -d --build bot
```

**4. Check Status**

```bash
docker compose ps
```

**5. View Logs**

```bash
docker compose logs -f bot
```

**One-Line Update**

```bash
docker compose stop bot && docker compose build --no-cache bot && docker compose up -d --build bot && docker compose ps && docker compose logs -f bot
```

---

## 🧱 Full Stack Management

**Start**

```bash
docker compose up -d
```

**Build & Start**

```bash
docker compose up -d --build
```

**Stop**

```bash
docker compose stop
```

**Restart**

```bash
docker compose restart
```

**Remove Containers**

```bash
docker compose down
```

> `docker compose down` does not remove named volumes by default.

---

## 🗄️ PostgreSQL

**Check Status**

```bash
docker compose ps postgres
```

**Check Health**

```bash
docker compose exec postgres pg_isready
```

**Logs**

```bash
docker compose logs -f postgres
```

**Restart**

```bash
docker compose restart postgres
```

---

## ⚡ Redis

**Check Status**

```bash
docker compose ps redis
```

**Test Redis**

```bash
docker compose exec redis redis-cli ping
```

Expected: `PONG`

**Redis CLI**

```bash
docker compose exec redis redis-cli
```

**Logs**

```bash
docker compose logs -f redis
```

**Restart**

```bash
docker compose restart redis
```

---

## ❤️ Health Checks

PostgreSQL:

```bash
docker compose exec postgres pg_isready
```

Redis:

```bash
docker compose exec redis redis-cli ping
```

Overall:

```bash
docker compose ps
```

**Startup Flow**

```
┌─────────────────┐
│   PostgreSQL    │
│                 │
│    Healthy      │
└────────┬────────┘
         │
         │
┌────────▼────────┐
│      Redis      │
│                 │
│    Healthy      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│       Bot       │
│                 │
│      RUN        │
└─────────────────┘
```

The bot waits for PostgreSQL and Redis health checks before starting.

---

## 💾 Persistent Storage

PostgreSQL: `postgres_data`

Redis: `redis_data`

List volumes:

```bash
docker volume ls
```

Inspect PostgreSQL volume:

```bash
docker volume inspect postgres_data
```

Inspect Redis volume:

```bash
docker volume inspect redis_data
```

> Do not delete these volumes unless you intentionally want to remove persistent data.

---

## 🌐 Docker Networking

Inside Docker Compose:

**PostgreSQL**

```
postgres:5432
```

**Redis**

```
redis:6379
```

❌ Incorrect

```
localhost:5432
localhost:6379
```

✅ Correct

```
postgres:5432
redis:6379
```

Inside a container, `localhost` refers to that same container.

---

## 🔍 Container Debugging

Running containers:

```bash
docker ps
```

All containers:

```bash
docker ps -a
```

Inspect bot:

```bash
docker inspect aibot
```

Open bot shell:

```bash
docker exec -it aibot bash
```

If Bash is unavailable:

```bash
docker exec -it aibot sh
```

---

## 🛠️ Troubleshooting

### PostgreSQL Connection Refused

If the bot shows:

```
connection to server at "localhost"
port 5432 failed
```

The bot is using the wrong hostname.

Use:

```
postgres:5432
```

instead of:

```
localhost:5432
```

Check PostgreSQL:

```bash
docker compose ps postgres
```

View logs:

```bash
docker compose logs postgres
```

---

### Redis Connection Refused

Check Redis:

```bash
docker compose ps redis
```

Test:

```bash
docker compose exec redis redis-cli ping
```

Expected: `PONG`

---

### Bot Keeps Restarting

Check status:

```bash
docker compose ps
```

View recent logs:

```bash
docker compose logs --tail=200 bot
```

Follow logs:

```bash
docker compose logs -f bot
```

---

### GLIBC Error

If you see:

```
GLIBC_2.38 not found
```

the bot executable requires a newer GLIBC version than the container provides.

The current Docker image uses:

```dockerfile
FROM debian:trixie-slim
```

which provides a modern GLIBC version compatible with the current executable.

---

## 🔒 Security

Production recommendations:

- Never commit `.env`.
- Use strong PostgreSQL passwords.
- Keep credentials private.
- Keep Redis private.
- Avoid exposing PostgreSQL publicly.
- Avoid exposing Redis publicly.
- Keep Docker images updated.
- Back up PostgreSQL data.
- Monitor application logs.
- Use least-privilege credentials.
- Do not expose the Docker socket unnecessarily.

---

## 🧹 Docker Cleanup

Remove stopped containers:

```bash
docker container prune
```

Remove unused images:

```bash
docker image prune
```

Remove unused Docker resources:

```bash
docker system prune
```

Remove unused images too:

```bash
docker system prune -a
```

⚠️ **Dangerous** — avoid this unless you intentionally want to delete unused volumes:

```bash
docker system prune -a --volumes
```

Deleting PostgreSQL or Redis volumes can permanently delete persistent data.

---

## 🔐 Git Security

Before committing:

```bash
git status
```

Make sure `.env` does not appear as a file to commit.

The repository should contain:

```
.env.example
```

and should **not** contain:

```
.env
```

Recommended `.gitignore`:

```gitignore
.env
__pycache__/
*.pyc
.venv/
venv/
```

---

## 📦 Production Deployment

Fresh production deployment:

```bash
cp .env.example .env
nano .env
docker compose build --no-cache
docker compose up -d
docker compose ps
docker compose logs -f
```

Bot-only monitoring:

```bash
docker compose logs -f bot
```

---

## 🔁 Production Bot Update

When a new `dist/adbot` executable is deployed:

```bash
docker compose stop bot
docker compose build --no-cache bot
docker compose up -d --build bot
docker compose ps
docker compose logs -f bot
```

---

## 📋 Command Reference

| Command                                    | Description                  |
| ------------------------------------------ | ---------------------------- |
| `cp .env.example .env`                     | Create .env                  |
| `nano .env`                                | Edit environment             |
| `docker compose build`                     | Build all images             |
| `docker compose build --no-cache`          | Clean build                  |
| `docker compose up -d`                     | Start all services           |
| `docker compose up -d --build`             | Build and start all services |
| `docker compose ps`                        | Check service status         |
| `docker compose logs -f`                   | View all live logs           |
| `docker compose logs -f bot`               | View bot logs                |
| `docker compose up -d bot`                 | Start bot                    |
| `docker compose stop bot`                  | Stop bot                     |
| `docker compose restart bot`               | Restart bot                  |
| `docker compose build --no-cache bot`      | Rebuild bot                  |
| `docker compose up -d --build bot`         | Rebuild and start bot        |
| `docker compose stop`                      | Stop all services            |
| `docker compose restart`                   | Restart all services         |
| `docker compose down`                      | Remove containers            |
| `docker compose exec postgres pg_isready`  | Check PostgreSQL             |
| `docker compose exec redis redis-cli ping` | Check Redis                  |
| `docker compose logs -f postgres`          | PostgreSQL logs              |
| `docker compose logs -f redis`             | Redis logs                   |

---

## 🧪 Post-Deployment Verification

Check all services:

```bash
docker compose ps
```

Check bot:

```bash
docker compose logs --tail=100 bot
```

Check PostgreSQL:

```bash
docker compose exec postgres pg_isready
```

Check Redis:

```bash
docker compose exec redis redis-cli ping
```

Expected Redis response: `PONG`

---

## 🔄 Complete Lifecycle

```
┌──────────────────────────────┐
│ 1. Environment               │
│                              │
│ cp .env.example .env         │
│ nano .env                    │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│ 2. Build                     │
│                              │
│ docker compose build         │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│ 3. Run                       │
│                              │
│ docker compose up -d         │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│ 4. Status                    │
│                              │
│ docker compose ps            │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│ 5. All Logs                  │
│                              │
│ docker compose logs -f       │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│ 6. Bot Logs                  │
│                              │
│ docker compose logs -f bot   │
└──────────────────────────────┘
```

---

## 🚀 Recommended First Deployment

Run these commands in order:

```bash
cp .env.example .env
nano .env
docker compose build --no-cache
docker compose up -d
docker compose ps
docker compose logs -f
```

For bot-only logs:

```bash
docker compose logs -f bot
```

---

## 🔄 Recommended Bot Update

```bash
docker compose stop bot
docker compose build --no-cache bot
docker compose up -d --build bot
docker compose ps
docker compose logs -f bot
```

---

## 📄 License

This is a private project.

Unauthorized copying, redistribution, modification, or commercial use is not permitted without explicit permission from the project owner.

---

## 👨‍💻 Maintainer

**Sorabh Yadav**

GitHub: [https://github.com/sorabhyadavpalothar/adbot](https://github.com/sorabhyadavpalothar/adbot)

---

<p align="center">
  Built with Docker, PostgreSQL & Redis.
</p>
