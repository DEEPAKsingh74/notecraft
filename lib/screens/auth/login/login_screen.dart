import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:notecraft/common/custom_button.dart';
import 'package:notecraft/common/form/text_field.dart';
import 'package:notecraft/common/hide_statusbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    StatusBarUtil.hideStatusBar();
  }

  @override
  void dispose() {
    StatusBarUtil.showStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                // color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              // color: Colors.amber,
              width: 340,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const TextFormInput(
                      keyboardType: TextInputType.emailAddress,
                      isObscure: false,
                      prefixIcon: Icon(FontAwesomeIcons.envelope),
                      hintTitle: "Enter your email address",
                      labelText: "Email Address",
                    ),
                    const TextFormInput(
                      keyboardType: TextInputType.visiblePassword,
                      isObscure: true,
                      prefixIcon: Icon(FontAwesomeIcons.key),
                      hintTitle: "Enter secure password",
                      labelText: "Secure Password",
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget Password?",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButtom(
                      title: "Login",
                      callback: () {},
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.google,
                  color: Color.fromARGB(255, 40, 40, 40),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                context.push('/register');
              },
              child: const Text(
                "New To Note Craft ? Register",
                style: TextStyle(
                  color: Color.fromARGB(211, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              width: 200,
              child: Text(
                "Please keep your credentials safe. Your Privacy matters 👋",
              ),
            )
          ],
        ),
      ),
    );
  }
}
