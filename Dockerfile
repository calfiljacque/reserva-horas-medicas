FROM nginx:alpine

# Copia la página estática y su hoja de estilos al directorio público de Nginx.
COPY src/ /usr/share/nginx/html/

# Configuración para registrar accesos y errores en la salida del contenedor.
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# Nginx permanece en primer plano para que Docker pueda supervisar el proceso.
CMD ["nginx", "-g", "daemon off;"]
