import 'package:flutter/material.dart';
import 'package:playbook/src/provider/provider.dart';
import 'package:playbook/utils/colors.dart';
import 'package:playbook/widgets/buttons/dynamic_buttons/swith_cases.dart';
import 'package:playbook/widgets/dropdown/dropdown.dart';
import 'package:provider/provider.dart';

class DynamicActionButton extends StatefulWidget {
  final String type;
  final String? text;
  final GlobalKey<DropdownSectionState>? dropdownKey;
  final String? subType;
  const DynamicActionButton({
    super.key,
    required this.type,
    this.text,
    this.dropdownKey,
    this.subType,
  });

  @override
  State<DynamicActionButton> createState() => _DynamicActionButtonState();
}

class _DynamicActionButtonState extends State<DynamicActionButton> {
  //
  /// 4 types of buttons are created: Copy, Edit, Editing and Save
  // bool isTheCopyButton = false,
  //     // isTheEditButton = false,
  //     isTheSaveAfterEditingButton = false,
  //     isTheSaveButton = false;
  // isTheCheckButton = false,
  // isbuttonDisabled = false,
  // isbuttonEditClicked = false,
  // isbuttonCheckClicked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBaseProvider>(builder: (context, provider, child) {
      // Determine button properties based on the provider and widget type
      final bool isTheSaveButton =
          widget.type == 'Save' || widget.type == 'Save_After_Editing';
      final bool isTheSaveAfterEditingButton =
          widget.type == 'Save_After_Editing';
      final bool isTheCopyButton = widget.type == 'Copy';
      final bool isEdit = widget.type == 'Edit' && widget.type != 'Check';
      // if (widget.type == 'Edit') provider.isTheButtonEditingClicked(true);
      // switch (widget.type) {
      //   case 'Copy':
      //     isTheCopyButton = true;
      //     break;
      //   // case 'Edit':
      //   //   isTheEditButton = true;
      //   //   break;
      //   case 'Save_After_Editing':
      //     isTheSaveAfterEditingButton = true;
      //     // isbuttonDisabled = true;
      //     isTheSaveButton = true;
      //     break;
      //   case 'Save':
      //     isTheSaveButton = true;
      //     // isbuttonDisabled = true;
      //     break;
      // case 'Check':
      //   isTheEditButton = false;
      //   break;
      //}

      return isTheSaveButton
          ? ElevatedButton(
              onPressed: provider.isSaveButtonIsDisabled
                  ? null
                  : () {
                      swithCases(widget.type, context, false,
                          widget.dropdownKey, widget.text, widget.subType);
                    },
              style: ElevatedButton.styleFrom(
                  backgroundColor: provider.isSaveButtonIsDisabled
                      ? greenLightColor
                      : greenDarkColor,
                  shadowColor: const Color.fromARGB(255, 7, 36, 86),
                  elevation: 5.0),
              child: Text(
                isTheSaveAfterEditingButton ? 'Save' : widget.type,
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              ))
          : IconButton(
              icon: isTheCopyButton
                  ? Icon(Icons.copy)
                  : isEdit
                      ? Icon(Icons.edit)
                      : Icon(Icons.check_outlined),
              color: amberColor,
              onPressed: () {
                // isEdit != isEdit;
                swithCases(widget.type, context, false, widget.dropdownKey,
                    widget.text, widget.subType);
              },
            );
    });
  }
}
