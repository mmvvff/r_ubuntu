# R Server Setup on Ubuntu

English | [Spanish](https://github.com/mmvvff/r_ubuntu/blob/main/r_ubuntu_es/README_ES.md)

## Motivation

Given that some researchers, data analysts, and data scientists face personal computers' constraints, we find it useful to take advantage of cloud infrastructure and open-source technologies such as Ubuntu and R servers. This setup provides several advantages:

1. **Scalability**: Cloud-based R servers can be easily scaled up or down based on computational needs, allowing for efficient resource allocation and cost management.

2. **Accessibility**: An R server setup enables remote access to powerful computing resources from any device with an internet connection, facilitating collaboration and work flexibility.

3. **Reproducibility**: By using a standardized server environment, it becomes easier to ensure consistency across different projects and team members, enhancing the reproducibility of research and analysis.

4. **Resource Optimization**: Cloud servers often provide more RAM, CPU cores, and storage than personal computers, allowing for faster processing of large datasets and complex analyses.

5. **Cost-Effectiveness**: For resource-intensive projects, it can be more cost-effective to use cloud infrastructure on-demand rather than investing in high-end personal hardware.

By leveraging Ubuntu and R servers in the cloud, researchers and data professionals can overcome local hardware limitations, enhance their productivity, and focus on their core work without being hindered by technical constraints.

## Prerequisites

- Ubuntu operating system (tested on Focal Fossa 20.04 LTS)
- Sudo privileges

## Installation Steps

1. **Update System Packages**
   - Updates package lists and upgrades installed packages.

2. **R Setup**
   - Installs R environment and essential helper packages.
   - Adds the R 4.0 repository from CRAN.
   - Installs the R base package.

3. **R Libraries**
   - Installs development tools required for compiling R packages.
   - Installs dependencies for the tidyverse package.

4. **RStudio Desktop Setup**
   - Installs gdebi-core for handling local deb packages.
   - Downloads and installs RStudio Desktop.

5. **RStudio Server Setup**
   - Downloads and installs RStudio Server.
   - Verifies the RStudio Server installation.
   - Creates a new user for RStudio Server.

## Usage

1. Clone this repository or copy the script to your Ubuntu machine.
2. Make the script executable:
   ```
   chmod +x setup_r_server.sh
   ```
3. Run the script with sudo privileges:
   ```
   sudo ./setup_r_server.sh
   ```
4. Follow any prompts during the installation process.

## Accessing RStudio Server

After the installation is complete, you can access RStudio Server using a web browser:

1. Find your server's IP address (displayed at the end of the script).
2. Open a web browser and go to `http://<ip_server>:8787`.
3. Log in using the credentials of the user created during the setup (default: mmvvff).

## Notes

- The script installs specific versions of RStudio Desktop and Server. Check the [RStudio download page](https://posit.co/download/rstudio-desktop/) for the latest versions and update the download URLs in the script accordingly.
- Ensure you have a stable internet connection during the installation process.
- The script is set up for Ubuntu Focal Fossa (20.04 LTS). Adjust the repository and package versions if using a different Ubuntu release.

## Customization

- To change the default user created for RStudio Server, modify the `useradd` command in the script.
- Additional R packages can be installed by adding `sudo Rscript -e "install.packages('package_name')"` commands to the script.

## Troubleshooting

If you encounter any issues during the installation:

1. Check the Ubuntu version compatibility.
2. Ensure all required repositories are accessible.
3. Verify that you have sufficient disk space and memory.
4. Check the RStudio Server logs: `sudo rstudio-server verify-installation`

For further assistance, consult the [RStudio Server admin guide](https://docs.rstudio.com/ide/server-pro/latest/).