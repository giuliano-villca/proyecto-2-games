// Función para ejecutar habilidades solo si el entity_type es "obj_player"
function ejecutar_habilidad(habilidad, tipo_entidad) {
    if (tipo_entidad == "obj_player") {
        switch (habilidad) {
            case "area_steal":
                area_steal(entity_type);
                break;
            case "panel_grab":
                panel_grab(entity_type);
                break;
            case "heladera":
                heladera();
                break;
			case "jardin":
				jardin();
			 break;
			case "bola_de_fuego":
			bola_de_fuego(entity_type);
            default:
                break;
				// todo esto sirve para agregar mas habilidades al jugador
        }
    }
}
