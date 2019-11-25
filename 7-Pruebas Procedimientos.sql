DELETE FROM Proveedores;
DELETE FROM Trabajadores;

/*--------------- INSERTAR TRABAJADORES --------*/
EXECUTE insertar_trabajadores('Lucia', 'Amarillo Juzcar', '55544785Y', '625447852', 1000, 'DEPENDIENTE', 'PASSCINCO', 'foto123345');
EXECUTE insertar_trabajadores('Alba', 'Sampalo Lobon', '66554478K', '644444111', 1000, 'DEPENDIENTE', 'PASSCINC58O', 'foto1235');
EXECUTE insertar_trabajadores('Sandra', 'Ruiz Tocon', '22114503H', '612210000', 2500.50, 'JEFE', 'PASSCINCJAO', 'foto78');


/*------- INSERTAR  PROVEEDORES -----------*/
EXECUTE insertar_proveedores('Juanpi', 'Lugo Iborra', '75995544L', '614725836', 'juanpi@gmail.com');
EXECUTE insertar_proveedores('Juanlu', 'Lara Montero', '54455455J', '633669955', 'juanlu@gmail.com');
