FROM ubuntu:16.04
MAINTAINER pujareaditya@gmail.com

RUN apt-get update && apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update -y
RUN apt-get install -y libpq-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev libcurl4-openssl-dev libapache2-mod-wsgi-py3 curl
RUN apt-get install -y build-essential python3.7 python3.7-dev python3-pip python3.7-venv && apt-get install -y git

# update pip
RUN python3.7 -m pip install pip --upgrade && python3.7 -m pip install wheel
RUN ln -svf /usr/bin/python3.7 /usr/bin/python
RUN pip3 install requests
RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && chmod +x /usr/local/bin/ep
RUN pip install circus uwsgi
RUN apt-get install -y nginx libzmq-dev libevent-dev


COPY . /var/www/app/

RUN pip install --upgrade pip
RUN pip install -r /var/www/app/requirements.txt
RUN mkdir -p /var/log/uwsgi/app
RUN touch /var/log/uwsgi/app/flask_start.log

RUN mkdir -p /run/uwsgi/app
RUN touch /run/uwsgi/app/pid
RUN rm /etc/nginx/sites-enabled/default
RUN cp /var/www/app/docker_configs/flask_start.conf /etc/nginx/sites-enabled/
RUN chown -R www-data:www-data /var/www/app/
EXPOSE 80
CMD ["bash","/var/www/app/docker_configs/startup.sh"]