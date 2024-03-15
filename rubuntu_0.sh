# update indices
sudo apt update -qq -y && sudo apt upgrade -qq -y && sudo apt update -qq -y 

#### R
# instalamos entorno de R: https://cran.rstudio.com/bin/linux/ubuntu/
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# R base
sudo apt install --no-install-recommends r-base -y

##### R libraries
# requisitos
sudo apt install r-base-dev -y

# tidyverse
# dependencias
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev


# R studio server
# requisitos
sudo apt -y install gdebi-core
# check Ubunut version
lsb_release -a

# download Rstudio
# check download link in: https://posit.co/download/rstudio-desktop/#download
cd downloads
sudo wget https://download1.rstudio.org/electron/focal/amd64/rstudio-2023.09.1-494-amd64.deb
sudo gdebi -n rstudio-2023.09.1-494-amd64.deb

# download R server
# check download link in: https://posit.co/download/rstudio-server/
cd downloads
sudo wget https://download2.rstudio.org/server/focal/amd64/rstudio-server-2023.09.1-494-amd64.deb
sudo gdebi -n rstudio-server-2023.09.1-494-amd64.deb
sudo rstudio-server stop
sudo rstudio-server verify-installation

sudo useradd -m mmvvff
sudo passwd mmvvff
sudo rstudio-server start

# get ip of server
ip_server=$(curl ipinfo.io/ip)
echo $ip_server
#http://<ip_server>:8787
#http://35.231.233.25:8787