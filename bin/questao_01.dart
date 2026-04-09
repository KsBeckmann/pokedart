part of 'pokedart.dart';

// Questão 1 — classe Pokemon com os atributos e o construtor
// Questão 2 — atributos privados, getters, setters e métodos com validação
// Questão 3 — atributos de evolução e método evoluir()
// Questão 9 — implementa a interface RegistravelNaPokedex

class Pokemon implements RegistravelNaPokedex {

  // Questão 2 — atributos privados (encapsulamento)
  int _numero;
  String _nome;
  String _tipo;
  int _nivel;
  int _hp_atual;
  int _hp_maximo;
  bool _capturado;

  // Questão 3 — atributos de evolução
  String? proxima_evolucao;
  int nivel_evolucao;

  // Questão 7 — campo de energia usado pelas habilidades
  int energia;

  // Questão 9 — campos de status da pokédex
  bool _visto = false;
  bool _favorito = false;

  // Questão 1 — construtor recebendo todos os atributos obrigatórios
  Pokemon({
    required int numero,
    required String nome,
    required String tipo,
    required int nivel,
    required int hp_atual,
    required int hp_maximo,
    required bool capturado,
    this.proxima_evolucao,
    this.nivel_evolucao = 0,
    this.energia = 0,
  }) : _numero = numero,
       _nome = nome,
       _tipo = tipo,
       _nivel = nivel,
       _hp_atual = hp_atual,
       _hp_maximo = hp_maximo,
       _capturado = capturado {

    // Questão 1 — validações das restrições
    if (_nivel < 1 || _nivel > 100) {
      throw ArgumentError('Nivel deve estar entre 1 e 100!');
    }

    if (_hp_maximo <= 0) {
      throw ArgumentError('Hp maximo nao pode ser menor que 0!');
    }

    if (_hp_atual > _hp_maximo) {
      throw ArgumentError('Hp atual nao pode ser maior que o hp maximo');
    }
  }

  // Questão 2 — getters para leitura dos atributos privados
  int get numero => _numero;
  String get nome => _nome;
  String get tipo => _tipo;
  int get nivel => _nivel;
  int get hp_atual => _hp_atual;
  int get hp_maximo => _hp_maximo;
  bool get capturado => _capturado;
  bool get visto => _visto;
  bool get favorito => _favorito;

  // Questão 2 — setters com validação
  set numero(int valor) => _numero = valor;
  set nome(String valor) => _nome = valor;
  set tipo(String valor) => _tipo = valor;

  set nivel(int valor) {
    if (valor < 1 || valor > 100) {
      throw ArgumentError('Nivel deve estar entre 1 e 100!');
    }
    _nivel = valor;
  }

  set hp_maximo(int valor) {
    if (valor <= 0) {
      throw ArgumentError('Hp maximo nao pode ser menor que 0!');
    }
    _hp_maximo = valor;
  }

  set hp_atual(int valor) {
    if (valor > _hp_maximo) {
      throw ArgumentError('Hp atual nao pode ser maior que o hp maximo');
    }
    _hp_atual = valor;
  }

  set capturado(bool valor) => _capturado = valor;

  // Questão 1 — método que exibe as informações do pokémon
  void exibir_ficha() {
    print('====== Pokemon: $_nome #$_numero ======');
    print('Capturado: ${_capturado ? "Sim" : "Nao"}');
    print('Tipo: $_tipo');
    print('Nivel: $_nivel');
    print('Hp: $_hp_atual/$_hp_maximo');
    print(' ');
  }

  // Questão 2 — método para subir de nível com validação
  bool subir_nivel(int quantidade) {
    if (quantidade < 0) {
      print('Quantidade nao pode ser negativa');
      return false;
    }

    try {
      nivel = _nivel + quantidade;
    } catch (e) {
      print('Falha ao subir nivel: $e');
      return false;
    }
    return true;
  }

  // Questão 2 — método para receber dano sem deixar o HP negativo
  bool receber_dano(int dano) {
    if (dano < 0) {
      print('Dano nao pode ser negativo');
      return false;
    }

    if (dano >= _hp_atual) {
      _hp_atual = 0;
    } else {
      _hp_atual = _hp_atual - dano;
    }
    return true;
  }

  // Questão 2 — método de cura sem deixar o HP passar do máximo
  bool curar(int valor) {
    if (valor < 0) {
      print('Cura nao pode ser negativa');
      return false;
    }

    if (_hp_atual + valor >= _hp_maximo) {
      _hp_atual = _hp_maximo;
    } else {
      _hp_atual = _hp_atual + valor;
    }

    return true;
  }

  // Questão 3 — método de evolução com todas as regras
  void evoluir() {
    if (proxima_evolucao == null) {
      print('$nome nao possui mais evolucoes programadas.');
      print('');
      return;
    }

    if (_nivel < nivel_evolucao) {
      print('$nome nao consegue evoluir');
      print('Nivel atual: $_nivel');
      print('Nivel necessario: $nivel_evolucao');
      print('');
      return;
    }

    var nomeAntigo = _nome;

    _nome = proxima_evolucao!;
    proxima_evolucao = null;

    _hp_maximo += 20;
    _hp_atual = hp_maximo;

    print('==== EVOLUCAO ! ====');
    print('$nomeAntigo evoluiu para $nome');
    print('Novo HP maximo: [$hp_maximo]');
    print('====================');
    print('');
  }

  // Questão 6 — método base de ataque (sobrescrito nas subclasses)
  int calcular_ataque_base() {
    print('nao implementado');
    return 0;
  }

  // Questão 9 — implementação dos métodos da interface
  @override
  void marcar_como_visto() {
    _visto = true;
  }

  @override
  void marcar_como_capturado() {
    marcar_como_visto();
    _capturado = true;
  }

  @override
  void favoritar() {
    if (!capturado) {
      print('Voce nao pode favoritar um pokemon que ainda nao foi capturado!');
      return;
    }

    _favorito = true;
  }

  @override
  void desfavoritar() {
    _favorito = false;
  }
}