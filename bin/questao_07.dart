part of 'pokedart.dart';

// QUESTAO 7
abstract class Habilidade {
  String nome = '';
  int custo_energia = 0;

  Habilidade(this.nome, this.custo_energia);

  void usar(Pokemon usuario, Pokemon alvo);
}

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
