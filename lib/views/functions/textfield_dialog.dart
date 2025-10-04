import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';
import 'package:demo/views/widgets/textfields/customized_textfield.dart';

Future<void> showTextFieldDialog({
  required BuildContext context,
  required String title,
  required String hintText,
  required Function(String) onConfirm,
}) {
  final TextEditingController _controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          _controller.addListener(() {
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
                controller: _controller,
                hideText: false,
                hintText: hintText,
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
                    onPressed: _controller.text.isEmpty
                        ? null
                        : () {
                            onConfirm(_controller.text);
                            Navigator.pop(context);
                          },
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: _controller.text.isEmpty
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
