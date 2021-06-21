import 'package:flutter/material.dart';
import 'package:myfirstapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool chagedvalue = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
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
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () async {
                    chagedvalue = true;
                    setState(() {});
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, Myroutes.homeroute);
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
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        /* shape: chagedvalue
                              ? BoxShape.circle
                              : BoxShape.rectangle, */
                        borderRadius: BorderRadius.circular(20)),
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
    );
  }
}
