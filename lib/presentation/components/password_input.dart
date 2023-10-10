import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  PasswordInput({required this.label, required this.controller});

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey, // Icon color when not focused
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                    Colors.black, // Color of the bottom border when not focused
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(
                    0xFF029456), // Color of the bottom border when focused
              ),
            ),
            // Other InputDecoration properties...
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
