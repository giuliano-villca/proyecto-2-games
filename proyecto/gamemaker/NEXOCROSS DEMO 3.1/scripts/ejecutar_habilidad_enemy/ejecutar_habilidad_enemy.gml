// Función para ejecutar habilidades solo si el entity_type es "obj_player"
function ejecutar_habilidad_enemy(habilidad, tipo_entidad) {
    if (tipo_entidad == "obj_enemy") {
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
				break;
			case "sanacion":
				sanacion();
				break;
			case "zona volcanica":
				zona_volcanica();
				break;
			case "temblores":
				temblores();
				break;
			case "terremoto":
				terremoto();
			     break;
                case "espada":
                    espada(entity_type);

                    break;
                case "espada lunar":
                    espada_lunar(entity_type);

                    break;
            default:
                break;
				// todo esto sirve para agregar mas habilidades al jugador
        }
    }
}
