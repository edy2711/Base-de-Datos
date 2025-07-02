# 📘 Diccionario de Datos – Plantilla General

**Tabla Cliente**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`    | INT          | -     | ✅  | ❌  | ❌   | ✅        | -                                       | -                                | Identificador del cliente        |
| `Nombre`        | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Nombre completo del cliente             |
| `Apellido1`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Apellido paterno del cliente              | -
| `Apellido2`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌         | -                                       | -                                | Apellido materno del cliente              | -
| `curp`          | NCHAR        | 18    | ❌  | ❌  | ❌   | ✅         | -                                       | -                                | Clave Unica de Registro       | -
| `telefono`      | NCHAR        | 12    | ❌  | ❌  | ✅   | ❌         | -                                       | -                                | telefono del cliente              | -

**Tabla Sucursal**


| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|---------------------------------|-----------------------------------------|
| `NumSucursal`   | INT         | -      | ✅  | ❌  | ❌   | ✅       | -                                      | -                               | Identificador de la sucursal    |
| `NombreSUcursal`| NVARCHAR    | 20     | ❌  | ❌  | ❌   | ✅       | -                                      | -                               | Nombre de la sucursal          |
| `ubicacion`     | NVARCHAR    | 20     | ❌  | ❌  | ❌   | ✅       | -                                      | -                               | Ubicacion sucursal            |

**Tabla vehiculo**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumVehiculo`  | INT           | -     | ✅  | ❌  | ❌   | ✅        | -                                       | -                                | Identificador del cliente        |
| `placa`        | NCHAR         | 7     | ❌  | ❌  | ❌   | ✅        | -                                       | -                                | Nombre completo del cliente             |
| `marca`        | NVARCHAR      | 15    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Apellido paterno del cliente              | -
| `modelo`       | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌         | -                                       | -                                | Apellido materno del cliente              | -
| `anio`          | NCHAR        | 18    | ❌  | ❌  | ❌   | ❌         | -                                       | -                                | Clave Unica de Registro       | -
| `NumCliente`      | INT        | 12    | ❌  | ❌  | ✅   | ❌         | -                                       | -                                | telefono del cliente 