// Evento Create
if (room == Room_combate) {
// aca usaremos la capa llamado "solo_fondos" para solamente fondos (pds: background es cagada, perdon por la palabra que dije)
if (!layer_exists("solo_fondos")) {
    var fondo_layer_index = layer_create(0); // crear la capa en el índice 0 (inferior)
    layer_set_name(fondo_layer_index, "solo_fondos"); // asignar el nombre "solo_fondos" a la capa
}
switch (global.fondo_seleccionado) {
    case "estadio":
        background_index = estadio; // ponemos el nombre del fondo osea el sprite
        break;
    case "ciudad":
        background_index = ciudad;
        break;
    case "prision":
        background_index = prision;
        break;
	case "bosque":
        background_index = bosque;
        break;
    default:
        background_index = estadio; // Fondo por defecto
        break;
}
}