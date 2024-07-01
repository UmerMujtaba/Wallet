import 'package:flutter/material.dart';

class TextFieldSignup extends StatefulWidget {
  const TextFieldSignup({Key? key}) : super(key: key);

  @override
  State<TextFieldSignup> createState() => _TextFieldSignupState();
}

class _TextFieldSignupState extends State<TextFieldSignup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
          child: TextField(
            controller: nameController,
            obscureText: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              prefixIcon: const Icon(
                Icons.person_outline,
                color: Colors.blueAccent,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                // Slightly curved corners
                borderSide: const BorderSide(
                  color: Colors
                      .transparent, // Makes the border transparent
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                // Slightly curved corners
                borderSide: const BorderSide(
                  color: Colors
                      .transparent, // Makes the border transparent
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                // Slightly curved corners
                borderSide: const BorderSide(
                  color: Colors
                      .transparent, // Makes the border transparent
                ),
              ),
              labelText: 'Username',
              hintText: 'Username',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 5),
          child: TextField(
            controller: nameController,
            obscureText: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black12,
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.blueAccent,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                // Slightly curved corners
                borderSide: const BorderSide(
                  color: Colors
                      .transparent, // Makes the border transparent
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                // Slightly curved corners
                borderSide: const BorderSide(
                  color: Colors
                      .transparent, // Makes the border transparent
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                // Slightly curved corners
                borderSide: const BorderSide(
                  color: Colors
                      .transparent, // Makes the border transparent
                ),
              ),
              labelText: 'Email',
              hintText: 'Email',
            ),
          ),
        ),

      ],
    );
  }
}
