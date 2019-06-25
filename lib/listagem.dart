import 'package:flutter/material.dart';
import 'cadastro.dart';

class Listagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reboques'),
      ),
      body: getListView(), floatingActionButton: FloatingActionButton(
      onPressed: () {
        //Use`Navigator` widget to push the second screen to out stack of screens
        Navigator.of(context)
            .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
          return new Cadastro();
        }));
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    )
    );
  }
}


Widget getListView(){
  var listView=ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.directions_bus),
          title: Text('Reboque do Rafa'),
          subtitle: Text("Negociação"),
        ), ListTile(
          leading: Icon(Icons.directions_bus),
          title: Text('Reboque do Joao'),
          subtitle: Text("Orcamento"),
        ), ListTile(
          leading: Icon(Icons.directions_bus),
          title: Text('Reboque Pedro'),
          subtitle: Text("Montagem"),
        )

      ]
  );

  return listView;
}