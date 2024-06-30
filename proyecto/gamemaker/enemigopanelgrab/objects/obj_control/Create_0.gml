//obj_control evento create
global.panel_width = 64;  // Ancho de cada panel
global.panel_height = 64; // Alto de cada panel

var rows = 3;
var columns = 6;

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
    }
}
// Inicializar la extensión del área del jugador
global.player_area_extension = 3;

// Calcular el desplazamiento para centrar la cuadrícula en el room
global.grid_offset_x = (room_width - (columns * global.panel_width)) / 2;
global.grid_offset_y = (room_height - (rows * global.panel_height)) / 2;

global.temporary_panels = [];
global.panel_return_time = 5 * room_speed; // Ajusta este valor según sea necesario
global.panel_timer = global.panel_return_time;

// Definir habilidades y colores
global.habilidades = [
    {name: "PanelGrab", color: c_blue}
    // Agrega más habilidades aquí
];
// Inicializar los paneles con la estructura deseada
global.panels = [
    [{tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}],
    [{tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}],
    [{tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 1}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}, {tipo: 1, propietario: 2}]
];
