# 📘 Diccionario de Datos – Plantilla General

**Tabla Cliente**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`    | INT          | -      | ✅  | ❌  | ❌   | ✅        | -                                       | -                                | Identificador del cliente               |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ❌        | -                                       | -                                | Nombre completo del cliente             |
| `Apellido1`     | NVARCHAR     | 20      | ❌  | ❌  | ❌   | ❌       | -                                       | -                                | Apellido paterno del cliente            | -
| `Apellido2`     | NVARCHAR     | 20    | ❌  | ❌  | ❌   | ❌         | -                                       | -                                | Apellido materno del cliente            | -
