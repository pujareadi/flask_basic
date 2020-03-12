from ..extension import api
from flask_restplus import Resource

ns_health = api.namespace('health-check')

@ns_health.route('/')
class Health(Resource):

    def get(self):
        return {'get_health': 'Health OK'}

