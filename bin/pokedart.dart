import 'dart:io';

class Pokemon {
  int _numero;
  String _nome;
  String _tipo;
  int _nivel;
  int _hp_atual;
  int _hp_maximo;
  bool _capturado;

  //Atributos para próxima evolução
  String? proxima_evolucao;
  int nivel_evolucao;

  Pokemon({
    required int numero,
    required String nome,
    required String tipo,
    required int nivel,
    required int hp_atual,
    required int hp_maximo,
    required bool capturado,
    this.proxima_evolucao,  // coloquei aki
    this.nivel_evolucao = 0, //coloquei aki tambem
  })  : _numero = numero,
        _nome = nome,
        _tipo = tipo,
        _nivel = nivel,
        _hp_atual = hp_atual,
        _hp_maximo = hp_maximo,
        _capturado = capturado {
    if (_nivel < 1 || _nivel > 100) {
      throw ArgumentError("Nivel deve estar entre 1 e 100!");
    }

    if (_hp_maximo <= 0) {
      throw ArgumentError("Hp máximo não pode ser menor que 0!");
    }

    if (_hp_atual > _hp_maximo) {
      throw ArgumentError("Hp atual não pode ser maior que o hp máximo");
    }
  }

  //QUESTÃO 1

  // Getters
  int get numero => _numero;
  String get nome => _nome;
  String get tipo => _tipo;
  int get nivel => _nivel;
  int get hp_atual => _hp_atual;
  int get hp_maximo => _hp_maximo;
  bool get capturado => _capturado;

  // Setters
  set numero(int valor) => _numero = valor;
  set nome(String valor) => _nome = valor;
  set tipo(String valor) => _tipo = valor;

  set nivel(int valor) {
    if (valor < 1 || valor > 100) {
      throw ArgumentError("Nivel deve estar entre 1 e 100!");
    }
    _nivel = valor;
  }

  set hp_maximo(int valor) {
    if (valor <= 0) {
      throw ArgumentError("Hp máximo não pode ser menor que 0!");
    }
    _hp_maximo = valor;
  }

  set hp_atual(int valor) {
    if (valor > _hp_maximo) {
      throw ArgumentError("Hp atual não pode ser maior que o hp máximo");
    }
    _hp_atual = valor;
  }

  set capturado(bool valor) => _capturado = valor;
  
  // Métodos
  void exibir_ficha() {
    print('====== Pokemon: $_nome #$_numero ======');
    print('Capturado: ${_capturado ? "Sim" : "Não"}');
    print('Tipo: $_tipo');
    print('Nível: $_nivel');
    print('Hp: $_hp_atual/$_hp_maximo');
    print(' ');
  }

  bool subir_nivel(int quantidade) {
    if (quantidade < 0) {
      print("Quantidade não pode ser negativa");
      return false;
    }

    try {
      nivel = _nivel + quantidade;
    } catch (e) {
      print("Falha ao subir nivel: $e");
      return false;
    }
    return true;
  }

  bool receber_dano(int dano) {
    if (dano < 0) {
      print("Dano não pode ser negativo");
      return false;
    }

    if (dano >= _hp_atual) {
      _hp_atual = 0;
    } else {
      _hp_atual = _hp_atual - dano;
    }
    return true;
  }

  bool curar(int valor) {
    if (valor < 0) {
      print("Cura não pode ser negativa");
      return false;
    }

    if (_hp_atual + valor >= _hp_maximo) {
      _hp_atual = _hp_maximo;
    } else {
      _hp_atual = _hp_atual + valor;
    }

    return true;
  }
  
  void evoluir(){

    if(proxima_evolucao == null){
      print('$nome não possui mais evoluções programadas.');
      print('');
      return;
    }

    if(_nivel < nivel_evolucao){
      print('$nome não consegue evoluir');
      print('Nível atual: $_nivel');
      print('Nível necessário: $nivel_evolucao');
      print('');
      return;
    }

    String nomeAntigo = _nome;

    _nome = proxima_evolucao!;

    proxima_evolucao = null;

    _hp_maximo += 20;
    _hp_atual = hp_maximo;

    print('==== EVOLUÇÃO ! ====');
    print('$nomeAntigo evoluiu para $nome');
    print('Novo HP máximo: [$hp_maximo]');
    print("====================");
    print('');

  }

}

// QUESTÃO 4
class Pokedex{
  final List<Pokemon> _listaPokemons = []; // Actually o plural de pokemon eh pokemon (emote nerd)


  void adicionarPokemon(Pokemon p){
    bool jaExiste = _listaPokemons.any((poke) => poke.numero == p.numero);

    if(jaExiste){
      print('O Pokemon ${p.nome} | #${p.numero} já tem na Pokedex');
    }else{
      _listaPokemons.add(p);
      print('Pokemon ${p.nome} adicionado na Pokedex!!!');
    }
  }

  Pokemon? buscarPorNumero(int numero){
    try{
      return _listaPokemons.firstWhere((poke) => poke.numero == numero);
    }catch (e){
      return null;
    }
  }

  bool removerPokemonPorNumero(int numero){
    int totalAntes = _listaPokemons.length;
    _listaPokemons.removeWhere((poke) => poke.numero == numero);

    bool removeu = _listaPokemons.length < totalAntes;
    if(removeu){
      print('Pokemon #$numero removido!!');
    }else{
      print('Pokemon #$numero não encontrado na Pokedex!!!');
    }
    return removeu;
  }

