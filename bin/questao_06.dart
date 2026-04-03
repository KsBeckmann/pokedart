part of 'pokedart.dart';

// QUESTAO 6
class PokemonFogo extends Pokemon {
  PokemonFogo({
    required int numero,
    required String nome,
    required int nivel,
    required int hp_atual,
    required int hp_maximo,
    required bool capturado,
    String? proxima_evolucao,
    int nivel_evolucao = 0,
    int energia = 100,
  }) : super(
         numero: numero,
         nome: nome,
         tipo: 'Fogo',
         nivel: nivel,
         hp_atual: hp_atual,
         hp_maximo: hp_maximo,
         capturado: capturado,
         proxima_evolucao: proxima_evolucao,
         nivel_evolucao: nivel_evolucao,
         energia: energia,
       );

  @override
  int calcular_ataque_base() {
    return _nivel * 3;
  }

  @override
  void exibir_ficha() {
    print('====== Pokemon: $_nome #$_numero ======');
    print('Capturado: ${_capturado ? "Sim" : "Nao"}');
    print('Tipo: $_tipo');
    print('Nivel: $_nivel');
    print('Hp: $_hp_atual/$_hp_maximo');
    print('Tipo: Fogo');
    print(' ');
  }
}

class PokemonAgua extends Pokemon {
  PokemonAgua({
    required int numero,
    required String nome,
    required int nivel,
    required int hp_atual,
    required int hp_maximo,
    required bool capturado,
    String? proxima_evolucao,
    int nivel_evolucao = 0,
    int energia = 100,
  }) : super(
         numero: numero,
         nome: nome,
         tipo: 'Agua',
         nivel: nivel,
         hp_atual: hp_atual,
         hp_maximo: hp_maximo,
         capturado: capturado,
         proxima_evolucao: proxima_evolucao,
         nivel_evolucao: nivel_evolucao,
         energia: energia,
       );

  @override
  int calcular_ataque_base() {
    return _nivel * 2 + 10;
  }

  @override
  void exibir_ficha() {
    print('====== Pokemon: $_nome #$_numero ======');
    print('Capturado: ${_capturado ? "Sim" : "Nao"}');
    print('Tipo: $_tipo');
    print('Nivel: $_nivel');
    print('Hp: $_hp_atual/$_hp_maximo');
    print('Tipo: Agua');
    print(' ');
  }
}

class PokemonEletrico extends Pokemon {
  PokemonEletrico({
    required int numero,
    required String nome,
    required int nivel,
    required int hp_atual,
    required int hp_maximo,
    required bool capturado,
    String? proxima_evolucao,
    int nivel_evolucao = 0,
    int energia = 100,
  }) : super(
         numero: numero,
         nome: nome,
         tipo: 'Eletrico',
         nivel: nivel,
         hp_atual: hp_atual,
         hp_maximo: hp_maximo,
         capturado: capturado,
         proxima_evolucao: proxima_evolucao,
         nivel_evolucao: nivel_evolucao,
         energia: energia,
       );

  @override
  int calcular_ataque_base() {
    return _nivel * 2 + 15;
  }

  @override
  void exibir_ficha() {
    print('====== Pokemon: $_nome #$_numero ======');
    print('Capturado: ${_capturado ? "Sim" : "Nao"}');
    print('Tipo: $_tipo');
    print('Nivel: $_nivel');
    print('Hp: $_hp_atual/$_hp_maximo');
    print('Tipo: Eletrico');
    print(' ');
  }
}
