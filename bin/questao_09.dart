part of 'pokedart.dart';

// Questão 9 — interface com os métodos de registro da pokédex
abstract class RegistravelNaPokedex {
  void marcar_como_visto();
  void marcar_como_capturado();
  void favoritar();
  void desfavoritar();
}