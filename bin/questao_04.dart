part of 'pokedart.dart';

// Questão 4 — classe Pokédex com coleção interna e métodos de gerenciamento
// Questão 5 — métodos de filtro
// Questão 11 — métodos de estatísticas

class Pokedex {
  final List<Pokemon> _listaPokemons = [];

  List<Pokemon> get pokemons => _listaPokemons;

  // Questão 4 — adiciona pokémon sem permitir número duplicado
  void adicionarPokemon(Pokemon p) {
    var jaExiste = _listaPokemons.any((poke) => poke.numero == p.numero);

    if (jaExiste) {
      print('O Pokemon ${p.nome} | #${p.numero} ja tem na Pokedex');
    } else {
      _listaPokemons.add(p);
      print('Pokemon ${p.nome} adicionado na Pokedex!!!');
    }
  }

  // Questão 4 — busca por número, retorna o pokémon ou null
  Pokemon? buscarPorNumero(int numero) {
    try {
      return _listaPokemons.firstWhere((poke) => poke.numero == numero);
    } catch (e) {
      return null;
    }
  }

  // Questão 4 — remove por número e indica se removeu ou não
  bool removerPokemonPorNumero(int numero) {
    var totalAntes = _listaPokemons.length;
    _listaPokemons.removeWhere((poke) => poke.numero == numero);

    var removeu = _listaPokemons.length < totalAntes;
    if (removeu) {
      print('Pokemon #$numero removido!!');
    } else {
      print('Pokemon #$numero nao encontrado na Pokedex!!!');
    }
    return removeu;
  }

  // Questão 4 — lista todos os pokémons cadastrados
  void listarTodos() {
    print('\n================= LISTA DE POKEMONS =================');
    if (_listaPokemons.isEmpty) {
      print('A Pokedex esta vazia!!!');
    } else {
      for (var p in _listaPokemons) {
        p.exibir_ficha();
      }
    }
    print('=======================================================');
  }

  // Questão 5 — retorna só os pokémons capturados
  List<Pokemon> listar_capturados() {
    return _listaPokemons.where((p) => p.capturado).toList();
  }

  // Questão 5 — retorna pokémons do tipo informado (ignora maiúsculas/minúsculas)
  List<Pokemon> listar_por_tipo(String tipo) {
    var tipo_formatado = tipo.trim().toLowerCase();
    return _listaPokemons
        .where((p) => p.tipo.trim().toLowerCase() == tipo_formatado)
        .toList();
  }

  // Questão 5 — retorna pokémons com nível acima do mínimo informado
  List<Pokemon> listar_acima_do_nivel(int nivel_minimo) {
    return _listaPokemons.where((p) => p.nivel > nivel_minimo).toList();
  }

  // Questão 5 — retorna pokémons que têm próxima evolução e já atingiram o nível necessário
  List<Pokemon> listar_que_podem_evoluir() {
    return _listaPokemons
        .where((p) => p.proxima_evolucao != null && p.nivel >= p.nivel_evolucao)
        .toList();
  }

  // Questão 11 — total de pokémons na pokédex
  int total_pokemons() {
    return _listaPokemons.length;
  }

  // Questão 11 — quantidade de pokémons agrupados por tipo
  Map<String, int> quantidade_por_tipo() {
    var mapa = <String, int>{};
    for (var p in _listaPokemons) {
      var tipo = p.tipo.toLowerCase();
      mapa[tipo] = (mapa[tipo] ?? 0) + 1;
    }
    return mapa;
  }

  // Questão 11 — média de nível de todos os pokémons
  double media_de_nivel() {
    if (_listaPokemons.isEmpty) {
      return 0;
    }

    var soma = 0;
    for (var p in _listaPokemons) {
      soma += p.nivel;
    }
    return soma / total_pokemons();
  }

  // Questão 11 — percentual de pokémons capturados (0 a 100)
  double percentual_capturados() {
    if (_listaPokemons.isEmpty) {
      return 0;
    }

    var quantidade_capturados = 0;
    for (var p in _listaPokemons) {
      if (p.capturado) {
        quantidade_capturados += 1;
      }
    }
    return (quantidade_capturados / total_pokemons()) * 100;
  }
}