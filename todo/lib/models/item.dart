class Item {
  String title;
  bool done;
  String data;

  Item({this.title, this.done, this.data});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = new Map<String, dynamic>();
    dados['title'] = title;
    dados['done'] = done;
    dados['data'] = data;

    return dados;
  }
}
