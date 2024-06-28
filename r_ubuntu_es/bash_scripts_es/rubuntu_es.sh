# Actualizar listas de paquetes y actualizar paquetes instalados en silencio
sudo apt update -qq -y && sudo apt upgrade -qq -y && sudo apt update -qq -y 

#### Configuración de R
# Instalar entorno R: https://cran.rstudio.com/bin/linux/ubuntu/
# Instalar paquetes auxiliares esenciales
sudo apt install --no-install-recommends software-properties-common dirmngr

# Agregar la clave de firma (por Michael Rutter) para los repositorios de R
# Para verificar la clave, usar: gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Huella digital: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# Agregar el repositorio R 4.0 de CRAN (ajustar 'focal' a 'groovy' o 'bionic' según sea necesario)
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# Instalar el paquete base de R
sudo apt install --no-install-recommends r-base -y

##### Bibliotecas de R
# Instalar herramientas de desarrollo necesarias para compilar paquetes de R
sudo apt install r-base-dev -y

# Instalar dependencias para el paquete tidyverse
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev

# Configuración de RStudio Server
# Instalar gdebi-core, una herramienta para instalar paquetes deb locales
sudo apt -y install gdebi-core

# Verificar la versión de Ubuntu
lsb_release -a

# Descargar e instalar RStudio Desktop
# Verificar el último enlace de descarga en: https://posit.co/download/rstudio-desktop/#download
cd downloads
sudo wget https://download1.rstudio.org/electron/focal/amd64/rstudio-2023.09.1-494-amd64.deb
sudo gdebi -n rstudio-2023.09.1-494-amd64.deb

# Descargar e instalar RStudio Server
# Verificar el último enlace de descarga en: https://posit.co/download/rstudio-server/
cd downloads
sudo wget https://download2.rstudio.org/server/focal/amd64/rstudio-server-2023.09.1-494-amd64.deb
sudo gdebi -n rstudio-server-2023.09.1-494-amd64.deb

# Detener el servicio de RStudio Server
sudo rstudio-server stop

# Verificar la instalación de RStudio Server
sudo rstudio-server verify-installation

# Crear un nuevo usuario para RStudio Server
sudo useradd -m mmvvff
sudo passwd mmvvff

# Iniciar el servicio de RStudio Server
sudo rstudio-server start

# Recuperar y mostrar la dirección IP del servidor
ip_server=$(curl ipinfo.io/ip)
echo $ip_server

# Acceder a RStudio Server en:
# http://<ip_server>:8787
# Ejemplo: http://35.231.233.25:8787