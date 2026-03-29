import 'dart:io';

class Pokemon implements RegistravelNaPokedex { // implements adicionado para a q9
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

  // Atributo energia (q7)
  int energia;

  // Q8
  bool _visto = false;
  bool _favorito = false;

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
    this.energia = 0, // q7
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
  bool get visto => _visto;
  bool get favorito => _favorito;

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

  // Q6
  int calcular_ataque_base() {
    print('nao implementado');
    return 0;
  }

  // Q9
  void marcar_como_visto() {
    _visto = true;
  }

  void marcar_como_capturado() {
    this.marcar_como_visto();
    _capturado = true;
  }

  void favoritar() {
    if(!capturado) {
      print('Você não pode favoritar um pokemon que ainda não foi capturado!');
      return;
    }

    _favorito = true;
  }

  void desfavoritar() {
    _favorito = false;
  }
}

// QUESTÃO 4
class Pokedex{
  final List<Pokemon> _listaPokemons = []; // Actually o plural de pokemon eh pokemon (emote nerd)

  List<Pokemon> get pokemons => _listaPokemons;

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

  // QUESTÃO 11
  int total_pokemons() {
    return _listaPokemons.length;
  }

  Map<String, int> quantidade_por_tipo() {
    Map<String, int> mapa = {};
    for (var p in _listaPokemons) {
      var tipo = p.tipo.toLowerCase();
      mapa[tipo] = (mapa[tipo] ?? 0) + 1;
    }
    return mapa;
  }

  double media_de_nivel() {
    if (_listaPokemons.isEmpty) return 0;
    int soma = 0;
    for (var p in _listaPokemons) {
      soma += p.nivel;
    }
    return soma / total_pokemons();
  }

  double percentual_capturados() {
    if (_listaPokemons.isEmpty) return 0;
    int quantidade_capturados = 0;
    for (var p in _listaPokemons) {
      if (p.capturado) { quantidade_capturados += 1; }
    }
    return (quantidade_capturados / total_pokemons()) * 100;
  }
}

// QUESTÃO 6
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
    int energia = 100, // q7
  }) : super(
    numero: numero,
    nome: nome,
    tipo: "Fogo",
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
    print('Capturado: ${_capturado ? "Sim" : "Não"}');
    print('Tipo: $_tipo');
    print('Nível: $_nivel');
    print('Hp: $_hp_atual/$_hp_maximo');
    print('Tipo: Fogo'); // sobrescrita de exibir ficha com o tipo
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
    int energia = 100, // q7
  }) : super(
    numero: numero,
    nome: nome,
    tipo: "Agua",
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
    print('Capturado: ${_capturado ? "Sim" : "Não"}');
    print('Tipo: $_tipo');
    print('Nível: $_nivel');
    print('Hp: $_hp_atual/$_hp_maximo');
    print('Tipo: Água'); // sobrescrita de exibir ficha com o tipo
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
    int energia = 100, // q7
  }) : super(
    numero: numero,
    nome: nome,
    tipo: "Eletrico",
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
    print('Capturado: ${_capturado ? "Sim" : "Não"}');
    print('Tipo: $_tipo');
    print('Nível: $_nivel');
    print('Hp: $_hp_atual/$_hp_maximo');
    print('Tipo: Elétrico'); // sobrescrita de exibir ficha com o tipo
    print(' ');
  }
}

// QUESTÃO 7
abstract class Habilidade {
  String nome = "";
  int custo_energia = 0;

  Habilidade(this.nome, this.custo_energia);

  void usar(Pokemon usuario, Pokemon alvo);
}

class ChoqueDoTrovao extends Habilidade {
  ChoqueDoTrovao() : super("Choque do trovão", 5);

  void usar(Pokemon usuario, Pokemon alvo) {
    if(usuario.energia < custo_energia) {
      print('Seu pokemon nao tem energia o suficiente');
      return;
    }

    var dano = usuario.calcular_ataque_base() + 5;
    var alvo_hp = alvo.hp_atual - dano;

    print('Vida do alvo -> ${alvo.hp_atual}');
    print('Dano -> $dano');

    usuario.energia -= custo_energia;

    if(alvo_hp < 0) {
      alvo.hp_atual = 0;
    } else {
      alvo.hp_atual = alvo_hp;
    }
  }
}

