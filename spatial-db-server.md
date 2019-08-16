*****************************
Server install dependencies *
*****************************
SAMBA share mount:
1) install cifs extension to mount in samba share
sudo yum install cifs-utils

2) htop install:
sudo yum install epel-release
sudo yum install htop

3) Docker installation:
https://docs.docker.com/install/linux/docker-ce/centos/#install-using-the-repository
sudo systemctl start docker

4) docker-compose install:
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

5) git installation:
sudo yum install git

6) Mount in spatial file store:
sudo mount -t cifs //spatialfs.saeon.int/spatialdata$ /mnt/spatial-data -o username=BryanM

8) screen install
yum install screen

**********************
Postgres/gis install *
**********************

1) Git clone from repo:
git clone  --single-branch --branch deploy-postgis https://github.com/bryan-mcalister-saeon/deploy-spatial-services.git deploy-postgis

2) Build
< deploy-postgis $> docker-compose build

3) Initialise database from backup (@Note: only do this on first startup)

< deploy-postgis $> docker-compose up -d
< deploy-postgis $> docker exec -it saeon_postgres bash -c "cd /scripts/ && bash restore_from_dumps.sh"





