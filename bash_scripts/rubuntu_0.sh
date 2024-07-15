# Update and upgrade system packages
sudo apt update -qq -y && sudo apt upgrade -qq -y && sudo apt update -qq -y

# Create downloads directory in home folder
cd ~ && sudo mkdir -p downloads

#### R Setup ####

# Install R environment and essential helper packages
sudo apt install --no-install-recommends software-properties-common dirmngr

# Add the signing key for R repositories
# Key fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# Add R 4.0 repository from CRAN
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# Install R base package
sudo apt install --no-install-recommends r-base -y

#### R Libraries Setup ####

# Install development tools for compiling R packages
sudo apt install r-base-dev -y

# Install dependencies for tidyverse package
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev

#### RStudio Setup ####

# Install gdebi-core for handling local deb packages
sudo apt -y install gdebi-core

# Display Ubuntu version (for reference)
lsb_release -a

# Download and install RStudio Desktop
cd ~/downloads
sudo wget https://download1.rstudio.org/electron/focal/amd64/rstudio-2024.04.2-764-amd64.deb
sudo gdebi -n rstudio-2024.04.2-764-amd64.deb

# Download and install RStudio Server
sudo wget https://download2.rstudio.org/server/focal/amd64/rstudio-server-2024.04.2-764-amd64.deb
sudo gdebi -n rstudio-server-2024.04.2-764-amd64.deb

#### RStudio Server Configuration ####

# Stop RStudio Server service
sudo rstudio-server stop

# Verify RStudio Server installation
sudo rstudio-server verify-installation

# Create a new user for RStudio Server
sudo useradd -m mmvvff
sudo passwd mmvvff  # You'll be prompted to enter a password

# Start RStudio Server service
sudo rstudio-server start

# Get and display server's IP address
ip_server=$(curl ipinfo.io/ip)
echo "Server IP: $ip_server"

# Access RStudio Server at: http://<ip_server>:8787
# Note: Ensure TCP port 8787 is open

# Stop RStudio Server service (commented out for now)
# sudo rstudio-server stop
