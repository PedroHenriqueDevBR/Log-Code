import 'package:flutter/material.dart';
import 'package:flutter_desktop_sqlite/src/shared/dao/contato_dao.dart';
import 'package:flutter_desktop_sqlite/src/shared/models/contato_model.dart';

class ModificarContatoPage extends StatefulWidget {
  Contato? contato;
  ModificarContatoPage({this.contato});
  @override
  _ModificarContatoPageState createState() => _ModificarContatoPageState();
}

class _ModificarContatoPageState extends State<ModificarContatoPage> {
  final _formKey = GlobalKey<FormState>();
  Contato contato = Contato.empty();
  TextEditingController _txtNome = TextEditingController();
  TextEditingController _txtContato = TextEditingController();
  ContatoDAO _contatoDAO = ContatoDAO();

  void iniciarDadosDoFormulario() {
    if (widget.contato != null) {
      _txtNome.text = widget.contato!.nome;
      _txtContato.text = widget.contato!.contato;
      contato = widget.contato!;
    }
  }

  void salvar() {
    contato.nome = _txtNome.text;
    contato.contato = _txtContato.text;
    if (contato.id == null) {
      adicionarContato();
      return;
    }
    atualizarContato();
  }

  void adicionarContato() async {
    try {
      Contato retorno = await _contatoDAO.adicionar(contato);
      contato.id = retorno.id;
      mostrarMensagem('Contato adicionado com sucesso');
      setState(() {});
    } catch (error) {
      print(error);
      mostrarMensagem('Erro ao cadastrar');
    }
  }

  void atualizarContato() async {
    try {
      if (await _contatoDAO.atualizar(contato)) {
        mostrarMensagem('Atualização bem sucedida');
        return;
      }
      mostrarMensagem('Nenhum contato foi alterado');
    } catch (error) {
      print(error);
      mostrarMensagem('Erro ao atualizar contato');
    }
  }

  void deletar() async {
    try {
      if (contato.id != null) {
        if (await _contatoDAO.deletar(contato)) {
          mostrarMensagem('Contato deletado com sucesso');
          Navigator.pop(context);
          return;
        }
        mostrarMensagem('Nenhum contato deletado');
      }
      mostrarMensagem('Impossível deletar contato não cadastrado');
    } catch (error) {
      print(error);
      mostrarMensagem('Erro ao deletar contato');
    }
  }

  void mostrarMensagem(String menssagem) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(menssagem)));
  }

  @override
  void initState() {
    iniciarDadosDoFormulario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificação'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _txtNome,
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Campo é obrigatório';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                TextFormField(
                  controller: _txtContato,
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Campo é obrigatório';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Contato',
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            salvar();
                          }
                        },
                        child: Text('Salvar'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          contato.id == null
                              ? print('impossível deletar')
                              : deletar();
                        },
                        child: Text('Deletar'),
                        style: ElevatedButton.styleFrom(
                          primary:
                              contato.id == null ? Colors.grey : Colors.red,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
