-- BORRAR TODAS LAS TABLAS
-- DROP SCHEMA public CASCADE;
-- CREATE SCHEMA public;

CREATE TABLE IF NOT EXISTS sexo (
    genero VARCHAR(6) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS tipo_pago (
    metodo VARCHAR(30) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS pago_mensual (
    rango_pago VARCHAR(15) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS contrato (
    renovacion VARCHAR(15) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS adulto_mayor (
    bool boolean PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS plan_internet (
    id SERIAL PRIMARY KEY,
    tipo_conexion VARCHAR(11) NOT NULL,
    seguridad VARCHAR(19) NOT NULL,
    proteccion_equipo VARCHAR(19) NOT NULL,
    respaldo VARCHAR(19) NOT NULL,
    streaming_tv VARCHAR(19) NOT NULL,
    streaming_movies VARCHAR(19) NOT NULL,
    soporte_tecnico VARCHAR(19) NOT NULL,
    UNIQUE(tipo_conexion, seguridad, proteccion_equipo, respaldo, streaming_tv, streaming_movies, soporte_tecnico)
);

CREATE TABLE IF NOT EXISTS plan_telefonico (
    id SERIAL PRIMARY KEY,
    tiene VARCHAR(3) NOT NULL,
    multiples_lineas VARCHAR(16) NOT NULL,
    UNIQUE(tiene, multiples_lineas)
);

CREATE TABLE IF NOT EXISTS socio (
    asociado VARCHAR(3) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS antiguedad (
    rango VARCHAR(15) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS plan (
    id SERIAL PRIMARY KEY,
    plan_telefonico_id int REFERENCES plan_telefonico (id) ON UPDATE CASCADE,
    plan_internet_id int REFERENCES plan_internet (id) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS perfil (
    cant_fugados int DEFAULT 0,
    cant_clientes int DEFAULT 0,
    carga_prom_mensual real DEFAULT 0.0,
    carga_prom_total real DEFAULT 0.0,
    porcentaje_fugados real DEFAULT 0.0,

    sexo_id VARCHAR(6) REFERENCES sexo (genero) ON UPDATE CASCADE,
    tipo_pago_id VARCHAR(30) REFERENCES tipo_pago (metodo) ON UPDATE CASCADE,
    pago_mensual_id VARCHAR(15) REFERENCES pago_mensual (rango_pago) ON UPDATE CASCADE,
    contrato_id VARCHAR(15) REFERENCES contrato (renovacion) ON UPDATE CASCADE,
    adulto_mayor_id boolean REFERENCES adulto_mayor (bool) ON UPDATE CASCADE,
    plan_id int REFERENCES plan (id) ON UPDATE CASCADE,
    socio_id VARCHAR(3) REFERENCES socio (asociado) ON UPDATE CASCADE,
    antiguedad_id VARCHAR(15) REFERENCES antiguedad (rango) ON UPDATE CASCADE,

    PRIMARY KEY(sexo_id, tipo_pago_id, pago_mensual_id, contrato_id, adulto_mayor_id, plan_id, socio_id, antiguedad_id)
);






















.
