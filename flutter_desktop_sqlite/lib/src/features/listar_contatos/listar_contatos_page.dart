import 'package:flutter/material.dart';
import 'package:flutter_desktop_sqlite/src/features/modificar_contato/modificar_contatos_page.dart';
import 'package:flutter_desktop_sqlite/src/shared/dao/contato_dao.dart';
import 'package:flutter_desktop_sqlite/src/shared/models/contato_model.dart';

class ListarContatosPage extends StatefulWidget {
  const ListarContatosPage({Key? key}) : super(key: key);

  @override
  _ListarContatosPageState createState() => _ListarContatosPageState();
}

class _ListarContatosPageState extends State<ListarContatosPage> {
  List<Contato> contatos = [];
  ContatoDAO _contatoDAO = ContatoDAO();

  void selecionarTodosOsContatos() async {
    try {
      List<Contato> retorno = await _contatoDAO.selecionarTodos();
      contatos.clear();
      contatos.addAll(retorno);
      setState(() {});
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro ao buscar contatos')));
    }
  }

  @override
  void initState() {
    selecionarTodosOsContatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          Contato contato = contatos[index];
          return ListTile(
            title: Text(contato.nome),
            subtitle: Text(contato.contato),
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModificarContatoPage(
                      contato: contato,
                    ),
                  )).then((value) => selecionarTodosOsContatos());
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ModificarContatoPage(),
              )).then((value) => selecionarTodosOsContatos());
        },
      ),
    );
  }
}
