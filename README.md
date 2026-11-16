# Sistema Web de Reserva de Horas Médicas

Proyecto académico integrador DevOps para una empresa ficticia del rubro salud. Implementa una página web estática servida por Nginx mediante Docker y Docker Compose.

> **Importante:** este proyecto es una demostración de interfaz. No contiene API, base de datos ni sistema real de agendamiento. No ingreses ni publiques datos personales, credenciales o información clínica.

## 1. Objetivo

Disponer de un entorno local reproducible para una página de reserva de horas médicas. Dockerfile y Docker Compose describen la construcción y ejecución del servicio, reduciendo diferencias entre computadores y facilitando la trazabilidad de los cambios.

## 2. Tecnologías

- HTML5 y CSS3: interfaz estática.
- Nginx Alpine: servidor web.
- Docker: construcción y ejecución del contenedor.
- Docker Compose: definición declarativa del servicio local.
- Git y GitHub: control de versiones y trazabilidad.
- GitHub Actions: validación básica opcional del repositorio.

## 3. Estructura

```text
sistema-reserva-horas-medicas/
├── src/
│   ├── index.html
│   └── styles.css
├── .github/
│   └── workflows/
│       └── devopsautomation.yml
├── Dockerfile
├── docker-compose.yml
├── nginx.conf
├── .gitignore
├── .env.example
└── README.md
```

## 4. Requisitos previos

1. Docker Desktop instalado y en ejecución.
2. Git instalado.
3. Un navegador web.
4. Cuenta de GitHub para publicar el repositorio.

Descargas oficiales:
- Docker Desktop: https://www.docker.com/products/docker-desktop/
- Git: https://git-scm.com/downloads

Verifica las herramientas:

```bash
docker --version
docker compose version
git --version
```

## 5. Instalación y ejecución local

Clona el repositorio:

```bash
git clone https://github.com/USUARIO/sistema-reserva-horas-medicas.git
cd sistema-reserva-horas-medicas
```

Crea el archivo local de configuración a partir de la plantilla:

En Windows PowerShell:

```powershell
Copy-Item .env.example .env
```

En macOS o Linux:

```bash
cp .env.example .env
```

Construye la imagen y levanta el servicio:

```bash
docker compose up -d --build
```

Abre en el navegador:

http://localhost:8080

El formulario permite simular una solicitud. No transmite ni almacena la información ingresada.

## 6. Verificación del servicio

Comprueba que el contenedor esté ejecutándose:

```bash
docker compose ps
```

Revisa los registros de Nginx:

```bash
docker compose logs
```

Sigue los registros en tiempo real:

```bash
docker compose logs -f web
```

Consulta el endpoint local de salud:

```bash
curl http://localhost:8080/health
```

La respuesta esperada es:

```text
OK
```

También puedes revisar la página principal:

```bash
curl -I http://localhost:8080
```

En Docker Desktop, revisa el contenedor `reserva-horas-medicas` y su estado.

## 7. Detener y eliminar el servicio

Para detener y eliminar el contenedor y la red creada por Compose:

```bash
docker compose down
```

Para volver a levantar el servicio después de modificar archivos:

```bash
docker compose up -d --build
```

## 8. Configuración del entorno

El archivo `.env.example` documenta la variable `SERVICE_PORT`, cuyo valor por defecto es `8080`. Docker Compose publica ese puerto del equipo local hacia el puerto `80` del contenedor.

Si se necesita utilizar otro puerto, modifica el valor en el archivo `.env` local. No publiques el archivo `.env`.

## 9. Seguridad y protección de información

- No se incluyen contraseñas, tokens, claves ni credenciales reales.
- `.env.example` contiene únicamente un parámetro de ejemplo no secreto.
- `.gitignore` excluye `.env` y archivos temporales.
- No se deben utilizar nombres, RUT, correos, teléfonos ni datos clínicos reales.
- El formulario es demostrativo y no procesa reservas reales.
- Antes de cada `git push`, revisar los archivos que serán publicados con `git status` y `git diff --cached`.
- Si una credencial se publica accidentalmente, debe revocarse o rotarse; eliminarla del último commit no garantiza que deje de estar expuesta.

## 10. Logs, métricas y observabilidad

Nginx envía los registros de acceso a `stdout` y los errores a `stderr`. Docker permite consultarlos mediante `docker compose logs`.

Indicadores básicos que pueden observarse en este entorno:
- Estado del contenedor: ejecutándose o detenido.
- Estado del healthcheck: saludable o no saludable.
- Respuesta HTTP de la página principal.
- Respuesta HTTP del endpoint `/health`.
- Solicitudes y errores registrados en los logs de Nginx.

Comandos de revisión:

```bash
docker compose ps
docker inspect --format='{{.State.Health.Status}}' reserva-horas-medicas
docker compose logs --tail=50 web
```

Este proyecto no incorpora una plataforma externa de métricas ni monitoreo productivo. Los indicadores anteriores corresponden a verificaciones locales de la demostración.

## 11. Control de versiones con Git y GitHub

Inicializa el repositorio y registra la primera versión:

```bash
git init
git add .
git status
git commit -m "Crear sitio de reserva médica con Nginx y Docker"
git branch -M main
git remote add origin https://github.com/USUARIO/sistema-reserva-horas-medicas.git
git push -u origin main
```

Reemplaza `USUARIO` por tu usuario real de GitHub y crea previamente un repositorio público vacío con ese nombre.

Para trabajar en una mejora:

```bash
git switch -c feature/mejora-interfaz
```

Después de modificar los archivos:

```bash
git add .
git commit -m "Mejorar interfaz de reserva médica"
git push -u origin feature/mejora-interfaz
```

En GitHub crea un Pull Request hacia `main`, revisa los cambios y luego intégralos. Mantén commits pequeños y descriptivos para facilitar la trazabilidad.

## 12. Automatización con GitHub Actions

El flujo `.github/workflows/devopsautomation.yml` revisa la presencia de archivos obligatorios y valida que el HTML tenga una estructura básica. Se ejecuta al realizar `push` o `pull_request` hacia `main`.

Esta automatización valida el repositorio; no publica la aplicación en servidores externos.

## 13. Alcance y limitaciones

La solución cumple el propósito de simular un entorno local reproducible para una página estática. No autentica usuarios, no consulta disponibilidad médica real, no almacena reservas, no integra sistemas clínicos y no debe utilizarse para atención de pacientes.

## 14. Evidencias recomendadas para el informe

Incluye capturas propias de:
1. Estructura de carpetas y archivos del repositorio.
2. Dockerfile y `docker-compose.yml`.
3. Docker Desktop con el contenedor en ejecución.
4. Navegador mostrando `http://localhost:8080`.
5. Resultado de `docker compose ps`.
6. Resultado de `docker compose logs`.
7. Respuesta `OK` de `http://localhost:8080/health`.
8. Repositorio público en GitHub.
9. Ejecución satisfactoria del workflow de GitHub Actions.

Cada captura debe incluir número, título descriptivo y una breve explicación en el informe.
