FROM python

RUN git clone https://github.com/alchrist42/n-puzzle.git var/npuzzle
RUN cd var/npuzzle/ && \
    pip install -r requirements.txt && \
    pip install gunicorn
RUN sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \[\"alchrist.42.fr\"\]/" /var/npuzzle/npuzzle/settings.py

WORKDIR /var/npuzzle/
CMD gunicorn npuzzle.wsgi  --user www-data --bind 0.0.0.0:8080
