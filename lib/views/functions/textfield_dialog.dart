import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';
import 'package:demo/views/widgets/customized_textfield.dart';

Future<void> showTextFieldDialog({
  required BuildContext context,
  required String title,
  required Function(String) onConfirm,
}) {
  final TextEditingController _nameController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          _nameController.addListener(() {
            setState(() {});
          });
          return AlertDialog(
            title: Align(
              child: Text(
                title,
                style: TextStyle(
                  color: isDarkMode.value ? Colors.white : Colors.black,
                ),
              ),
            ),
            surfaceTintColor: Colors.blue.shade100,
            backgroundColor: !isDarkMode.value
                ? Colors.white
                : Colors.blueGrey.shade900,
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actionsPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
            actions: [
              CustomizedTextfield(
                controller: _nameController,
                hideText: false,
                hintText: "New Username",
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cancel
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.blue.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  // Save
                  TextButton(
                    onPressed: _nameController.text.isEmpty
                        ? null
                        : () {
                            onConfirm(_nameController.text);
                            Navigator.pop(context);
                          },
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: _nameController.text.isEmpty
                            ? Colors.blueGrey
                            : Colors.blue.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
