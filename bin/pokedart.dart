import 'dart:io';

part 'questao_09.dart';
part 'questao_01.dart';
part 'questao_04.dart';
part 'questao_06.dart';
part 'questao_07.dart';
part 'questao_08.dart';
part 'teste_questoes_01_a_11.dart';
part 'questao_12.dart';

void main() {
  exibir_menu();
}

void exibir_menu() {
  while (true) {
    print('================ MENU POKEDART ================');
    print('1 - Rodar questao 1');
    print('2 - Rodar questao 3');
    print('3 - Rodar questao 4');
    print('4 - Rodar questao 5');
    print('5 - Rodar questao 6');
    print('6 - Rodar questao 7');
    print('7 - Rodar questao 8');
    print('8 - Rodar questao 9');
    print('9 - Rodar questao 10');
    print('10 - Rodar questao 11');
    print('11 - Rodar questao 12');
    print('12 - Rodar questoes 1 a 11');
    print('13 - Rodar tudo');
    print('0 - Sair');
    print('===============================================');
    stdout.write('Escolha uma opcao: ');

    var opcao = stdin.readLineSync()?.trim();
    print('');

    switch (opcao) {
      case '1':
        rodar_questao_1();
        _aguardar_enter();
        break;
      case '2':
        rodar_questao_3();
        _aguardar_enter();
        break;
      case '3':
        rodar_questao_4();
        _aguardar_enter();
        break;
      case '4':
        rodar_questao_5();
        _aguardar_enter();
        break;
      case '5':
        rodar_questao_6();
        _aguardar_enter();
        break;
      case '6':
        rodar_questao_7();
        _aguardar_enter();
        break;
      case '7':
        rodar_questao_8();
        _aguardar_enter();
        break;
      case '8':
        rodar_questao_9();
        _aguardar_enter();
        break;
      case '9':
        rodar_questao_10();
        _aguardar_enter();
        break;
      case '10':
        rodar_questao_11();
        _aguardar_enter();
        break;
      case '11':
        questao_12();
        _aguardar_enter();
        break;
      case '12':
        teste_ate_a_questao_11();
        _aguardar_enter();
        break;
      case '13':
        teste_ate_a_questao_11();
        print('');
        questao_12();
        _aguardar_enter();
        break;
      case '0':
        print('Encerrando o programa...');
        return;
      default:
        print('Opcao invalida. Tente novamente.');
        print('');
    }
  }
}

void _aguardar_enter() {
  print('');
  stdout.write('Pressione Enter para voltar ao menu... ');
  stdin.readLineSync();
  print('');
}
