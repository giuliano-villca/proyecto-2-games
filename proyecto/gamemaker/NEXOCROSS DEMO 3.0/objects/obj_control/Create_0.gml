// obj_control evento Create
global.panel_width = 120;  // Ancho de cada panel
global.panel_height = 76; // Alto de cada panel
global.grid_offset_x = 0; // Offset X de la cuadrícula (ajusta según sea necesario)
global.grid_offset_y = 0; // Offset Y de la cuadrícula (ajusta según sea necesario)

var rows = 3;
var columns = 6;

global.panel_rows = rows; // Añadir esta línea para definir el número de filas

// Verificar si la capa "AbovePanels" existe, si no, crearla
if (!layer_exists("AbovePanels")) {
    var layer_index = layer_create(1); // Crear capa en el índice 1
    layer_set_name(layer_index, "AbovePanels"); // Asignar el nombre "AbovePanels" a la capa
}

// Calcular el desplazamiento para centrar la cuadrícula en el room
global.grid_offset_x = (room_width - (columns * global.panel_width)) / 2;
global.grid_offset_y = (room_height - (rows * global.panel_height)) / 2 + 70;
// Crear un arreglo para almacenar los paneles
global.panels = array_create(rows, array_create(columns, {tipo: 0, propietario: 0}));

// Inicializar los paneles con valores. 0 = panel neutro, 1 = panel del jugador, 2 = panel del enemigo
for (var i = 0; i < rows; i++) {
    for (var j = 0; j < columns; j++) {
        var panel = {};
        panel.tipo = 0; // 0 = panel neutro
        if (j < 3) {
            panel.propietario = 1; // Panel del jugador
        } else {
            panel.propietario = 2; // Panel del enemigo
        }
        global.panels[i][j] = panel;
        
        // Crear instancia de obj_panel para cada panel
        var panel_x = global.grid_offset_x + (j * global.panel_width);
        var panel_y = global.grid_offset_y + (i * global.panel_height);
        
        // Verificar si es la tercera fila y crear instancias después
        if (i == 2) {
            var panel_inst = instance_create_layer(panel_x, panel_y, "Instances", obj_panel);
            
            // Usar variable_instance_set para asignar la fila y columna
            variable_instance_set(panel_inst, "row", i);
            variable_instance_set(panel_inst, "col", j);
            
        }
    }
}

// Crear las instancias para la fila 1 primero
for (var j = 0; j < columns; j++) {
    var panel = global.panels[1][j];
    var panel_x = global.grid_offset_x + (j * global.panel_width);
    var panel_y = global.grid_offset_y + (1 * global.panel_height); // Ajusta la posición de la segunda fila
    
    var panel_inst = instance_create_layer(panel_x, panel_y, "Instances", obj_panel);
    
    // Usar variable_instance_set para asignar la fila y columna
    variable_instance_set(panel_inst, "row", 1);
    variable_instance_set(panel_inst, "col", j);
}

// Luego, crear las instancias para la fila 0
for (var j = 0; j < columns; j++) {
    var panel = global.panels[0][j];
    var panel_x = global.grid_offset_x + (j * global.panel_width);
    var panel_y = global.grid_offset_y + (0 * global.panel_height); // Ajusta la posición de la primera fila
    
    var panel_inst = instance_create_layer(panel_x, panel_y, "Instances", obj_panel);
    
    // Usar variable_instance_set para asignar la fila y columna
    variable_instance_set(panel_inst, "row", 0);
    variable_instance_set(panel_inst, "col", j);
}
// Inicializar la extensión del área del jugador
global.player_area_extension = 3;

global.temporary_panels = [];
global.panel_return_time = 5 * room_speed; // Ajusta este valor según sea necesario
global.panel_timer = global.panel_return_time;

// Inicializar los paneles con la estructura deseada
global.panels = [
    [{tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}],
    [{tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}],
    [{tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}]
];