import 'package:flutter/material.dart';
import 'package:myfirstapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool chagedvalue = false;
  final _formkey = GlobalKey<FormState>();
  movedToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      chagedvalue = true;
      setState(() {});
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeroute);
      setState(() {});
      chagedvalue = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/login_image_new.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome $name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      labelText: 'Username',
                    ),
                    validator: (username) {
                      if (username == null || username.isEmpty) {
                        return 'Username cannot be empty';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      this.setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (password.length < 6) {
                        return 'Password length shoud be atleast 6 charactor long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () {
                        movedToHome(context);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 40,
                        width: chagedvalue ? 40 : 150,
                        alignment: Alignment.center,
                        child: chagedvalue
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                      ),
                    ),
                  )
                  /* ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Myroutes.homeroute);
                      },
                      child: Text(
                        'Login',
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(150, 35)),
                    ) */
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
