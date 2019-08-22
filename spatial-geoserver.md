*****************************
Server install dependencies *
*****************************
SAMBA share mount:
1) install cifs extension to mount in samba share
sudo yum install cifs-utils

2) HTOP install:
sudo yum install epel-release
sudo yum install htop


3) Docker installation:
https://docs.docker.com/install/linux/docker-ce/centos/#install-using-the-repository
sudo systemctl start docker
sudo usermod -aG docker <username>

4) docker-compose install:
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

5) git installation:
sudo yum install git

6) Mount in spatial file store:
sudo mount -t cifs //spatialfs.saeon.int/spatialdata$ /mnt/spatial-data -o username=BryanM

8) screen install
yum install screen

sudo yum install vim

**********************
Geoserver installs   *
**********************
1) Git clone from repo:
git clone  --single-branch --branch deploy-all-geoserver-instances https://github.com/bryan-mcalister-saeon/deploy-spatial-services.git deploy-all-geoserver-instances

2) Make local copy of geoserver configuration:
mkdir ./geoserver-config/ && cp -r /mnt/spatial-data/geoserver-config-backups/2019-08-12/* ./geoserver-config/

3) Only for instance 9; Make a local copy of its data (netCDF data: performance issues reading from windows network drive share)
Also delete all tmp folders in the local copy, remove all files returned by below command:
for f in `find ./spatial-data/instance_9/ -type d -iname ".*" `; do echo $f; done


4) Build geoserver image
< deploy-all-geoserver-instances $> docker-compose build

5) 


logs (separate logs per instance)
reconfig db ip address to db server
change mount location of spatial data to /mnt/spatial-data/...
rename geoserver image names to share geoserve image
set docker volumes folder to be in /home, not in /var












