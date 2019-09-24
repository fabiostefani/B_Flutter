import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CadastrarItem.dart';
import 'models/item.dart';

class ListaItensPage extends StatefulWidget {
  var itens = new List<Item>();
  listaItensPage() {
    itens = [];
    // itens.add(Item(title: "Banana", done: false));
    // itens.add(Item(title: "Uva", done: true));
    // itens.add(Item(title: "Laranja", done: false));
    // itens.add(Item(title: "Maça", done: true));
  }

  @override
  _ListaItensPageState createState() => _ListaItensPageState();
}

class _ListaItensPageState extends State<ListaItensPage> {
  var newTaskCtrl = TextEditingController();
  void add() {
    if (newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.itens.add(
        Item(title: newTaskCtrl.text, done: false),
      );
      newTaskCtrl.text = "";
      save();
    });
  }

  void remove(int index) {
    setState(() {
      widget.itens.removeAt(index);
      save();
    });
  }

  Future load() async {
    //SEMPRE QUE USAR UM SHARED PREFERENCES, DEVE SER UTILIZADO PROGRAMAÇÃO ASSINCRONA.
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    if (data == null) {
      return;
    }
    Iterable decoded = jsonDecode(data);
    List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();
    setState(() {
      widget.itens = result;
    });
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.itens));
  }

  _ListaItensPageState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white, fontSize: 18),
          decoration: InputDecoration(
            labelText: "Tarefas para executar",
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.itens.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.itens[index];
          // return CheckboxListTile(
          //   title: Text(item.title),
          //   key: Key(item.title),
          //   value: item.done,
          //   onChanged: (value) {
          //     setState(() {
          //       item.done = value;
          //     });
          //   },
          // );
          return Dismissible(
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  // item.done = value;
                  // save();
                  remove(index);
                });
              },
            ),
            key: Key(item.title),
            background: Container(
              color: Colors.red.withOpacity(0.2),
            ),
            onDismissed: (direction) {
              //print(direction);
              remove(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openFormNewTask(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  _openFormNewTask(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CadastrarItem()),
    );
    if (result == null) return;
    if (result.title.isEmpty) return;
    widget.itens.add(result);
    save();
  }
}