class JatoDAgua extends Habilidade {
  JatoDAgua() : super("Jato D'Agua", 3);

  void usar(Pokemon usuario, Pokemon alvo) {
    if(usuario.energia < custo_energia) {
      print('Seu pokemon nao tem energia o suficiente');
      return;
    }

    var dano = usuario.calcular_ataque_base() + 3;
    var alvo_hp = alvo.hp_atual - dano;

    print('Vida do alvo -> ${alvo.hp_atual}');
    print('Dano -> $dano');

    usuario.energia -= custo_energia;

    if(alvo_hp < 0) {
      alvo.hp_atual = 0;
    } else {
      alvo.hp_atual = alvo_hp;
    }
  }
}

class LancaChamas extends Habilidade {
  LancaChamas() : super("Lança Chamas", 7);

  void usar(Pokemon usuario, Pokemon alvo) {
    if(usuario.energia < custo_energia) {
      print('Seu pokemon nao tem energia o suficiente');
      return;
    }

    var dano = usuario.calcular_ataque_base() + 7;
    var alvo_hp = alvo.hp_atual - dano;

    print('Vida do alvo -> ${alvo.hp_atual}');
    print('Dano -> $dano');

    usuario.energia -= custo_energia;

    if(alvo_hp < 0) {
      alvo.hp_atual = 0;
    } else {
      alvo.hp_atual = alvo_hp;
    }
  }
}

// QUESTÃO 8
void executar_turno(Pokemon atacante, Pokemon defensor, Habilidade habilidade) {
    print('${atacante.nome} usa ${habilidade.nome} em ${defensor.nome}');
    habilidade.usar(atacante, defensor);
    print('HP do ${defensor.nome}: ${defensor.hp_atual}/${defensor.hp_maximo}');

    if(defensor.hp_atual == 0) {
      print('${defensor.nome} foi derrotado!');
    }
}

// QUESTÃO 9
abstract class RegistravelNaPokedex {
  void marcar_como_visto();
  void marcar_como_capturado();
  void favoritar();
  void desfavoritar();
}

