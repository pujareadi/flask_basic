
def test_health_check(client):
    response = client.get('/health-check')
    assert response.status_code == 200
