import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  List valores;
  String defaultSelect;
  String label;

  SettingsWidget({List valores, String defaultSelect, String label})
      : this.valores = valores,
        this.defaultSelect = defaultSelect,
        this.label = label;

  @override
  _SettingsWidgetState createState() =>
      new _SettingsWidgetState(valores, defaultSelect,label);
}

class _SettingsWidgetState extends State<SettingsWidget> {
  List valores;
  String defaultSelect;
  String label;
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  _SettingsWidgetState(this.valores, this.defaultSelect,this.label);

  @override
  Widget build(BuildContext context) {
    return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(label),
          new DropdownButton(
            value: defaultSelect,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          )
        ]);
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      defaultSelect = selectedCity;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in valores) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    super.initState();
  }
}
