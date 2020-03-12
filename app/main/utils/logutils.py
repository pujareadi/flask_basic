import logging
from logging.handlers import RotatingFileHandler


def init_logger():
    logger = logging.getLogger('transaction_service')
    handler = RotatingFileHandler('ndn_transaction_service.log', maxBytes=50000000, backupCount=5)
    logger.setLevel(logging.INFO)
    logger.addHandler(handler)