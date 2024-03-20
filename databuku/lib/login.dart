import 'package:flutter/material.dart';
import 'package:databuku/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var _form = GlobalKey<FormState>();
  var dataUser = {"username": "@admin", "password": "password"};
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          Image.asset(
            "assets/images/4957136.jpg",
            height: 300,
            width: 300,
          ),
          Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Harap isi username";
                      }
                      return null;
                    },
                    controller: usernameC,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        labelText: "Username",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Harap isi password";
                      }
                      return null;
                    },
                    controller: passwordC,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        labelText: "Password",
                        border: OutlineInputBorder()),
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_form.currentState!.validate()) {
                  if (usernameC.text == dataUser['username'] &&
                      passwordC.text == dataUser['password']) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Ops harap masukan data yang benar"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
