import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BorderEditText extends StatelessWidget {

  String text;
  BorderEditText(this.text);

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
//              hintText: text,
              contentPadding: const EdgeInsets.all(8.0),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      );
  }
}