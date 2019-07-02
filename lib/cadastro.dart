import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'SettingsWidget.dart';
import 'package:intl/intl.dart';

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

  TextEditingController dateControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
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
              GestureDetector(
                  onTap: () => openCalendar(),
                  child: AbsorbPointer(
                    child: new TextField(
                      controller: dateControler,
                      decoration: InputDecoration(labelText: "Data de entrega"),
                    ),
                  )),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tamanho'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor Informe o tamanho';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cor'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor Informe a cor';
                  }
                },
              ), TextFormField(
                decoration: InputDecoration(labelText: 'N. chasis'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor Informe o N. chasis';
                  }
                },
              ),
              new SettingsWidget(
                valores: ["Bau", "Chassis", "Moto", "Cavalo", "Carga"],
                defaultSelect: "Moto",
                label: "Tipo:",
              ),
              new SettingsWidget(
                valores: ["Madeira", "Acm", "Ferro"],
                defaultSelect: "Madeira",
                label: "Laterais:",
              ),
              new SettingsWidget(
                valores: [
                  "Led",
                  "Normal",
                ],
                defaultSelect: "Led",
                label: "Sinaleiras:",
              ),
              ButtonTheme(
                  minWidth: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      /* if (_formKey.currentState.validate()) {
                        // Process data.
                      }*/
                    },
                    child: Text('Salvar'),
                  )),
            ],
          ),
        ));
  }

  openCalendar() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 3, 5),
        maxTime: DateTime(2019, 6, 7),
        onChanged: (date) {}, onConfirm: (date) {
      var formatter = new DateFormat('yyyy-MM-dd');

      dateControler.text = formatter.format(date);
    }, currentTime: DateTime.now(), locale: LocaleType.pt);
  }
}
