# python.do

Sitio y comunidad de usuarios de Python en República Dominicana.

## Stack previsto

- Python 3.12+, Django, Wagtail CMS
- Tailwind CSS, DaisyUI (tema oscuro por defecto)
- HTMX, Alpine.js, GSAP (presentación)

## Estado del repositorio

El kit de agentes (AOK) y el manifiesto del proyecto están instalados. El scaffold de la aplicación Wagtail está pendiente; ver [NEXT_STEPS.md](NEXT_STEPS.md).

## Requisitos (cuando exista la app)

- Python 3.12+
- Node.js (pipeline de assets con npm)
- PostgreSQL (desarrollo y producción)

## Desarrollo con agentes

Consulta [AGENTS.md](AGENTS.md) para el equipo de agentes y los workflows. En Cursor, menciona `@Architect` para coordinar tareas de varias capas.

## Ramas

| Rama | Uso |
|------|-----|
| `main` | Producción / releases |
| `dev` | Integración |
| `initialization` | Bootstrap inicial (rama activa de arranque) |
