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
cp .env.example .env
# En .env debe quedar POSTGRES_PORT=5433 (no 5432 si ya tienes Postgres en el sistema)

docker compose up -d db
docker compose ps    # db debe estar "healthy"

python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-dev.txt
python manage.py migrate
python manage.py createsuperuser   # opcional

npm install
npm run build

python manage.py runserver
```

Sitio: http://localhost:8000  
Admin Wagtail: http://localhost:8000/admin/

### Si el puerto 5432 ya está ocupado

Otro PostgreSQL en tu máquina suele usar el puerto 5432. El contenedor de este proyecto publica **5433** en el host.

1. En `.env`: `POSTGRES_PORT=5433`
2. `docker compose down && docker compose up -d db`
3. Vuelve a ejecutar `python manage.py migrate`

### SQLite rápido (sin Docker)

```bash
echo "USE_SQLITE=1" >> .env
python manage.py migrate
python manage.py runserver
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
