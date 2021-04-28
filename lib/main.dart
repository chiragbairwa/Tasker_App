import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Tasker',
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> listcontent = [
    'Thermal Paste',
    'Cmos Battery',
    'Computer Repair',
    'Time Table'
  ];
  final addlist = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasker'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Chirag'),
              accountEmail: Text('Email'),
            ),
            ListTile(
              title: Text('Add Task'),
              trailing: Icon(Icons.add_circle_outline),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return myalertbox();
                    });
              },
            ),
            ListTile(
              title: Text('Delete Task'),
              trailing: Icon(Icons.delete_outline),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height - 400.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Data5'),
                    trailing: Icon(Icons.close),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listcontent.length,
          itemBuilder: (context, index) {
            return (Dismissible(
                key: Key(listcontent[index]),
                onDismissed: (direction) {
                  listcontent.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Item Deleted'),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {},
                    trailing: Icon(Icons.widgets),
                    title: Text(listcontent[index]),
                  ),
                ),),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                //addlist = TextEditingController();

                return myalertbox();
              });
        },
      ),
    );
  }

  Widget myalertbox() {
    return AlertDialog(
      title: Text('Add Task'),
      content: Column(
        children: <Widget>[
          Container(
            child: TextField(
              controller: addlist,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Task',
                hintStyle: TextStyle(color: Colors.red),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (addlist.text == '') {
              } else {
                listcontent.add(addlist.text);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Item Added')));
              }
            },
            child: Icon(Icons.add_circle_outline),
          )
        ],
      ),
    );
  }
}
