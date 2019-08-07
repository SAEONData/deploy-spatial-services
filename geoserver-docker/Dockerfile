FROM tomcat:8-jre8
RUN apt-get update
RUN apt-get install -y wget openjdk-8-jdk
#RUN cd /tmp && unzip geoserver-2.10.1-war.zip -d geoserver-2.10.1

#RUN sudo apt-get install 

#Install Geoserver
ARG GS_VERSION=2.10.1
#ARG GS_VERSION=2.14.1

RUN mkdir /tmp/gs/ && cd /tmp/gs && wget https://sourceforge.net/projects/geoserver/files/GeoServer/$GS_VERSION/geoserver-$GS_VERSION-war.zip
RUN cd /tmp/gs && unzip geoserver-$GS_VERSION-war.zip
RUN mkdir /tmp/gs/warunpack/ && cd /tmp/gs/warunpack/ && jar -xvf ../geoserver.war
RUN mkdir /tmp/gsplugs/ && cd /tmp/gsplugs/ && \
    wget https://sourceforge.net/projects/geoserver/files/GeoServer/$GS_VERSION/extensions/geoserver-$GS_VERSION-netcdf-plugin.zip && \
    wget https://sourceforge.net/projects/geoserver/files/GeoServer/$GS_VERSION/extensions/geoserver-$GS_VERSION-wps-plugin.zip 

RUN cd /tmp/gsplugs/ && ls
RUN unzip /tmp/gsplugs/geoserver-$GS_VERSION-netcdf-plugin.zip -d /tmp/gs/warunpack/WEB-INF/lib/
RUN unzip /tmp/gsplugs/geoserver-$GS_VERSION-wps-plugin.zip -d /tmp/gs/warunpack/WEB-INF/lib/

RUN ls

COPY web.xml  /tmp/gs/warunpack/WEB-INF/

RUN cd /tmp/gs/warunpack/ && jar -cvf ../geoserver.repack.war *

RUN touch /usr/local/tomcat/webapps/tmp.txt

RUN cp /tmp/gs/geoserver.repack.war /usr/local/tomcat/webapps/geoserver.war

RUN apt-get install -y vim

RUN mkdir /opt/config_dir/
RUN mkdir /mnt/data_dir/

#wget https://sourceforge.net/projects/geoserver/files/GeoServer/2.10.1/extensions/geoserver-2.10.1-netcdf-plugin.zip
#unzip geoserver-2.10.1-netcdf-plugin.zip -d webapps/geoserver/WEB-INF/lib/
#rm geoserver-2.10.1-netcdf-plugin.zip

#wget https://sourceforge.net/projects/geoserver/files/GeoServer/2.10.1/extensions/geoserver-2.10.1-wps-plugin.zip
#unzip geoserver-2.10.1-wps-plugin.zip -d webapps/geoserver/WEB-INF/lib/
#rm geoserver-2.10.1-wps-plugin.zip

#RUN wget http://sourceforge.net/projects/geoserver/files/GeoServer/2.10.1/geoserver-2.10.1-war.zip \
#    --directory-prefix=/opt/tomcat/webapps;cd /opt/tomcat/webapps; \
#    unzip geoserver-2.10.1-war.zip -d geoserver-2.10.1; \
#    cp geoserver-2.10.1/geoserver.war ${dest}#geoserver.war; \
#    rm -rf geoserver-2.10.1* 

#cp geoserver-2.10.1/geoserver.war webapps/
#rm -rf geoserver-2.10.1*

#RUN apt-get install -y python-pip git libgeos-dev libxml2-dev libxslt1-dev
#RUN mkdir /var/www/ && cd /var/www/ && git clone -b elastic https://github.com/SAEONData/pycsw.git


#RUN cd /var/www/pycsw/ && pip install -e . && pip install -r requirements-standalone.txt
#RUN cd /var/www/pycsw/ && pip install -r requirements-dev.txt
#COPY default.cfg /var/www/pycsw/

CMD ["catalina.sh", "run"]
#CMD touch /tmp/test.txt && tail -f /tmp/test.txt
