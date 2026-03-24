class Pokemon {
  int numero;
  String nome;
  String tipo;
  int nivel;
  int hp_atual;
  int hp_maximo;
  bool capturado;

  Pokemon({
    required this.numero,
    required this.nome,
    required this.tipo,
    required this.nivel,
    required this.hp_atual,
    required this.hp_maximo,
    required this.capturado,
  }) {
    if (nivel < 1 || nivel > 100) {
      throw ArgumentError("Nivel deve estar entre 1 e 100!");
    }

    if (hp_maximo <= 0) {
      throw ArgumentError("Hp máximo não pode ser menor que 0!");
    }

    if (hp_atual > hp_maximo) {
      throw ArgumentError("Hp atual não pode ser maior que o hp máximo");
    }
  }

  void exibir_ficha() {
    print('====== Pokemon: $nome #$numero ======');
    print('Capturado: ${capturado ? "Sim" : "Não"}');
    print('Tipo: $tipo');
    print('Nível: $nivel');
    print('Hp: $hp_atual/$hp_maximo');
    print(' ');
  }
}

void main(List<String> arguments) {
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
}
