import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/ListaItens.dart';

import 'models/item.dart';

void main() => runApp(App());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListaItensPage(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   var itens = new List<Item>();
//   HomePage() {
//     itens = [];
//     // itens.add(Item(title: "Banana", done: false));
//     // itens.add(Item(title: "Uva", done: true));
//     // itens.add(Item(title: "Laranja", done: false));
//     // itens.add(Item(title: "Maça", done: true));
//   }

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var newTaskCtrl = TextEditingController();
//   void add() {
//     if (newTaskCtrl.text.isEmpty) return;
//     setState(() {
//       widget.itens.add(
//         Item(title: newTaskCtrl.text, done: false),
//       );
//       newTaskCtrl.text = "";
//       save();
//     });
//   }

//   void remove(int index) {
//     setState(() {
//       widget.itens.removeAt(index);
//       save();
//     });
//   }

//   Future load() async {
//     //SEMPRE QUE USAR UM SHARED PREFERENCES, DEVE SER UTILIZADO PROGRAMAÇÃO ASSINCRONA.
//     var prefs = await SharedPreferences.getInstance();
//     var data = prefs.getString('data');
//     if (data == null) {
//       return;
//     }
//     Iterable decoded = jsonDecode(data);
//     List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();
//     setState(() {
//       widget.itens = result;
//     });
//   }

//   save() async {
//     var prefs = await SharedPreferences.getInstance();
//     await prefs.setString('data', jsonEncode(widget.itens));
//   }

//   _HomePageState() {
//     load();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //newTaskCtrl.clear();
//     return Scaffold(
//       appBar: AppBar(
//         title: TextFormField(
//           controller: newTaskCtrl,
//           keyboardType: TextInputType.text,
//           style: TextStyle(color: Colors.white, fontSize: 18),
//           decoration: InputDecoration(
//             labelText: "Nova tarefa",
//             labelStyle: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: widget.itens.length,
//         itemBuilder: (BuildContext context, int index) {
//           final item = widget.itens[index];
//           // return CheckboxListTile(
//           //   title: Text(item.title),
//           //   key: Key(item.title),
//           //   value: item.done,
//           //   onChanged: (value) {
//           //     setState(() {
//           //       item.done = value;
//           //     });
//           //   },
//           // );
//           return Dismissible(
//             child: CheckboxListTile(
//               title: Text(item.title),
//               value: item.done,
//               onChanged: (value) {
//                 setState(() {
//                   item.done = value;
//                   save();
//                 });
//               },
//             ),
//             key: Key(item.title),
//             background: Container(
//               color: Colors.red.withOpacity(0.2),
//             ),
//             onDismissed: (direction) {
//               //print(direction);
//               remove(index);
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: add,
//         child: Icon(Icons.add),
//         backgroundColor: Colors.pink,
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
