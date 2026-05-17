from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.template.response import TemplateResponse
from wagtail.models import Page


def search(request):
    search_query = request.GET.get("query", None)
    page_number = request.GET.get("page", 1)

    if search_query:
        results_qs = Page.objects.live().search(search_query)
    else:
        results_qs = Page.objects.none()

    paginator = Paginator(results_qs, 10)
    try:
        search_results = paginator.page(page_number)
    except PageNotAnInteger:
        search_results = paginator.page(1)
    except EmptyPage:
        search_results = paginator.page(paginator.num_pages)

    context = {
        "search_query": search_query,
        "search_results": search_results,
    }

    if request.headers.get("HX-Request"):
        template_name = "search/partials/results.html"
    else:
        template_name = "search/search.html"

    return TemplateResponse(request, template_name, context)
