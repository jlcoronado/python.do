import pytest
from django.urls import reverse


@pytest.mark.django_db
def test_homepage(client):
    response = client.get("/")
    assert response.status_code == 200


@pytest.mark.django_db
def test_search_page(client):
    response = client.get(reverse("search"))
    assert response.status_code == 200


@pytest.mark.django_db
def test_search_htmx_partial(client):
    response = client.get(reverse("search"), {"query": "python"}, HTTP_HX_REQUEST="true")
    assert response.status_code == 200
    assert b"<!DOCTYPE html>" not in response.content
