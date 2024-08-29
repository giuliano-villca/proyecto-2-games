// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function sanacion(){
    vida += 20;
    if (vida > vidamaxima) {
        vida = vidamaxima; // Esto asegura que la vida no supere la vida máxima
    }
}
