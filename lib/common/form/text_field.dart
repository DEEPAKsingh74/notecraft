import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFormInput extends StatefulWidget {
  final TextInputType keyboardType;
  final bool isObscure;
  final Icon prefixIcon;
  final String hintTitle;
  final String labelText;
  const TextFormInput(
      {super.key,
      required this.keyboardType,
      required this.isObscure,
      required this.prefixIcon,
      required this.hintTitle,
      required this.labelText});

  @override
  State<TextFormInput> createState() => _TextFormInputState();
}

class _TextFormInputState extends State<TextFormInput> {
  bool isPasswordHidden = false;

  @override
  void initState() {
    super.initState();
    isPasswordHidden = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: isPasswordHidden,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixStyle: const TextStyle(
            fontSize: 15,
          ),
          suffixIcon: (widget.isObscure)
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                  icon: (isPasswordHidden)
                      ? const Icon(
                          FontAwesomeIcons.eye,
                          size: 20,
                        )
                      : const Icon(
                          FontAwesomeIcons.eyeSlash,
                          size: 20,
                        ),
                )
              : null,
          hintText: widget.hintTitle,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 223, 167, 0),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
