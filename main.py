import os

from flask import Flask, jsonify

from app.main.controllers.health_check import ns_health
from app.main.extension import api
from config import config


def create_app(config_name):
    application = Flask(__name__)
    application.url_map.strict_slashes = False
    application.config.from_object(config[config_name])
    application.config.from_pyfile(".env", silent=False)

    for i in application.config:
        os.environ[i] = str(application.config[i])

    api.init_app(application)
    # redis.init_app(application)

    return application


def init_api(application):
    for i in application.config:
        os.environ[i] = str(application.config[i])

    api.add_namespace(ns_health)

    @application.errorhandler(404)
    def page_not_found(e):
        return jsonify(error=404, text=str(e)), 404

    @application.errorhandler(500)
    def application_error(e):
        return jsonify(error=500, text="Application error"), 500

    @application.errorhandler(503)
    def handle_503_error(error):
        return jsonify(error=503, text='Internal Server Error ...'), 503

    return application
