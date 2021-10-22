import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productx/views/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Create Account",
          style: GoogleFonts.nunito(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold) ,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          child: ListView(
            children: [
              Container(
                height: _height /7,
                child: Image.asset("assets/programmer.png"),
                width: _width/8.5,
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "Let's get started! Please create an account.",
                  style:GoogleFonts.nunito(color: Colors.black, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    // suffixIcon: IconButton(icon: Icon( Icons.clear, color: Colors.blue,), onPressed: () {
                    //   setState(() {
                    //     _usernameController.clear();
                    //   });
                    // },),
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.0),
                    ),
                    hintText: "Username",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.0),
                    ),
                    hintText: "Password",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(

                  controller: _confirmPasswordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    focusColor: Color(0xFF0FABBC),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.0),
                    ),
                    hintText: "Confirm Password",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Wrap(
                  children: [
                    Text(
                        "By creating this account I have read and accepted the ", style: TextStyle(fontSize: 15)),
                    GestureDetector(
                        onTap: () {}, child: Text("Terms of Service", style: TextStyle(color: Colors.blue, fontSize: 15))),
                    Text(" and ", style: TextStyle(fontSize: 15)),
                    GestureDetector(
                        onTap: () {}, child: Text("Privacy Policy.", style: TextStyle(color: Colors.blue, fontSize: 15),)),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  height: 55,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child:
                      ElevatedButton.icon( icon: Icon(Icons.login_sharp), style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        primary: Color(0xFF0FABBC)
                      ),
                          onPressed: () {}, label: Text("Sign Up",style: GoogleFonts.nunito(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)))),
              SizedBox(
                height: 3,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ", style:GoogleFonts.workSans(color: Colors.black, fontSize: 17),),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => SignIn()));
                        },
                        child: Text(" Sign In", style:GoogleFonts.workSans(color: Colors.blue, fontSize: 17, ),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
