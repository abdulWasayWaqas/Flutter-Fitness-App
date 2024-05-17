import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String emailError = '';
  String passwordError = '';

  void login(String email, String password) {
    if (email == 'admin' && password == 'admin') {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      setState(() {
        emailError = 'Invalid email';
        passwordError = 'Invalid password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange, // Setting background color to orange
      body: Scaffold(
        backgroundColor: Colors.black, // Setting background color to black
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.orange, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            style: TextStyle(
                                color: Colors
                                    .white), // Changing text color to white
                            decoration: InputDecoration(
                              fillColor: Colors.black,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorText:
                                  emailError.isNotEmpty ? emailError : null,
                              hintStyle: TextStyle(
                                  color: Colors
                                      .white), // Changing hint text color to black
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: passwordController,
                            style: TextStyle(
                                color: Colors
                                    .white), // Changing text color to white
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.black,
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorText: passwordError.isNotEmpty
                                  ? passwordError
                                  : null,
                              hintStyle: TextStyle(
                                  color: Colors
                                      .white), // Changing hint text color to black
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 0, 0,
                                      0), // Changing text color to white
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.orange,
                                // Changing button color to orange
                                child: IconButton(
                                  color: Colors
                                      .black, // Changing icon color to black
                                  onPressed: () {
                                    setState(() {
                                      emailError = '';
                                      passwordError = '';
                                    });
                                    login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                  },
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors
                                        .orange, // Changing text color to orange
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors
                                        .orange, // Changing text color to orange
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
