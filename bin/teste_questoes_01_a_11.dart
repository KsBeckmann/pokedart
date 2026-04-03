part of 'pokedart.dart';

void teste_ate_a_questao_11() {
  _limpar_tela();
  rodar_questao_1();
  rodar_questao_3();
  rodar_questao_4();
  rodar_questao_5();
  rodar_questao_6();
  rodar_questao_7();
  rodar_questao_8();
  rodar_questao_9();
  rodar_questao_10();
  rodar_questao_11();
}

void rodar_questao_1() {
  print('\n================= QUESTAO 1 =================');

  var psyduck = Pokemon(
    numero: 54,
    nome: 'Psyduck',
    tipo: 'Agua',
    nivel: 67,
    hp_atual: 103,
    hp_maximo: 103,
    capturado: true,
  );

  var mimikyu = Pokemon(
    numero: 778,
    nome: 'Mimikyu',
    tipo: 'Fantasma',
    nivel: 2,
    hp_atual: 6,
    hp_maximo: 9,
    capturado: false,
  );

  var machop = Pokemon(
    numero: 66,
    nome: 'Machop',
    tipo: 'Lutador',
    nivel: 6,
    hp_atual: 7,
    hp_maximo: 10,
    capturado: true,
  );

  psyduck.exibir_ficha();
  mimikyu.exibir_ficha();
  machop.exibir_ficha();

  psyduck.subir_nivel(2);
  mimikyu.subir_nivel(5);

  psyduck.receber_dano(50);
  mimikyu.receber_dano(2);
  machop.receber_dano(5);

  psyduck.curar(20);
  mimikyu.curar(3);
  machop.curar(50);

  print('---------------------------------------------');

  psyduck.exibir_ficha();
  mimikyu.exibir_ficha();
  machop.exibir_ficha();
}

void rodar_questao_3() {
  print('\n================= QUESTAO 3 =================');

  var machop = Pokemon(
    numero: 66,
    nome: 'Machop',
    tipo: 'Lutador',
    nivel: 6,
    hp_atual: 7,
    hp_maximo: 10,
    capturado: true,
  );

  machop.exibir_ficha();
  machop.proxima_evolucao = 'Machoke';
  machop.nivel_evolucao = 7;

  machop.evoluir();
  machop.subir_nivel(6);
  machop.evoluir();
  machop.exibir_ficha();
}

void rodar_questao_4() {
  print('\n================= QUESTAO 4 =================');
  var minhaPokedex = _criar_pokedex_base();
  minhaPokedex.listarTodos();
}

void rodar_questao_5() {
  print('\n================= QUESTAO 5 =================');
  var minhaPokedex = _criar_pokedex_base();

  print('\n================= LISTA DE POKEMON *CAPTURADOS* =================');
  for (var p in minhaPokedex.listar_capturados()) {
    p.exibir_ficha();
  }
  print('====================================================================');

  print('\n================= LISTA DE POKEMON *POR TIPO* =================');
  print('\nTipo: planta\n');
  for (var p in minhaPokedex.listar_por_tipo(' Planta ')) {
    p.exibir_ficha();
  }
  print('\nTipo: psiquico\n');
  for (var p in minhaPokedex.listar_por_tipo(' Psiquico ')) {
    p.exibir_ficha();
  }
  print('================================================================');

  print('\n================= LISTA DE POKEMON *POR NIVEL* =================');
  print('\nNivel minimo: 9\n');
  for (var p in minhaPokedex.listar_acima_do_nivel(9)) {
    p.exibir_ficha();
  }
  print('===================================================================');

  var bulbasaur = minhaPokedex.buscarPorNumero(1)!;
  var charmander = minhaPokedex.buscarPorNumero(4)!;

  bulbasaur.proxima_evolucao = 'Ivysaur';
  bulbasaur.nivel_evolucao = 16;
  bulbasaur.subir_nivel(20);

  charmander.proxima_evolucao = 'Charmeleon';
  charmander.nivel_evolucao = 16;

  print(
    '\n================= LISTA DE POKEMON *QUE PODEM EVOLUIR* =================',
  );
  for (var p in minhaPokedex.listar_que_podem_evoluir()) {
    p.exibir_ficha();
    print('Nivel Atual: ${p.nivel}');
    print('Evolui no nivel: ${p.nivel_evolucao}');
  }
  print(
    '===========================================================================',
  );
}

