import 'package:flutter/material.dart';

import 'SettingsWidget.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
        ),
        body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Informe nome do cliente'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor Informe nome do cliente';
                  }
                },
              ),
              new SettingsWidget(valores: [
                "Reboque Motosj",
                "Reboque Cavalo",
                "Reboque Comida",
                "Reboque Carretinha"
              ],),
              ButtonTheme(
                  minWidth: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // Process data.
                      }
                    },
                    child: Text('Salvar'),
                  )),
            ],
          ),
        ));
  }
}
