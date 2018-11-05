## Como iniciar el proyecto por primera vez
1. Levantar los contenedores con el siguiente comando
```
$ docker-compose up
```
2. Dirigirse al administrador web en la url `http://localhost:8080`
3. Poner las credenciales **user = proyecto_bi**, **password = 123456** y **bd = proyecto_bi**
4. Meterse a la consola y ejecutar todos los comandos del archivo **tablas.sql**

## Comandos útiles

* Levantar los contenedores (base de datos y administrador)
```
$ docker-compose up
```

* Para detener los contenedores aprete `CTRL+C` o en la carpeta del proyecto ejecute el siguiente comando
```
$ docker-compose stop
```

* Conectarse a la consola de postgres del contenedor
```
$ docker exec -it bi_db psql -U proyecto_bi
```
