# python.do — next steps

Wagtail scaffold is in place on branch `initialization`.

## Suggested follow-ups

1. Merge `initialization` → `dev` when you are happy with the bootstrap.
2. Create content types (events, resources) as Wagtail page models in `apps/`.
3. Configure production hosting (DNS, PostgreSQL, `DJANGO_SECRET_KEY`, `ALLOWED_HOSTS`).
4. Add CI (GitHub Actions): `ruff`, `pytest`, `npm run build`.

## Kit upgrades

Re-install agents from the kit (preserves manifest unless `--force`):

```bash
/home/coronado/Proyectos/AOK/scripts/install.sh /home/coronado/Proyectos/python.do \
  --profile python-wagtail --name python.do
```
