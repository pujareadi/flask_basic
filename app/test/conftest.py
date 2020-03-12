import pytest
from start_app import application


@pytest.fixture
def client():
    application.config['TESTING'] = True
    test_client = application.test_client()
    return test_client

#
# @pytest.fixture
# def redis():
#     application.r