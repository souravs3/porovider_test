import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/controller/api_providers/auth_provider.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passworrdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(letterSpacing: 2),
                  hintText: 'Email id'),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _passworrdController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: TextStyle(letterSpacing: 2)),
            ),
            SizedBox(
              height: 30,
            ),
            // LoginButton(
            //     title: 'Login',
            //     onTapp: () {
            //       authProvider.login(
            //           _emailController.text, _passworrdController.text);
            //     }),

            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  textStyle:
                      WidgetStatePropertyAll(TextStyle(color: Colors.white))),
              onPressed: () {
                authProvider.login(
                    context, _emailController.text, _passworrdController.text);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: authProvider.isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 3,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