void rodar_questao_6() {
  print('\n================= QUESTAO 6 =================');

  var p6 = PokemonFogo(
    numero: 324,
    nome: 'Torkoal',
    nivel: 1,
    hp_atual: 8,
    hp_maximo: 8,
    capturado: true,
  );
  var p7 = PokemonAgua(
    numero: 693,
    nome: 'Clawitzer',
    nivel: 2,
    hp_atual: 10,
    hp_maximo: 10,
    capturado: true,
  );
  var p8 = PokemonEletrico(
    numero: 695,
    nome: 'Heliolisk',
    nivel: 3,
    hp_atual: 14,
    hp_maximo: 14,
    capturado: true,
  );

  p6.exibir_ficha();
  p7.exibir_ficha();
  p8.exibir_ficha();
}

void rodar_questao_7() {
  print('\n================= QUESTAO 7 =================');
  print('\n================= TESTE DE HABILIDADES =================');

  var pikachu = PokemonEletrico(
    numero: 25,
    nome: 'Pikachu',
    nivel: 10,
    hp_atual: 30,
    hp_maximo: 30,
    capturado: true,
    energia: 50,
  );
  var squirtle = PokemonAgua(
    numero: 7,
    nome: 'Squirtle',
    nivel: 5,
    hp_atual: 50,
    hp_maximo: 50,
    capturado: true,
    energia: 50,
  );
  var charmander = PokemonFogo(
    numero: 4,
    nome: 'Charmander',
    nivel: 8,
    hp_atual: 40,
    hp_maximo: 40,
    capturado: true,
    energia: 50,
  );

  var choque = ChoqueDoTrovao();
  var jato = JatoDAgua();
  var lancaChamas = LancaChamas();

  print('\n${pikachu.nome} usa ${choque.nome} em ${squirtle.nome}!');
  choque.usar(pikachu, squirtle);
  print('HP do ${squirtle.nome}: ${squirtle.hp_atual}/${squirtle.hp_maximo}');
  print('Energia do ${pikachu.nome}: ${pikachu.energia}');

  print('\n${squirtle.nome} usa ${jato.nome} em ${charmander.nome}!');
  jato.usar(squirtle, charmander);
  print(
    'HP do ${charmander.nome}: ${charmander.hp_atual}/${charmander.hp_maximo}',
  );
  print('Energia do ${squirtle.nome}: ${squirtle.energia}');

  print('\n${charmander.nome} usa ${lancaChamas.nome} em ${pikachu.nome}!');
  lancaChamas.usar(charmander, pikachu);
  print('HP do ${pikachu.nome}: ${pikachu.hp_atual}/${pikachu.hp_maximo}');
  print('Energia do ${charmander.nome}: ${charmander.energia}');

  print('\n==========================================================');
}

void rodar_questao_8() {
  print('\n================= QUESTAO 8 =================');

  var pikachu = PokemonEletrico(
    numero: 25,
    nome: 'Pikachu',
    nivel: 10,
    hp_atual: 30,
    hp_maximo: 30,
    capturado: true,
    energia: 50,
  );
  var squirtle = PokemonAgua(
    numero: 7,
    nome: 'Squirtle',
    nivel: 5,
    hp_atual: 50,
    hp_maximo: 50,
    capturado: true,
    energia: 50,
  );
  var charmander = PokemonFogo(
    numero: 4,
    nome: 'Charmander',
    nivel: 8,
    hp_atual: 40,
    hp_maximo: 40,
    capturado: true,
    energia: 50,
  );

  var choque = ChoqueDoTrovao();
  var jato = JatoDAgua();
  var lancaChamas = LancaChamas();

  print('\n================= BATALHA =================');
  executar_turno(pikachu, squirtle, choque);
  print('');
  executar_turno(squirtle, charmander, jato);
  print('');
  executar_turno(charmander, pikachu, lancaChamas);
  print('\n=================================================');
}

void rodar_questao_9() {
  print('\n================= QUESTAO 9 =================');
  print('\n================= TESTE INTERFACE =================');

  var rattata = PokemonFogo(
    numero: 19,
    nome: 'Rattata',
    nivel: 5,
    hp_atual: 15,
    hp_maximo: 15,
    capturado: false,
  );

  print('Tentando favoritar ${rattata.nome} sem capturar...');
  rattata.favoritar();

  rattata.marcar_como_visto();
  print('${rattata.nome} visto: ${rattata.visto}');

  rattata.marcar_como_capturado();
  print('${rattata.nome} capturado: ${rattata.capturado}');
  print('${rattata.nome} visto: ${rattata.visto}');

  rattata.favoritar();
  print('${rattata.nome} favorito: ${rattata.favorito}');

  rattata.desfavoritar();
  print('${rattata.nome} favorito: ${rattata.favorito}');

  print('\n=========================================================');
}

