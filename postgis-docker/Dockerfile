#FROM postgres:9.6
FROM postgres:8.4
# Subscribe to pgsql-pkg-debian@postgresql.org for release announcements
# and watch https://github.com/docker-library/postgres Dockerfile
ARG POSTGIS_MAJOR=1.5

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG en_ZA.UTF-8
ENV LANGUAGE en_ZA.UTF-8

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
 postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
 postgis-$POSTGIS_MAJOR \
 #locales \
 #rsyslog \
 #curl \
 #wget \
 pgbouncer \
 #git \
 #build-essential \
 #python-dev \
 postgresql-server-dev-9.6 \
 postgresql-common \
 #python-psycopg2 \
 #libpq-dev \
 #python-setuptools \
 #python-requests \
RUN echo "deb [arch=amd64] http://packages.2ndquadrant.com/pglogical/apt/ `lsb_release -cs`-2ndquadrant main" >/etc/apt/sources.list.d/2ndquadrant.list \
RUN wget --quiet -O - http://packages.2ndquadrant.com/pglogical/apt/AA7A6805.asc | apt-key add - \
RUN apt-get update \
RUN apt-get install -y --no-install-recommends postgresql-$PG_MAJOR-pglogical \
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
RUN && sed -i -e 's/# en_ZA.UTF-8 UTF-8/en_ZA.UTF-8 UTF-8/' /etc/locale.gen \
RUN echo 'LANG="en_ZA.UTF-8"'>/etc/default/locale \
RUN dpkg-reconfigure locales \
RUN update-locale LANG=en_ZA.UTF-8 \
RUN dpkg-reconfigure locales \
RUN rm -rf /var/lib/apt/lists/*

#RUN ls && cd /var/ && git clone git://github.com/Kozea/Multicorn.git && cd Multicorn && make && make install

# Optional entrypoint script to set UID/GID of postgres user
ADD set-postgres-uid.sh /set-postgres-uid.sh
#COPY scripts /tmp/
#RUN ls /tmp && ls /tmp 
#RUN cd /tmp/google-ft-fdw/ && python setup.py install
