import 'package:flutter/material.dart';
class SettingsWidget extends StatefulWidget {

   List valores;

  SettingsWidget({List valores}): this.valores = valores;

  @override
  _SettingsWidgetState createState() => new _SettingsWidgetState(valores);
}

class _SettingsWidgetState extends State<SettingsWidget> {
  _SettingsWidgetState(this.valores);
  final List valores;


  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {

    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in valores) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
      new Text("Tipo: "),
      new DropdownButton(
        value: _currentCity,
        items: _dropDownMenuItems,
        onChanged: changedDropDownItem,
      )
    ]);
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}
