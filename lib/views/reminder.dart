import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productx/models/reminderModel.dart';
import 'package:productx/views/edit_profile.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: "MY REMINDERS",
    ),
    Tab(
      text: "SET REMINDER",
    )
  ];

  late TabController _tabController;
  int _defaultTitle = 0;

  List  reminders = [
    {
      "user": "Micheal",
      "dueDate": "10-11-2021",
      "progress": 0.33
    },
    {
      "user": "Wilhelmina",
      "dueDate": "20-11-2021",
      "progress": 0.5
    },
    {
      "user": "Bismark",
      "dueDate": "20-11-2021",
      "progress": 0.9
    }, {
      "user": "Kofi Manu Sefa Yeboah",
      "dueDate": "20-12-2021",
      "progress": 0.1
    }
  ];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(_defaultTitle == 0 ? "MY REMINDERS" : "SET REMINDER", style: GoogleFonts.nunito(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold)),
          bottom: TabBar(
            indicatorColor: Colors.indigo,
            isScrollable: false,
            dragStartBehavior: DragStartBehavior.start,

            onTap: (value) {
              setState(() {
                _defaultTitle = value;
              });
            },

            labelStyle:  GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.bold),labelColor: Colors.black, indicatorWeight: 3,
            tabs: myTabs,
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,

          physics: ScrollPhysics(),
          children: [
            buildMyReminders(),
            SetReminder()
          ],
        ));
  }

  Container buildMyReminders() {
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: RefreshIndicator(
              onRefresh: onPageRefresh,
              child: ListView.separated(itemBuilder: (context, index) {

                ReminderModel reminder = ReminderModel.fromMap(reminders[index]);

                return MyReminderCard(reminder: reminder);
              }, separatorBuilder: (context, index){
                return Divider(height: 0.1,);
              }, itemCount: reminders.length)

              ,
            ),
          );
  }

 Future onPageRefresh()async {
//TODO: Refresh my reminders
}
}

class SetReminder extends StatelessWidget {
  const SetReminder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView(
        children: [
          CustomTextField(hintText: "Name of Drug", labelText: "Name of Drug"),
          CustomTextField(hintText: "Pharmacy", labelText: "Pharmacy"),
          CustomTextField(hintText: "Set data", labelText: "Set Data"),
          CustomTextField(hintText: "Description", labelText: "Description"),


          Container(
              height: 55,
              width: 200,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ElevatedButton.icon(
                
                  icon: Icon(Icons.save),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromWidth(200),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.indigo[300],
                  ),
                  onPressed: () {
                    //TODO: Complete Profile button
                  },
                  label: Text("Save",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)))),

        ],
      ),
    );
  }
}

class MyReminderCard extends StatelessWidget {
  const MyReminderCard({
    Key? key,
    required this.reminder,
  }) : super(key: key);

  final ReminderModel reminder;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                        color: Colors.red,
                        value: reminder.progress,
                  ),
                ),
                Text("${reminder.progress * 100} " + "%", style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.bold),)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Due on ${reminder.dueDate}", style: GoogleFonts.nunito(fontSize: 16), )
                ,Text("${reminder.user}", style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.bold), )
              ],
            )
          ],
        ),
      ),
    );
  }
}




