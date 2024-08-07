// obj_panel Evento Draw
// Verificar si row y col han sido correctamente asignados
if (!variable_instance_exists(self, "row") || !variable_instance_exists(self, "col")) {
    return;
}

var row = self.row; // Obtener la fila asignada
var col = self.col; // Obtener la columna asignada

var panel_tipo = global.panels[row][col].tipo;
var panel_propietario = global.panels[row][col].propietario;
var panel_sprite;

// Determinar el sprite basado en el tipo y propietario del panel
switch (panel_tipo) {
    case 0: // Panel neutro
        panel_sprite = Sprite3;
        break;
    case 1: // Panel normal
        if (panel_propietario == 1) {
            panel_sprite = panel_rojo; // Cambia a sprite correspondiente al propietario 1
        } else if (panel_propietario == 2) {
            panel_sprite = panel_azul; // Cambia a sprite correspondiente al propietario 2
        }
        break;
    case 2: // Panel de hielo
        if (panel_propietario == 1) {
            panel_sprite = panel_hielo_rojo; // Cambia a sprite correspondiente al propietario 1
        } else if (panel_propietario == 2) {
            panel_sprite = panel_hielo_azul; // Cambia a sprite correspondiente al propietario 2
        }
        break;
    case 3: // Panel de pasto
        if (panel_propietario == 1) {
            panel_sprite = panel_pasto_rojo; // Cambia a sprite correspondiente al propietario 1
        } else if (panel_propietario == 2) {
            panel_sprite = panel_pasto_azul; // Cambia a sprite correspondiente al propietario 2
        }
        break;
    case 4: // Panel de lava
        if (panel_propietario == 1) {
            panel_sprite = panel_lava_rojo; // Cambia a sprite correspondiente al propietario 1
        } else if (panel_propietario == 2) {
            panel_sprite = panel_lava_azul; // Cambia a sprite correspondiente al propietario 2
        }
        break;
	case 5: // Panel agrietado
        if (panel_propietario == 1) {
            panel_sprite = panel_agrietado_rojo; // Cambia a sprite correspondiente al propietario 1
        } else if (panel_propietario == 2) {
            panel_sprite = panel_agrietado_azul; // Cambia a sprite correspondiente al propietario 2
        }
        break;
	case 6: // Panel roto
        if (panel_propietario == 1) {
            panel_sprite = panel_roto_rojo; // Cambia a sprite correspondiente al propietario 1
        } else if (panel_propietario == 2) {
            panel_sprite = panel_roto_azul; // Cambia a sprite correspondiente al propietario 2
        }
        break;
    default:
        panel_sprite = Sprite3;
        break;
}

// Dibujar el sprite del panel y posicionar los paneles
draw_sprite(panel_sprite, 0, x, y);

