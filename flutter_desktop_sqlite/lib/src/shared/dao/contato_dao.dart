import 'package:flutter_desktop_sqlite/src/shared/dao/sql.dart';
import 'package:flutter_desktop_sqlite/src/shared/models/contato_model.dart';
import 'package:flutter_desktop_sqlite/src/shared/services/connection_sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDAO {
  ConnectionSQLiteService _connection = ConnectionSQLiteService.instance;

  Future<Database> _getDatabase() async {
    return await _connection.db;
  }

  Future<Contato> adicionar(Contato contato) async {
    try {
      Database db = await _getDatabase();
      int id = await db.rawInsert(ConnectionSQL.adicionarContato(contato));
      contato.id = id;
      return contato;
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> atualizar(Contato contato) async {
    try {
      Database db = await _getDatabase();
      int linhasAfetadas =
          await db.rawUpdate(ConnectionSQL.atualizarContato(contato));
      if (linhasAfetadas > 0) {
        return true;
      }
      return false;
    } catch (error) {
      throw Exception();
    }
  }

  Future<List<Contato>> selecionarTodos() async {
    try {
      Database db = await _getDatabase();
      List<Map> linhas =
          await db.rawQuery(ConnectionSQL.selecionarTodosOsContatos());
      List<Contato> contatos = Contato.fromSQLiteList(linhas);
      return contatos;
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> deletar(Contato contato) async {
    try {
      Database db = await _getDatabase();
      int linhasAfetadas =
          await db.rawUpdate(ConnectionSQL.deletarContato(contato));
      if (linhasAfetadas > 0) {
        return true;
      }
      return false;
    } catch (error) {
      throw Exception();
    }
  }
}