  void listarTodos(){
    print('\n================= LISTA DE POKEMONS =================');
    if(_listaPokemons.isEmpty){
      print('A Pokedex está vazia!!!');
    }else{
      for(var p in _listaPokemons){
        p.exibir_ficha();
      }
    }
    print('=======================================================');
  }

// QUESTÃO 5
  List<Pokemon> listar_capturados() {
    // where() percorre a lista e retorna apenas os elementos que satisfazem a condição
    return _listaPokemons.where((p) => p.capturado).toList();
  }

  List<Pokemon> listar_por_tipo(String tipo) {
    var tipo_formatado = tipo.trim().toLowerCase();
    return _listaPokemons.where((p) => p.tipo.trim().toLowerCase() == tipo_formatado).toList();
  }

  List<Pokemon> listar_acima_do_nivel(int nivel_minimo) {
    return _listaPokemons.where((p) => p.nivel > nivel_minimo).toList();
  }

  List<Pokemon> listar_que_podem_evoluir() {
    return _listaPokemons.where((p) => p.proxima_evolucao != null && p.nivel >= p.nivel_evolucao).toList();
  }
}

void main(List<String> arguments) {
  if (Platform.isWindows) { // Limpa tela sixseven aura farmer!
    Process.runSync('cls', [], runInShell: true);
  } else {
    var result = Process.runSync('clear', []);
    stdout.write(result.stdout);
  }

  var psyduck = Pokemon(
    numero: 54,
    nome: 'Psyduck',
    tipo: 'Água',
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

  if (!psyduck.subir_nivel(2)) return;
  if (!mimikyu.subir_nivel(5)) return;
  // if (!psyduck.subir_nivel(101)) return; // <--- erro!
  // if (!psyduck.subir_nivel(-1)) return; // <--- erro!

  if (!psyduck.receber_dano(50)) return;
  if (!mimikyu.receber_dano(2)) return;
  if (!machop.receber_dano(5)) return;
  // if (!machop.receber_dano(-1)) return; // <--- erro!

  if (!psyduck.curar(20)) return;
  if (!mimikyu.curar(3)) return;
  if (!machop.curar(50)) return;
  // if (!machop.curar(-1)) return; // <--- erro!
  print("===========================");
  print("===========================");
  print("===========================");
  print("");

  psyduck.exibir_ficha();
  mimikyu.exibir_ficha();
  machop.exibir_ficha();



  // TESTE DE EVOLUÇÃO [Da questão 3]

  machop.exibir_ficha();
  machop.proxima_evolucao = "Machoke";
  machop.nivel_evolucao = 7;

  machop.evoluir();

  machop.subir_nivel(6);
  machop.evoluir();

  machop.exibir_ficha();


  // TESTE DA QUESTÃO 4
  var minhaPokedex = Pokedex();

  var p1 = Pokemon(numero: 1, nome: "Bulbasaur", tipo: "Planta", nivel: 5, hp_atual: 20, hp_maximo: 20, capturado: true);
  var p2 = Pokemon(numero: 4, nome: "Charmander", tipo: "Fogo", nivel: 5, hp_atual: 18, hp_maximo: 18, capturado: true);
  var p3 = Pokemon(numero: 7, nome: "Squirtle", tipo: "Água", nivel: 5, hp_atual: 22, hp_maximo: 22, capturado: true);
  var p4 = Pokemon(numero: 25, nome: "Pikachu", tipo: "Elétrico", nivel: 10, hp_atual: 30, hp_maximo: 30, capturado: true);
  var p5 = Pokemon(numero: 150, nome: "Mewtwo", tipo: "Psíquico", nivel: 70, hp_atual: 200, hp_maximo: 200, capturado: false);

  minhaPokedex.adicionarPokemon(p1);
  minhaPokedex.adicionarPokemon(p2);
  minhaPokedex.adicionarPokemon(p3);
  minhaPokedex.adicionarPokemon(p4);
  minhaPokedex.adicionarPokemon(p5);

  minhaPokedex.listarTodos();


  // TESTE DA QUESTÃO 5
  print('\n================= LISTA DE POKEMON *CAPTURADOS* =================');
  for(var p in minhaPokedex.listar_capturados()) {
    p.exibir_ficha();
  }
  print('====================================================================');

  print('\n================= LISTA DE POKEMON *POR TIPO* =================');
  print('\nTipo: planta\n');
  for(var p in minhaPokedex.listar_por_tipo(" Planta ")) {
    p.exibir_ficha();
  }
  print('\nTipo: psíquico\n');
  for(var p in minhaPokedex.listar_por_tipo(" Psíquico ")) {
    p.exibir_ficha();
  }
  print('================================================================');

  print('\n================= LISTA DE POKEMON *POR NÍVEL* =================');
  print('\nNível minimo: 9\n');
  for(var p in minhaPokedex.listar_acima_do_nivel(9)) {
    p.exibir_ficha();
  }
  print('===================================================================');

  p1.proxima_evolucao = "Ivysaur"; // já pode evoluir
  p1.nivel_evolucao = 16;
  p1.subir_nivel(20);

  p2.proxima_evolucao = "Charmeleon"; // ainda nao pode evoluir
  p2.nivel_evolucao = 16;

  print('\n================= LISTA DE POKEMON *QUE PODEM EVOLUIR* =================');
  for(var p in minhaPokedex.listar_que_podem_evoluir()) {
    p.exibir_ficha();
    print('Nivel Atual: ${p.nivel}');
    print('Evolui no nivel: ${p.nivel_evolucao}');
  }
  print('===========================================================================');
}
