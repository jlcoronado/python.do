# python.do — next steps

AOK agents are installed. Open this folder as the Cursor workspace root (not the AOK kit repo).

## Scaffold the application

In Cursor chat:

```
@Architect — Run workflow feature-delivery end to end.

Request: Scaffold Wagtail project for python.do: Tailwind CSS + DaisyUI dark default, HTMX search/filter for books and documents, Alpine.js menus and modals, GSAP hero animations.
```

Or from the terminal:

```bash
./scripts/run-workflow.sh .architecture/workflows/feature-delivery.yaml \
  --prompt "Scaffold Wagtail project: Tailwind+DaisyUI dark default, HTMX search/filter, Alpine menus, GSAP hero"
```

## Kit upgrades

Re-install agents from the kit (preserves this manifest unless you pass `--force`):

```bash
/home/coronado/Proyectos/AOK/scripts/install.sh /home/coronado/Proyectos/python.do \
  --profile python-wagtail --name python.do
```