void teste_ate_a_questao_11() {
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

 // TESTE DA QUESTÃO 6
  var p6 = PokemonFogo(numero: 324, nome: "Torkoal", nivel: 1, hp_atual: 8, hp_maximo: 8, capturado: true);
  var p7 = PokemonAgua(numero: 693, nome: "Clawitzer", nivel: 2, hp_atual: 10, hp_maximo: 10, capturado: true);
  var p8 = PokemonEletrico(numero: 695, nome: "Heliolisk", nivel: 3, hp_atual: 14, hp_maximo: 14, capturado: true);

  p6.exibir_ficha();
  p7.exibir_ficha();
  p8.exibir_ficha();

  // TESTE DA QUESTÃO 7
  print('\n================= TESTE DE HABILIDADES =================');

  var pikachu = PokemonEletrico(numero: 25, nome: "Pikachu", nivel: 10, hp_atual: 30, hp_maximo: 30, capturado: true, energia: 50);
  var squirtle = PokemonAgua(numero: 7, nome: "Squirtle", nivel: 5, hp_atual: 50, hp_maximo: 50, capturado: true, energia: 50);
  var charmander = PokemonFogo(numero: 4, nome: "Charmander", nivel: 8, hp_atual: 40, hp_maximo: 40, capturado: true, energia: 50);

  var choque = ChoqueDoTrovao();
  var jato = JatoDAgua();
  var lancaChamas = LancaChamas();

  // Pikachu usa Choque do Trovão no Squirtle
  print('\n${pikachu.nome} usa ${choque.nome} em ${squirtle.nome}!');
  choque.usar(pikachu, squirtle);
  print('HP do ${squirtle.nome}: ${squirtle.hp_atual}/${squirtle.hp_maximo}');
  print('Energia do ${pikachu.nome}: ${pikachu.energia}');

  // Squirtle usa Jato D'Agua no Charmander
  print('\n${squirtle.nome} usa ${jato.nome} em ${charmander.nome}!');
  jato.usar(squirtle, charmander);
  print('HP do ${charmander.nome}: ${charmander.hp_atual}/${charmander.hp_maximo}');
  print('Energia do ${squirtle.nome}: ${squirtle.energia}');

  // Charmander usa Lança Chamas no Pikachu
  print('\n${charmander.nome} usa ${lancaChamas.nome} em ${pikachu.nome}!');
  lancaChamas.usar(charmander, pikachu);
  print('HP do ${pikachu.nome}: ${pikachu.hp_atual}/${pikachu.hp_maximo}');
  print('Energia do ${charmander.nome}: ${charmander.energia}');

  print('\n==========================================================');

  // TESTE DA QUESTÃO 8
  pikachu.curar(100);
  squirtle.curar(100);
  charmander.curar(100);

  print('\n================= BATALHA =================');
  executar_turno(pikachu, squirtle, choque);
  print('');
  executar_turno(squirtle, charmander, jato);
  print('');
  executar_turno(charmander, pikachu, lancaChamas);
  print('\n=================================================');

  // TESTE DA QUESTÃO 9
  print('\n================= TESTE INTERFACE =================');

  var rattata = PokemonFogo(numero: 19, nome: "Rattata", nivel: 5, hp_atual: 15, hp_maximo: 15, capturado: false);

  // Tentar favoritar sem capturar
  print('Tentando favoritar ${rattata.nome} sem capturar...');
  rattata.favoritar();

  // Marcar como visto
  rattata.marcar_como_visto();
  print('${rattata.nome} visto: ${rattata.visto}');

  // Capturar (deve marcar como visto automaticamente)
  rattata.marcar_como_capturado();
  print('${rattata.nome} capturado: ${rattata.capturado}');
  print('${rattata.nome} visto: ${rattata.visto}');

  // Agora favoritar (já foi capturado)
  rattata.favoritar();
  print('${rattata.nome} favorito: ${rattata.favorito}');

  // Desfavoritar
  rattata.desfavoritar();
  print('${rattata.nome} favorito: ${rattata.favorito}');

  print('\n=========================================================');


  // TESTE DA QUESTÃO 10
  minhaPokedex.adicionarPokemon(rattata);
  rattata.hp_maximo = 100;
  rattata.hp_atual = 100;
  rattata.favoritar();

  print('\n================= TESTE FUNÇÃO ANONIMA =================');
  var pokemons = minhaPokedex.pokemons;

  // Filtrar pokemons com hp abaixo de 30
  print('\n---- Hp abaixo de 30 ----');
  var hp_baixo = pokemons.where((p) => p.hp_atual < 30).toList();
  for (var p in hp_baixo) {
    print('${p.nome} - HP: ${p.hp_atual}');
  }

  // Ordernar ordem alfabetica
  print('\n---- Ordem Alfabetica ----');
  var por_nome = List<Pokemon>.from(pokemons)..sort((a,b) => a.nome.compareTo(b.nome));
  for (var p in por_nome) {
    print(p.nome);
  }

  // Ordenar por nivel em ordem decrescente
  print('\n---- Nivel decrescente ----');
  var por_nivel = List<Pokemon>.from(pokemons)..sort((a,b) => b.nivel.compareTo(a.nivel));
  for (var p in por_nivel) {
    print('${p.nome} - Nivel: ${p.nivel}');
  }

  // Selecionar apenas favoritos
  print('\n ---- Favoritos ----');
  var favoritos = pokemons.where((p) => p.favorito).toList();
  for(var p in favoritos) {
    print(p.nome);
  }
  print('\n=====================================================');

  // TESTE DA QUESTÃO 11
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

  print('Porcentagem de pokemons capturados: ${minhaPokedex.percentual_capturados().toStringAsFixed(2)}%');

  print('\n=====================================================');
}

