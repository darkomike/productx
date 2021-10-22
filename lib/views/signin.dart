import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productx/views/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title:Text(
          "Sign In",
          style: GoogleFonts.nunito(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold) ,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "Welcome back!",
                  style:GoogleFonts.nunito(color: Colors.black, fontSize: 20),
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
                  obscureText:!_showPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon(_showPassword? Icons.visibility: Icons.visibility_off, color: Colors.black,), onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },),
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 0.0),
                    ),
                    hintText: "Password",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {}, child: Text("Forgot password?", style: TextStyle(color: Colors.blue, fontSize:18),)),                ],
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                  height: 55,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child:
                  ElevatedButton.icon( icon: Icon(Icons.login_sharp), style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      primary: Color(0xFF0FABBC)
                  ),
                      onPressed: () {}, label: Text("Sign In",style: GoogleFonts.nunito(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)))),
              SizedBox(
                height: 3,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't  have an account? ", style:GoogleFonts.workSans(color: Colors.black, fontSize: 17),),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => SignUp()));
                        },
                        child: Text(" Create Account", style:GoogleFonts.workSans(color: Colors.blue, fontSize: 17, ),))
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
