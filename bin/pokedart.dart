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
    print('1 - Rodar testes das questoes 1 a 11');
    print('2 - Rodar questao 12');
    print('3 - Rodar tudo');
    print('0 - Sair');
    print('===============================================');
    stdout.write('Escolha uma opcao: ');

    var opcao = stdin.readLineSync()?.trim();
    print('');

    switch (opcao) {
      case '1':
        teste_ate_a_questao_11();
        _aguardar_enter();
        break;
      case '2':
        questao_12();
        _aguardar_enter();
        break;
      case '3':
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
