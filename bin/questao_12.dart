part of 'pokedart.dart';

void questao_12() {
  // QUESTAO 12 -- DESAFIO FINAL
  var pokedex = Pokedex();

  var bulbasaur = Pokemon(
    numero: 1,
    nome: 'Bulbasaur',
    tipo: 'Planta',
    nivel: 5,
    hp_atual: 20,
    hp_maximo: 20,
    capturado: false,
    proxima_evolucao: 'Ivysaur',
    nivel_evolucao: 16,
  );
  var charmander = PokemonFogo(
    numero: 4,
    nome: 'Charmander',
    nivel: 8,
    hp_atual: 40,
    hp_maximo: 40,
    capturado: false,
    energia: 50,
  );
  var squirtle = PokemonAgua(
    numero: 7,
    nome: 'Squirtle',
    nivel: 5,
    hp_atual: 50,
    hp_maximo: 50,
    capturado: false,
    energia: 50,
  );
  var pikachu = PokemonEletrico(
    numero: 25,
    nome: 'Pikachu',
    nivel: 10,
    hp_atual: 30,
    hp_maximo: 30,
    capturado: false,
    energia: 50,
  );
  var mewtwo = Pokemon(
    numero: 150,
    nome: 'Mewtwo',
    tipo: 'Psiquico',
    nivel: 70,
    hp_atual: 200,
    hp_maximo: 200,
    capturado: false,
  );
  var gengar = Pokemon(
    numero: 94,
    nome: 'Gengar',
    tipo: 'Fantasma',
    nivel: 40,
    hp_atual: 80,
    hp_maximo: 80,
    capturado: false,
  );
  var torkoal = PokemonFogo(
    numero: 324,
    nome: 'Torkoal',
    nivel: 30,
    hp_atual: 60,
    hp_maximo: 60,
    capturado: false,
    energia: 50,
  );
  var clawitzer = PokemonAgua(
    numero: 693,
    nome: 'Clawitzer',
    nivel: 20,
    hp_atual: 55,
    hp_maximo: 55,
    capturado: false,
    energia: 50,
  );

  pokedex.adicionarPokemon(bulbasaur);
  pokedex.adicionarPokemon(charmander);
  pokedex.adicionarPokemon(squirtle);
  pokedex.adicionarPokemon(pikachu);
  pokedex.adicionarPokemon(mewtwo);
  pokedex.adicionarPokemon(gengar);
  pokedex.adicionarPokemon(torkoal);
  pokedex.adicionarPokemon(clawitzer);

  bulbasaur.marcar_como_visto();
  mewtwo.marcar_como_visto();
  gengar.marcar_como_visto();

  charmander.marcar_como_capturado();
  squirtle.marcar_como_capturado();
  pikachu.marcar_como_capturado();
  torkoal.marcar_como_capturado();
  clawitzer.marcar_como_capturado();

  pikachu.favoritar();
  torkoal.favoritar();

  print('\n--- Capturados ---');
  for (var p in pokedex.listar_capturados()) {
    print(p.nome);
  }

  print('\n--- Tipo Fogo ---');
  for (var p in pokedex.listar_por_tipo('Fogo')) {
    print(p.nome);
  }

  print('\n--- Acima do nivel 15 ---');
  for (var p in pokedex.listar_acima_do_nivel(15)) {
    print(p.nome);
  }

  print('\n--- Podem evoluir ---');
  bulbasaur.subir_nivel(15);
  for (var p in pokedex.listar_que_podem_evoluir()) {
    print(p.nome);
  }

  print('');
  bulbasaur.evoluir();

  print('\n--- Batalhas ---');
  var choque = ChoqueDoTrovao();
  var lancaChamas = LancaChamas();

  executar_turno(pikachu, squirtle, choque);
  print('');
  executar_turno(charmander, clawitzer, lancaChamas);

  print('\n--- Estatisticas ---');
  print('Total: ${pokedex.total_pokemons()}');
  pokedex.quantidade_por_tipo().forEach((tipo, qtd) {
    print('$tipo: $qtd');
  });
  print('Media de nivel: ${pokedex.media_de_nivel().toStringAsFixed(2)}');
  print('Capturados: ${pokedex.percentual_capturados().toStringAsFixed(2)}%');

  print('\n=========================================================');
}
