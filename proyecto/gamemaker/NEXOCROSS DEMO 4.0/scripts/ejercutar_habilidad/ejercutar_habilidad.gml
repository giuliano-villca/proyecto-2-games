function ejecutar_habilidad(habilidad, tipo_entidad) {
    if (tipo_entidad == "obj_player") {
        if (global.habilidad_estado[? habilidad] == 0) { // Verificar si la habilidad no está en cooldown
            switch (habilidad) {
                case "area_steal":
                    area_steal(entity_type);
                    global.habilidad_estado[? habilidad] = 10 * room_speed; // 6 segundos de cooldown
                    break;
                case "panel_grab":
                    panel_grab(entity_type);
                    global.habilidad_estado[? habilidad] = 5 * room_speed; // 2 segundos de cooldown
                    break;
                case "heladera":
                    heladera();
                    global.habilidad_estado[? habilidad] = 10 * room_speed; // 10 segundos de cooldown
                    break;
                case "jardin":
                    jardin();
                    global.habilidad_estado[? habilidad] = 12 * room_speed; // 12 segundos de cooldown
                    break;
                case "bola de fuego":
                    bola_de_fuego(entity_type);
                    global.habilidad_estado[? habilidad] = 1 * room_speed; // 1 segundos de cooldown
                    break;
                case "sanacion":
                    sanacion();
                    global.habilidad_estado[? habilidad] = 15 * room_speed; // 15 segundos de cooldown
                    break;
                case "zona volcanica":
                    zona_volcanica();
                    global.habilidad_estado[? habilidad] = 20 * room_speed; // 20 segundos de cooldown
                    break;
                case "temblores":
                    temblores();
                    global.habilidad_estado[? habilidad] = 18 * room_speed; // 18 segundos de cooldown
                    break;
                case "terremoto":
                    terremoto();
                    global.habilidad_estado[? habilidad] = 30 * room_speed; // 25 segundos de cooldown
                    break;
                case "espada":
                    espada(entity_type);
                    global.habilidad_estado[? habilidad] = 1 * room_speed; // 18 segundos de cooldown
                    break;
                case "espada lunar":
                    espada_lunar(entity_type);
                    global.habilidad_estado[? habilidad] = 4 * room_speed; // 18 segundos de cooldown
                    break;
                case "bomba":
                    bomba(entity_type);
                    global.habilidad_estado[? habilidad] = 0 * room_speed; // 18 segundos de cooldown
                    break;
		        case "invisible":
                    invisible();
                    global.habilidad_estado[? habilidad] = 40 * room_speed; // 18 segundos de cooldown
                    break;
		        case "escudo":
                    escudo(entity_type);
                    global.habilidad_estado[? habilidad] = 3 * room_speed; // 18 segundos de cooldown
                    break;
		        case "reparacion":
                    reparacion(entity_type);
                    global.habilidad_estado[? habilidad] = 10 * room_speed; // 18 segundos de cooldown
                    break;
			    case "torreta ballesta":
                    torreta_ballesta(entity_type);
                    global.habilidad_estado[? habilidad] = 5 * room_speed; // 18 segundos de cooldown
                    break;
			    case "muro":
                    muro(entity_type);
                    global.habilidad_estado[? habilidad] = 15 * room_speed; // 18 segundos de cooldown
                    break;
                default:
                    break;
            }
        }
    }
}