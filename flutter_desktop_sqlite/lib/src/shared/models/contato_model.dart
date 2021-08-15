class Contato {
  int? id;
  String nome;
  String contato;

  Contato({
    this.id,
    required this.nome,
    required this.contato,
  });

  factory Contato.fromSQLite(Map map) {
    return Contato(
      id: map['id'],
      nome: map['nome'],
      contato: map['contato'],
    );
  }

  static List<Contato> fromSQLiteList(List<Map> listMap) {
    List<Contato> contatos = [];
    for (Map item in listMap) {
      contatos.add(Contato.fromSQLite(item));
    }
    return contatos;
  }

  factory Contato.empty() {
    return Contato(nome: '', contato: '');
  }
}
