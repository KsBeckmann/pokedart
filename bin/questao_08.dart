part of 'pokedart.dart';

// Questão 8 — função de batalha usando polimorfismo
// chama habilidade.usar() sem precisar saber qual habilidade é — o Dart resolve sozinho
void executar_turno(Pokemon atacante, Pokemon defensor, Habilidade habilidade) {
  print('${atacante.nome} usa ${habilidade.nome} em ${defensor.nome}');
  habilidade.usar(atacante, defensor);
  print('HP do ${defensor.nome}: ${defensor.hp_atual}/${defensor.hp_maximo}');

  if (defensor.hp_atual == 0) {
    print('${defensor.nome} foi derrotado!');
  }
}