void rodar_questao_10() {
  print('\n================= QUESTAO 10 =================');

  var minhaPokedex = _criar_pokedex_base();
  var rattata = PokemonFogo(
    numero: 19,
    nome: 'Rattata',
    nivel: 5,
    hp_atual: 15,
    hp_maximo: 15,
    capturado: true,
  );

  minhaPokedex.adicionarPokemon(rattata);
  rattata.hp_maximo = 100;
  rattata.hp_atual = 100;
  rattata.favoritar();

  print('\n================= TESTE FUNCAO ANONIMA =================');
  var pokemons = minhaPokedex.pokemons;

  print('\n---- Hp abaixo de 30 ----');
  var hp_baixo = pokemons.where((p) => p.hp_atual < 30).toList();
  for (var p in hp_baixo) {
    print('${p.nome} - HP: ${p.hp_atual}');
  }

  print('\n---- Ordem Alfabetica ----');
  var por_nome = List<Pokemon>.from(pokemons)
    ..sort((a, b) => a.nome.compareTo(b.nome));
  for (var p in por_nome) {
    print(p.nome);
  }

  print('\n---- Nivel decrescente ----');
  var por_nivel = List<Pokemon>.from(pokemons)
    ..sort((a, b) => b.nivel.compareTo(a.nivel));
  for (var p in por_nivel) {
    print('${p.nome} - Nivel: ${p.nivel}');
  }

  print('\n---- Favoritos ----');
  var favoritos = pokemons.where((p) => p.favorito).toList();
  for (var p in favoritos) {
    print(p.nome);
  }

  print('\n=====================================================');
}

void rodar_questao_11() {
  print('\n================= QUESTAO 11 =================');

  var minhaPokedex = _criar_pokedex_base();
  var rattata = PokemonFogo(
    numero: 19,
    nome: 'Rattata',
    nivel: 5,
    hp_atual: 15,
    hp_maximo: 15,
    capturado: true,
  );

  minhaPokedex.adicionarPokemon(rattata);
  rattata.hp_maximo = 100;
  rattata.hp_atual = 100;
  rattata.favoritar();

  print('\n================= TESTE ESTATISTICAS DA POKEDEX =================');
  print('Total pokemons: ${minhaPokedex.total_pokemons()}');
  print('');

  print('Quantidade de pokemon por tipo');
  var porTipo = minhaPokedex.quantidade_por_tipo();
  porTipo.forEach((tipo, quantidade) {
    print('$tipo: $quantidade');
  });

  print('');
  print('Media de nivel: ${minhaPokedex.media_de_nivel().toStringAsFixed(2)}');

  print('');
  print(
    'Porcentagem de pokemons capturados: ${minhaPokedex.percentual_capturados().toStringAsFixed(2)}%',
  );

  print('\n=====================================================');
}

Pokedex _criar_pokedex_base() {
  var minhaPokedex = Pokedex();

  var p1 = Pokemon(
    numero: 1,
    nome: 'Bulbasaur',
    tipo: 'Planta',
    nivel: 5,
    hp_atual: 20,
    hp_maximo: 20,
    capturado: true,
  );
  var p2 = Pokemon(
    numero: 4,
    nome: 'Charmander',
    tipo: 'Fogo',
    nivel: 5,
    hp_atual: 18,
    hp_maximo: 18,
    capturado: true,
  );
  var p3 = Pokemon(
    numero: 7,
    nome: 'Squirtle',
    tipo: 'Agua',
    nivel: 5,
    hp_atual: 22,
    hp_maximo: 22,
    capturado: true,
  );
  var p4 = Pokemon(
    numero: 25,
    nome: 'Pikachu',
    tipo: 'Eletrico',
    nivel: 10,
    hp_atual: 30,
    hp_maximo: 30,
    capturado: true,
  );
  var p5 = Pokemon(
    numero: 150,
    nome: 'Mewtwo',
    tipo: 'Psiquico',
    nivel: 70,
    hp_atual: 200,
    hp_maximo: 200,
    capturado: false,
  );

  minhaPokedex.adicionarPokemon(p1);
  minhaPokedex.adicionarPokemon(p2);
  minhaPokedex.adicionarPokemon(p3);
  minhaPokedex.adicionarPokemon(p4);
  minhaPokedex.adicionarPokemon(p5);

  return minhaPokedex;
}

void _limpar_tela() {
  if (Platform.isWindows) {
    Process.runSync('cls', [], runInShell: true);
  } else {
    var result = Process.runSync('clear', []);
    stdout.write(result.stdout);
  }
}
