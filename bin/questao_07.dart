part of 'pokedart.dart';

// Questão 7 — classe abstrata Habilidade com o método abstrato usar()
abstract class Habilidade {
  String nome = '';
  int custo_energia = 0;

  Habilidade(this.nome, this.custo_energia);

  void usar(Pokemon usuario, Pokemon alvo);
}

// Questão 7 — ChoqueDoTrovao: dano = ataque base + 5, custo 5 de energia
class ChoqueDoTrovao extends Habilidade {
  ChoqueDoTrovao() : super('Choque do trovao', 5);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custo_energia) {
      print('Seu pokemon nao tem energia o suficiente');
      return;
    }

    var dano = usuario.calcular_ataque_base() + 5;
    var alvo_hp = alvo.hp_atual - dano;

    print('Vida do alvo -> ${alvo.hp_atual}');
    print('Dano -> $dano');

    usuario.energia -= custo_energia;

    if (alvo_hp < 0) {
      alvo.hp_atual = 0;
    } else {
      alvo.hp_atual = alvo_hp;
    }
  }
}

// Questão 7 — JatoDAgua: dano = ataque base + 3, custo 3 de energia
class JatoDAgua extends Habilidade {
  JatoDAgua() : super("Jato D'Agua", 3);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custo_energia) {
      print('Seu pokemon nao tem energia o suficiente');
      return;
    }

    var dano = usuario.calcular_ataque_base() + 3;
    var alvo_hp = alvo.hp_atual - dano;

    print('Vida do alvo -> ${alvo.hp_atual}');
    print('Dano -> $dano');

    usuario.energia -= custo_energia;

    if (alvo_hp < 0) {
      alvo.hp_atual = 0;
    } else {
      alvo.hp_atual = alvo_hp;
    }
  }
}

// Questão 7 — LancaChamas: dano = ataque base + 7, custo 7 de energia
class LancaChamas extends Habilidade {
  LancaChamas() : super('Lanca Chamas', 7);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custo_energia) {
      print('Seu pokemon nao tem energia o suficiente');
      return;
    }

    var dano = usuario.calcular_ataque_base() + 7;
    var alvo_hp = alvo.hp_atual - dano;

    print('Vida do alvo -> ${alvo.hp_atual}');
    print('Dano -> $dano');

    usuario.energia -= custo_energia;

    if (alvo_hp < 0) {
      alvo.hp_atual = 0;
    } else {
      alvo.hp_atual = alvo_hp;
    }
  }
}