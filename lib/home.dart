import 'package:flutter/material.dart';
import 'dart:async';
import 'model.dart';
import 'enter.dart';
import 'crud.dart';

class Home extends StatefulWidget {
  @override

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CRUD dbHelper = CRUD();
  Future<List<Model>> future;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  void updateListView() {
    setState(() {
      future = dbHelper.getClientList();
    });
  }

  Future<Model> navigateToEntryForm(BuildContext context, Model client) async {
    var result = await Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return EntryForm(client);
      }
    ));
    return result;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data-Data Client',
          textScaleFactor: 1.1,
          ),
      ),
      body: FutureBuilder<List<Model>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data.map((todo) => cardo(todo)).toList()
            );
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add Data',
        onPressed: () async {
          var client = await navigateToEntryForm(context, null);
          if (client != null) {
            int result = await dbHelper.insert(client);
            if (result > 0) {
              updateListView();
            }
          }
        },
      ),
    );
  }

  Card cardo(Model client) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.people),
        ),
        title: Text(
          client.nickname,
        ),
        subtitle: Text(client.store),
        trailing: GestureDetector(
          child: Icon(Icons.delete),
          onTap: () async {
            int result = await dbHelper.delete(client);
            if (result > 0) {
              updateListView();
            }
          },
        ),
        onTap: () async {
          var client2 = await navigateToEntryForm(context, client);
          if (client2 != null) {
            int result = await dbHelper.update(client2);
            if (result > 0) {
              updateListView();
            }
          }
        },
      ),
    );
  }
}

//  
