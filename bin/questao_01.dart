/*
Questão 1 — Cadastro básico de Pokémon
Crie uma classe Pokemon com os seguintes atributos obrigatórios: 
   •int numero 
   •String nome 
   •String tipo 
   •int nivel 
   •int hpAtual 
   •int hpMaximo 
   •bool capturado 
Implemente um construtor que receba todos esses valores. 
Depois,  crie  um  método  exibirFicha()  que  mostre  todas  as  informações  do  pokémon  de  forma organizada. 
No main(), instancie exatamente 3 pokémons diferentes e exiba a ficha de cada um. 
Restrições:
   •nivel deve começar entre 1 e 100. 
   •hpAtual não pode ser maior que hpMaximo. 
   •hpMaximo deve ser maior que 0. 
*/

part of 'pokedart.dart';

// Definindo a classe e implementando uma Interface (contrato de regras)
class Pokemon implements RegistravelNaPokedex {
  // Atributos Privados (o '_' impede que sejam alterados sem passar pelos validadores)
  int _numero;
  String _nome;
  String _tipo;
  int _nivel;
  int _hp_atual;
  int _hp_maximo;
  bool _capturado;

  // Variáveis extras das questões da lista
  String? proxima_evolucao; // O '?' significa que pode ser nulo (se não tiver mais evolução)
  int nivel_evolucao;
  int energia;

  // Status de controle da Pokedex
  bool _visto = false;
  bool _favorito = false;

  // CONSTRUTOR: Onde o Pokémon "nasce"
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
    
    // Travas de segurança: Não deixa criar Pokémon com dados impossíveis
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

  // GETTERS: Para a gente conseguir ler os dados privados no main.dart
  int get numero => _numero;
  String get nome => _nome;
  String get tipo => _tipo;
  int get nivel => _nivel;
  int get hp_atual => _hp_atual;
  int get hp_maximo => _hp_maximo;
  bool get capturado => _capturado;
  bool get visto => _visto;
  bool get favorito => _favorito;

  // SETTERS: Para mudar os valores com segurança
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

  // Método para printar as infos no console
  void exibir_ficha() {
    print('====== Pokemon: $_nome #$_numero ======');
    print('Capturado: ${_capturado ? "Sim" : "Nao"}');
    print('Tipo: $_tipo');
    print('Nivel: $_nivel');
    print('Hp: $_hp_atual/$_hp_maximo');
    print(' ');
  }

  // Lógica para subir de nível
  bool subir_nivel(int quantidade) {
    if (quantidade < 0) {
      print('Quantidade nao pode ser negativa');
      return false;
    }

    try {
      nivel = _nivel + quantidade; // Usa o 'set nivel' para validar se passa de 100
    } catch (e) {
      print('Falha ao subir nivel: $e');
      return false;
    }
    return true;
  }

  // Lógica de combate (diminuir HP)
  bool receber_dano(int dano) {
    if (dano < 0) {
      print('Dano nao pode ser negativo');
      return false;
    }

    if (dano >= _hp_atual) {
      _hp_atual = 0; // Pokémon desmaiou, o HP não fica negativo
    } else {
      _hp_atual = _hp_atual - dano;
    }
    return true;
  }

  // Lógica de cura (o HP não pode passar do máximo permitido)
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

  // Lógica de Evolução: Muda o nome e ganha um "buff" de HP
  void evoluir() {
    // Se for null, é porque é a última evolução da linha
    if (proxima_evolucao == null) {
      print('$nome nao possui mais evolucoes programadas.');
      print('');
      return;
    }

    // Verifica se o nível atual é o necessário
    if (_nivel < nivel_evolucao) {
      print('$nome nao consegue evoluir');
      print('Nivel atual: $_nivel');
      print('Nivel necessario: $nivel_evolucao');
      print('');
      return;
    }

    var nomeAntigo = _nome;

    _nome = proxima_evolucao!; // O '!' diz que temos certeza que não é nulo aqui
    proxima_evolucao = null; // Remove a evolução atual (já evoluiu)

    _hp_maximo += 20; // Bônus de evolução
    _hp_atual = hp_maximo; // Cura o Pokémon ao evoluir

    print('==== EVOLUCAO ! ====');
    print('$nomeAntigo evoluiu para $nome');
    print('Novo HP maximo: [$hp_maximo]');
    print('====================');
    print('');
  }

  // Placeholder para uma funcionalidade futura
  int calcular_ataque_base() {
    print('nao implementado');
    return 0;
  }

  // MÉTODOS DA INTERFACE: Implementando o que a Pokedex exige
  @override
  void marcar_como_visto() {
    _visto = true;
  }

  @override
  void marcar_como_capturado() {
    marcar_como_visto(); // Se capturou, obviamente ele também viu
    _capturado = true;
  }

  @override
  void favoritar() {
    // Regra: Só favorita se o bicho estiver na sua coleção
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