void questao_12() {
  // QUESTÃO 12 -- DESAFIO FINAL
  var pokedex = Pokedex();

  // cadastrar pelo menos 8 pokémons (pelo menos 3 tipos diferentes)
  var bulbasaur = Pokemon(numero: 1, nome: "Bulbasaur", tipo: "Planta", nivel: 5, hp_atual: 20, hp_maximo: 20, capturado: false, proxima_evolucao: "Ivysaur", nivel_evolucao: 16);
  var charmander = PokemonFogo(numero: 4, nome: "Charmander", nivel: 8, hp_atual: 40, hp_maximo: 40, capturado: false, energia: 50);
  var squirtle = PokemonAgua(numero: 7, nome: "Squirtle", nivel: 5, hp_atual: 50, hp_maximo: 50, capturado: false, energia: 50);
  var pikachu = PokemonEletrico(numero: 25, nome: "Pikachu", nivel: 10, hp_atual: 30, hp_maximo: 30, capturado: false, energia: 50);
  var mewtwo = Pokemon(numero: 150, nome: "Mewtwo", tipo: "Psíquico", nivel: 70, hp_atual: 200, hp_maximo: 200, capturado: false);
  var gengar = Pokemon(numero: 94, nome: "Gengar", tipo: "Fantasma", nivel: 40, hp_atual: 80, hp_maximo: 80, capturado: false);
  var torkoal = PokemonFogo(numero: 324, nome: "Torkoal", nivel: 30, hp_atual: 60, hp_maximo: 60, capturado: false, energia: 50);
  var clawitzer = PokemonAgua(numero: 693, nome: "Clawitzer", nivel: 20, hp_atual: 55, hp_maximo: 55, capturado: false, energia: 50);

  pokedex.adicionarPokemon(bulbasaur);
  pokedex.adicionarPokemon(charmander);
  pokedex.adicionarPokemon(squirtle);
  pokedex.adicionarPokemon(pikachu);
  pokedex.adicionarPokemon(mewtwo);
  pokedex.adicionarPokemon(gengar);
  pokedex.adicionarPokemon(torkoal);
  pokedex.adicionarPokemon(clawitzer);

  // marcar alguns como vistos;
  bulbasaur.marcar_como_visto();
  mewtwo.marcar_como_visto();
  gengar.marcar_como_visto();

  // marcar alguns como capturados;
  charmander.marcar_como_capturado();
  squirtle.marcar_como_capturado();
  pikachu.marcar_como_capturado();
  torkoal.marcar_como_capturado();
  clawitzer.marcar_como_capturado();

  // favoritar pelo menos 2;
  pikachu.favoritar();
  torkoal.favoritar();

  // aplicar todos os filtros da questão 5;
  print('\n--- Capturados ---');
  for (var p in pokedex.listar_capturados()) { print(p.nome); }

  print('\n--- Tipo Fogo ---');
  for (var p in pokedex.listar_por_tipo("Fogo")) { print(p.nome); }

  print('\n--- Acima do nível 15 ---');
  for (var p in pokedex.listar_acima_do_nivel(15)) { print(p.nome); }

  print('\n--- Podem evoluir ---');
  bulbasaur.subir_nivel(15); // nivel 20, pode evoluir (nivel_evolucao = 16)
  for (var p in pokedex.listar_que_podem_evoluir()) { print(p.nome); }

  // realizar pelo menos 1 evolução;
  print('');
  bulbasaur.evoluir();

  // simular pelo menos 2 batalhas com habilidades;
  print('\n--- Batalhas ---');
  var choque = ChoqueDoTrovao();
  var lanca_chamas = LancaChamas();

  executar_turno(pikachu, squirtle, choque);
  print('');
  executar_turno(charmander, clawitzer, lanca_chamas);

 // exibir as estatísticas finais da Pokédex.
  print('\n--- Estatísticas ---');
  print('Total: ${pokedex.total_pokemons()}');
  pokedex.quantidade_por_tipo().forEach((tipo, qtd) { print('$tipo: $qtd'); });
  print('Média de nível: ${pokedex.media_de_nivel().toStringAsFixed(2)}');
  print('Capturados: ${pokedex.percentual_capturados().toStringAsFixed(2)}%');

  print('\n=========================================================');
}

void main() {
  teste_ate_a_questao_11();
  questao_12();
}
