# Update package lists and upgrade installed packages silently
sudo apt update -qq -y && sudo apt upgrade -qq -y && sudo apt update -qq -y 

#### R Setup
# Install R environment: https://cran.rstudio.com/bin/linux/ubuntu/
# Install essential helper packages
sudo apt install --no-install-recommends software-properties-common dirmngr

# Add the signing key (by Michael Rutter) for the R repositories
# To verify the key, use: gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# Add the R 4.0 repository from CRAN (adjust 'focal' to 'groovy' or 'bionic' as necessary)
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# Install the R base package
sudo apt install --no-install-recommends r-base -y

##### R Libraries
# Install development tools required for compiling R packages
sudo apt install r-base-dev -y

# Install dependencies for tidyverse package
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev

# RStudio Server Setup
# Install gdebi-core, a tool for installing local deb packages
sudo apt -y install gdebi-core

# Check the Ubuntu version
lsb_release -a

# Download and install RStudio Desktop
# Check the latest download link at: https://posit.co/download/rstudio-desktop/#download
cd downloads
sudo wget https://download1.rstudio.org/electron/focal/amd64/rstudio-2023.09.1-494-amd64.deb
sudo gdebi -n rstudio-2023.09.1-494-amd64.deb

# Download and install RStudio Server
# Check the latest download link at: https://posit.co/download/rstudio-server/
cd downloads
sudo wget https://download2.rstudio.org/server/focal/amd64/rstudio-server-2023.09.1-494-amd64.deb
sudo gdebi -n rstudio-server-2023.09.1-494-amd64.deb

# Stop the RStudio Server service
sudo rstudio-server stop

# Verify the RStudio Server installation
sudo rstudio-server verify-installation

# Create a new user for RStudio Server
sudo useradd -m mmvvff
sudo passwd mmvvff

# Start the RStudio Server service
sudo rstudio-server start

# Retrieve and display the server's IP address
ip_server=$(curl ipinfo.io/ip)
echo $ip_server

# Access RStudio Server at:
# http://<ip_server>:8787
# Example: http://35.231.233.25:8787
