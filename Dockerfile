FROM httpd:alpine

COPY ./build/web /usr/local/apache2/htdocs/
	
EXPOSE 80
