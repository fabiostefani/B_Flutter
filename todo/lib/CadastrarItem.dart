import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'models/item.dart';

class CadastrarItem extends StatefulWidget {
  // save() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('data', jsonEncode(widget.itens));
  // }
  @override
  _CadastrarItemState createState() => _CadastrarItemState();
}

class _CadastrarItemState extends State<CadastrarItem> {
  var newTaskCtrl = TextEditingController();
  DateTime date1;
  DateTime date2;
  DateTime date3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: newTaskCtrl,
              autofocus: true,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black, fontSize: 30),
              decoration: InputDecoration(
                labelText: "Tarefa",
                labelStyle: TextStyle(color: Colors.blue),
              ),
            ),
            Divider(),
            DateTimePickerFormField(
              // initialValue: DateTime(DateTime.now().year, DateTime.now().month,
              //     DateTime.now().day),
              inputType: InputType.date,
              format: DateFormat("dd/MM/yyyy"),
              initialDate: DateTime.now(),
              editable: false,
              decoration: InputDecoration(
                labelText: 'Data',
                //hasFloatingPlaceholder: false,
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.black, fontSize: 30),
              onChanged: (dt) {
                setState(() => date2 = dt);
                print('Selecione a data: $date2');
              },
            ),
            ButtonTheme(
              height: 40,
              child: RaisedButton(
                onPressed: () {
                  var item = Item(title: newTaskCtrl.text, done: false);
                  Navigator.pop(context, item);
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
