import 'package:app/screens/mapa_page.dart';
import 'package:flutter/material.dart';
import 'package:app/services/remote_service.dart';

/*class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
    );
  }
}*/

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email;
  var pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                  onChanged: (value) {
                    email = value;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  onChanged: (value) {
                    pass = value;
                  }),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  var code = RemoteService().login(email, pass);
                  print(code);
                  if (code == 200) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MapaPage()));
                  } else
                    Text("Wrong Credentials");
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Color.fromARGB(255, 58, 44, 44), fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
