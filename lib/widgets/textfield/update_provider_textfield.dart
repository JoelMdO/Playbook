import 'package:flutter/material.dart';
import 'package:playbook/src/provider/provider.dart';
import 'package:provider/provider.dart';

void updateProvidersonTextField(
    BuildContext context, String section, String value) {
  Provider.of<DataBaseProvider>(context, listen: false).textField(true);
  if (value.isEmpty || value == '') {
    Provider.of<DataBaseProvider>(context, listen: false).textField(false);
  }
  if (section == 'Subject') {
    Provider.of<DataBaseProvider>(context, listen: false).insertSubject(value);
  } else if (section == 'Code') {
    Provider.of<DataBaseProvider>(context, listen: false).insertCode(value);
  } else if (section == 'Description') {
    Provider.of<DataBaseProvider>(context, listen: false)
        .insertDescription(value);
  }
}
