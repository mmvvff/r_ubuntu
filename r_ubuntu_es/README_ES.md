# Configuración del Servidor R en Ubuntu

## Motivación

Dado que algunos investigadores, analistas de datos y científicos de datos enfrentan limitaciones en sus computadoras personales, encontramos útil aprovechar la infraestructura en la nube y las tecnologías de código abierto como Ubuntu y los servidores R. Esta configuración ofrece varias ventajas:

1. **Escalabilidad**: Los servidores R basados en la nube pueden escalarse fácilmente según las necesidades computacionales, permitiendo una asignación eficiente de recursos y gestión de costos.

2. **Accesibilidad**: Una configuración de servidor R permite el acceso remoto a recursos informáticos potentes desde cualquier dispositivo con conexión a internet, facilitando la colaboración y la flexibilidad laboral.

3. **Reproducibilidad**: Al utilizar un entorno de servidor estandarizado, es más fácil asegurar la consistencia entre diferentes proyectos y miembros del equipo, mejorando la reproducibilidad de la investigación y el análisis.

4. **Optimización de recursos**: Los servidores en la nube a menudo proporcionan más RAM, núcleos de CPU y almacenamiento que las computadoras personales, permitiendo un procesamiento más rápido de grandes conjuntos de datos y análisis complejos.

5. **Rentabilidad**: Para proyectos que requieren muchos recursos, puede ser más rentable utilizar infraestructura en la nube bajo demanda en lugar de invertir en hardware personal de alta gama.

Al aprovechar Ubuntu y los servidores R en la nube, los investigadores y profesionales de datos pueden superar las limitaciones del hardware local, mejorar su productividad y centrarse en su trabajo principal sin verse obstaculizados por restricciones técnicas.

## Prerrequisitos

- Sistema operativo Ubuntu (probado en Focal Fossa 20.04 LTS)
- Privilegios de sudo

## Pasos de instalación

1. **Actualizar paquetes del sistema**
   - Actualiza las listas de paquetes y mejora los paquetes instalados.

2. **Configuración de R**
   - Instala el entorno R y paquetes auxiliares esenciales.
   - Añade el repositorio R 4.0 de CRAN.
   - Instala el paquete base de R.

3. **Bibliotecas de R**
   - Instala herramientas de desarrollo necesarias para compilar paquetes de R.
   - Instala dependencias para el paquete tidyverse.

4. **Configuración de RStudio Desktop**
   - Instala gdebi-core para manejar paquetes deb locales.
   - Descarga e instala RStudio Desktop.

5. **Configuración de RStudio Server**
   - Descarga e instala RStudio Server.
   - Verifica la instalación de RStudio Server.
   - Crea un nuevo usuario para RStudio Server.

## Uso

1. Clona este repositorio o copia el script en tu máquina Ubuntu.
2. Haz el script ejecutable:
   ```
   chmod +x setup_r_server.sh
   ```
3. Ejecuta el script con privilegios de sudo:
   ```
   sudo ./setup_r_server.sh
   ```
4. Sigue las indicaciones durante el proceso de instalación.

## Acceso a RStudio Server

Después de completar la instalación, puedes acceder a RStudio Server usando un navegador web:

1. Encuentra la dirección IP de tu servidor (se muestra al final del script).
2. Abre un navegador web y ve a `http://<ip_servidor>:8787`.
3. Inicia sesión usando las credenciales del usuario creado durante la configuración (por defecto: mmvvff).

## Notas

- El script instala versiones específicas de RStudio Desktop y Server. Verifica la [página de descarga de RStudio](https://posit.co/download/rstudio-desktop/) para las últimas versiones y actualiza las URLs de descarga en el script según sea necesario.
- Asegúrate de tener una conexión a internet estable durante el proceso de instalación.
- El script está configurado para Ubuntu Focal Fossa (20.04 LTS). Ajusta el repositorio y las versiones de los paquetes si utilizas una versión diferente de Ubuntu.

## Personalización

- Para cambiar el usuario predeterminado creado para RStudio Server, modifica el comando `useradd` en el script.
- Se pueden instalar paquetes adicionales de R añadiendo comandos `sudo Rscript -e "install.packages('nombre_del_paquete')"` al script.

## Solución de problemas

Si encuentras algún problema durante la instalación:

1. Verifica la compatibilidad de la versión de Ubuntu.
2. Asegúrate de que todos los repositorios requeridos sean accesibles.
3. Verifica que tengas suficiente espacio en disco y memoria.
4. Revisa los registros de RStudio Server: `sudo rstudio-server verify-installation`

Para obtener más ayuda, consulta la [guía de administración de RStudio Server](https://docs.rstudio.com/ide/server-pro/latest/).