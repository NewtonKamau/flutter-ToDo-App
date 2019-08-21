import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<Widget> todosList = <Widget>[
    ToDoWidget("Tutorial Deadline", "finish this tutorial by end of next month",
        DateTime.now()),
        Divider(),
    ToDoWidget("Commit To Growth", "Code and develop my skills",
        DateTime.now()),
        Divider(),
    ToDoWidget("Revamp Website", "Update My website With Relevant Skills ",
        DateTime.now()),
        Divider(),
    ToDoWidget("Find Time For Friends", "finish this tutorial by end of next month",
        DateTime.now()),
        Divider(),

    ToDoWidget("Take December Vacation", "finish this tutorial by end of next month",
        DateTime.now())

  ];

  @override
  Widget build(BuildContext context) {
    var onNavigationBarTap = (int index){
      print(index);
    };
    var bottomNavigationBar = BottomNavigationBar(onTap:onNavigationBarTap  ,items:[
      BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("ToDos")),
      BottomNavigationBarItem(icon: Icon(Icons.add),title: Text("Add To Dos"))
    ],);
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        appBar: AppBar(
          title: Text("To-Do List"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: this.todosList,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ToDoWidget extends StatefulWidget {
  final String title;
  final String message;
  var now = new DateTime.now();

  ToDoWidget(this.title, this.message, this.now);

  @override
  State<StatefulWidget> createState() {
    return ToDoState(this.title, this.message, this.now);
  }
}

class ToDoState extends State<ToDoWidget> {
  final String title;
  final String message;
  var now = new DateTime.now();
  // String date;
  ToDoState(this.title, this.message, this.now);

  @override
  Widget build(BuildContext context) {
    var textFieldTitleDecorations = InputDecoration(border: InputBorder.none);
    var textFieldTitleStyle =
        TextStyle(fontWeight: FontWeight.bold, color: Colors.blue);
    var titleController = TextEditingController(text: this.title);
    var title = TextField(
      controller: titleController,
      decoration: textFieldTitleDecorations,
      style: textFieldTitleStyle,
    );
    var message =
        Padding(padding: EdgeInsets.only(top: 10.0), child: Text(this.message));
    String dateString = "Created" + this.now.toString();
    var dateCreated =
        Padding(padding: EdgeInsets.only(top: 10.0), child: Text(dateString));

    var todocard = Column(
      children: <Widget>[title, message, dateCreated],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
    return Container(
      width: 400.0,
      height: 150.0,
      padding: EdgeInsets.all(15.0),
      child: todocard,
    );
  }
}
