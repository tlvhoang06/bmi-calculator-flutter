import 'package:demo/data/constants.dart';
import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomizedTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hideText;
  const CustomizedTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hideText,
  });
  @override
  State<CustomizedTextfield> createState() => _CustomizedTextfieldState();
}

class _CustomizedTextfieldState extends State<CustomizedTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(color: isDarkMode.value ? Colors.white : Colors.black),
      cursorColor: Color(primaryColor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(primaryColor)),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: (isDarkMode.value ? Colors.white : Colors.black),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 30),
      ),
      inputFormatters: [LengthLimitingTextInputFormatter(20)],
      obscureText: widget.hideText,
      onChanged: (value) => setState(() {}),
    );
  }
}
