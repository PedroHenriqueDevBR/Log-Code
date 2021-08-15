import 'package:flutter_desktop_sqlite/src/shared/models/contato_model.dart';

class ConnectionSQL {
  static final CREATE_DATABASE = '''
  CREATE TABLE "contatos" (
    `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
    `nome`	TEXT,
    `contato`	TEXT
  );
  ''';

  static String selecionarTodosOsContatos() {
    return 'select * from contatos;';
  }

  static String adicionarContato(Contato contato) {
    return '''
    insert into contatos (nome, contato)
    values ('${contato.nome}', '${contato.contato}');
    ''';
  }

  static String atualizarContato(Contato contato) {
    return '''
    update contatos
    set nome = '${contato.nome}',
    contato = '${contato.contato}'
    where id = ${contato.id};
    ''';
  }

  static String deletarContato(Contato contato) {
    return 'delete from contatos where id = ${contato.id};';
  }
}
