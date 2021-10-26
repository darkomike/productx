import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productx/views/edit_profile.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  final String wrod = "3456";

  @override
  Widget build(BuildContext context) {

    String imageUrl = "assets/vd.jpg";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0.0,
        title: Text("Settings", style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 20, fontWeight: FontWeight.bold
        )),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),


                child: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Text("", style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 20,
                  ),),
                  backgroundImage: AssetImage(imageUrl),
                  radius: 120,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomLisTile(title: "Complete Profile", elevation: 0, onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> CompleteProfile()));
                      },),

                      Divider(
                        height: 3,
                      ),
                      CustomLisTile(title: "Profile Settings",  elevation: 0, onTap: (){},),

                      Divider(
                        height: 3,
                      ), CustomLisTile(title: "Account Settings",  elevation: 0, onTap: (){},),

                      Divider(
                        height: 3,
                      ), CustomLisTile(title: "In-App Settings", elevation: 0, onTap: (){},),


                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    CustomLisTile(title: "About Us", elevation: 2, onTap: (){},),

                    CustomLisTile(title: "Help & Support", elevation: 2, onTap: (){},),

                    CustomLisTile(title: "example@email.com", elevation: 2, onTap: (){},),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomLisTile extends StatelessWidget {
  const CustomLisTile({
    Key? key,
    required this.title,
    required this.elevation,
    required this.onTap
  }) : super(key: key);

  final String title;
  final double elevation;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        child: Card(
          elevation: elevation,
          child: ListTile(

              onTap: onTap,
            title: Text(title,
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 20,
                )),
          ),
        ),
      ),
    );
  }
}
