CREATE DATABASE IF NOT EXISTS autos_colombia;
USE autos_colombia;


CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    rol VARCHAR(30) NOT NULL DEFAULT 'OPERARIO',
    contraseña VARCHAR(255) NOT NULL
);

CREATE TABLE celda (
    id_celda INT AUTO_INCREMENT PRIMARY KEY,
    numero_celda VARCHAR(10) UNIQUE NOT NULL,
    tipo_permitido ENUM('CARRO', 'MOTO', 'CAMIONETA') NOT NULL,
    estado ENUM('DISPONIBLE', 'OCUPADA', 'MANTENIMIENTO') DEFAULT 'DISPONIBLE'
);

CREATE TABLE vehiculo (
    placa VARCHAR(10) PRIMARY KEY,
    tipo_vehiculo ENUM('CARRO', 'MOTO', 'CAMIONETA') NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50)
);


CREATE TABLE registro_entrada_salida (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    placa_vehiculo VARCHAR(10) NOT NULL,
    id_celda INT NOT NULL,
    id_usuario_entrada INT NOT NULL,
    id_usuario_salida INT NULL,
    fecha_hora_entrada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_salida DATETIME NULL,
    estado ENUM('EN_PARQUEADERO', 'FINALIZADO') DEFAULT 'EN_PARQUEADERO',
    
    FOREIGN KEY (placa_vehiculo) REFERENCES vehiculo(placa),
    FOREIGN KEY (id_celda) REFERENCES celda(id_celda),
    FOREIGN KEY (id_usuario_entrada) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_usuario_salida) REFERENCES usuario(id_usuario)
);