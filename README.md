# python.do

Sitio y comunidad de usuarios de Python en República Dominicana.

## Stack

- Python 3.12+, Django 5.1, Wagtail 6.4
- PostgreSQL (desarrollo con Docker)
- Tailwind CSS 3, DaisyUI (tema oscuro por defecto)
- HTMX, Alpine.js, GSAP (presentación)

## Requisitos

- Python 3.12+
- Node.js 18+ (assets CSS)
- Docker y Docker Compose (PostgreSQL local)

## Desarrollo local

```bash
# Base de datos
cp .env.example .env
docker compose up -d db

# Python
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-dev.txt
python manage.py migrate
python manage.py createsuperuser   # opcional

# CSS (Tailwind + DaisyUI)
npm install
npm run build   # o npm run watch

# Servidor
python manage.py runserver
```

Sitio: http://localhost:8000  
Admin Wagtail: http://localhost:8000/admin/

### SQLite rápido (sin Docker)

```bash
USE_SQLITE=1 python manage.py migrate
USE_SQLITE=1 python manage.py runserver
```

## Verificación

```bash
python manage.py check
npm run build
pytest -q
ruff check apps config tests
```

## Estructura

| Ruta | Rol |
|------|-----|
| `config/` | Settings, URLs, WSGI |
| `apps/` | Modelos y vistas Wagtail (`home`, `search`) |
| `theme/` | Plantillas y estáticos (Tailwind) |

## Agentes (AOK)

Ver [AGENTS.md](AGENTS.md). En Cursor: `@Architect` para coordinar features.

## Ramas

| Rama | Uso |
|------|-----|
| `main` | Producción |
| `dev` | Integración |
| `initialization` | Bootstrap (activa hasta merge a `dev`) |

Repositorio: https://github.com/jlcoronado/python.do
