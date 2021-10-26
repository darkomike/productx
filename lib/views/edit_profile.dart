import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  String _nationality = "Ghana";
  String _bloodType = "O";
  String _countryCode = "233";
  DateTime? birthDate;
  final _formKey = GlobalKey<FormState>();
  final _bloodTypes = ["A", "AB", "B", "O"];


  TextEditingController _fisrtnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController(text: "");







  @override
  void initState() {
    // TODO: implement initState
    _nationalityController.text = _nationality;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Profile",
            style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextField(
                controller: _fisrtnameController,
                labelText: "Firstname",
                hintText: "Firstname",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              CustomTextField(
                labelText: "Lastname",
                controller: _lastnameController,
                hintText: "Lastname",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              CustomTextField(
                labelText: "Email",
                controller: _emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          showCountryPicker(
                              showPhoneCode: true,
                              context: context,
                              onSelect: (country) {
                                setState(() {
                                  _countryCode = country.phoneCode;
                                });
                              });
                        },
                        child: Chip(
                            elevation: 2,
                            backgroundColor: Colors.indigo[400],
                            label: Text(
                              "+ " + _countryCode,
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )),
                      )),
                  Expanded(
                    flex: 6,
                    child: CustomTextField(
                      labelText: "Phone",
                      controller: _phoneController,
                      hintText: "Phone",
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Date of Birth",
                controller: _birthDateController,
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now())
                      .then((date) {
                    print(date);
                    _birthDateController.text =
                        DateFormat(DateFormat.YEAR_MONTH_WEEKDAY_DAY)
                            .format(date!);
                    setState(() {
                      birthDate = date;
                    });
                  });
                },
                readOnly: true,
                hintText: "Date of birth",
                textInputAction: TextInputAction.next,
                suffixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.indigo[300],
                ),
              ),
              CustomTextField(
                labelText: "Country of origin",
                controller: _nationalityController,
                onTap: () {
                  showCountryPicker(
                      context: context,
                      onSelect: (country) {
                        print(country.name);
                        setState(() {
                          _nationalityController.text = country.name;
                        });
                      });
                },
                readOnly: true,
                hintText: "Country Of Origin",
                textInputAction: TextInputAction.next,
                suffixIcon: Icon(
                  Icons.flag,
                  color: Colors.indigo[300],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Blood Type : ",
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal)),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                        value: _bloodType,
                        onChanged: (String? newValue) {
                          setState(() {
                            _bloodType = newValue!;
                          });
                        },
                        items: _bloodTypes.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: GoogleFonts.nunito(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          );
                        }).toList()),
                  ],
                ),
              ),
              Container(
                  height: 55,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton.icon(
                      icon: Icon(Icons.done),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Colors.indigo[300],
                      ),
                      onPressed: () {
                        //TODO: Complete Profile button
                      },
                      label: Text("Update Profile",
                          style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)))),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    TextEditingController? controller,
    required String hintText,
    required String labelText,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool readOnly = false,
    Widget? suffixIcon,
    Widget? prefix,
    var onTap,
  })  : _controller = controller,
        _labelText = labelText,
        _hintText = hintText,
        _keyboardType = keyboardType,
        _suffixIcon = suffixIcon,
        _prefix = prefix,
        _onTap = onTap,
        _readOnly = readOnly,
        _textInputAction = textInputAction,
        super(key: key);

  final _controller;
  final String _hintText;
  final String _labelText;
  final _keyboardType;
  final _textInputAction;
  final Widget? _suffixIcon;
  final Widget? _prefix;
  final _onTap;
  final _readOnly;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      child: TextFormField(
        onTap: _onTap,
        textInputAction: _textInputAction,
        keyboardType: _keyboardType,
        controller: _controller,
        cursorColor: Colors.indigo[300],
        readOnly: _readOnly,

        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          prefix:_prefix,
          labelStyle: GoogleFonts.nunito(
              color: Colors.indigo[500],
              fontSize: 18,
              ),
          labelText: _labelText,
          // prefix: _prefix,
          suffixIcon: _suffixIcon,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: Colors.indigo, width: 2.0, style: BorderStyle.solid),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: Colors.black, width: 5.0, style: BorderStyle.solid),
          ),
          hintText: _hintText,
        ),
      ),
    );
  }
}
