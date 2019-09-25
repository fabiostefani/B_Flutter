import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'models/item.dart';

class CadastrarItem extends StatefulWidget {
  @override
  _CadastrarItemState createState() => _CadastrarItemState();
}

class _CadastrarItemState extends State<CadastrarItem> {
  var newTaskCtrl = TextEditingController();
  var ctrlDate = TextEditingController();
  DateTime date2;
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
              controller: ctrlDate,
              inputType: InputType.date,
              format: DateFormat("dd/MM/yyyy"),
              initialDate: DateTime.now(),
              initialValue: DateTime.now(),
              editable: false,
              decoration: InputDecoration(
                labelText: 'Data',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              style: TextStyle(color: Colors.black, fontSize: 30),
              onChanged: (dt) {
                setState(() => date2 = dt);
              },
            ),
            ButtonTheme(
              height: 40,
              child: RaisedButton(
                onPressed: () {
                  var item = Item(
                      title: newTaskCtrl.text,
                      done: false,
                      data: ctrlDate.text);
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
