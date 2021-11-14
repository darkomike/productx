import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productx/views/edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Profile",              style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 10),
                tooltip: "Edit Profile",
                onPressed: () {
                  //TODO: To edit page...
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CompleteProfile()));
                },
                icon: Icon(Icons.edit, color: Colors.indigo,))
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/cd.png"),
                ),
              ),
              SizedBox(height: 30,),
              buildCustomTextView(label: "Name", content: "Michael Kwaku Mensah"),
              buildCustomTextView(label: "Email", content: "example20030@gmail.com"),
              buildCustomTextView(label: "Password", content: "30@gmknd ail.com" , obscure: true),
              buildCustomTextView(label: "Phone", content: "+233 054 323 2111"),
            ],
          ),
        ));
  }

  Widget buildCustomTextView(
      {required String? label,
      required String? content,
      bool obscure = false}) {
    TextEditingController _controller = TextEditingController(text: content);
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$label : ",
              style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            flex: 5,
            child: TextField(

              readOnly: true,
              controller: _controller,
              obscureText: obscure,
              decoration: InputDecoration(border: InputBorder.none, ),
              style: GoogleFonts.nunito(fontSize: 20, textStyle: TextStyle(overflow: TextOverflow.ellipsis)  ),
            ),
          ),
        ],
      ),
    );
  }
}
