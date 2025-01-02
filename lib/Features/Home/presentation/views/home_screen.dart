import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Features/Auth/login_view.dart';
import 'package:todo_app/Features/Home/presentation/views/tabs/list/list_tab.dart';
import 'package:todo_app/Features/Home/presentation/views/tabs/settings/settings_tab.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/add_button_sheet/add_buttonsheet.dart';
import 'package:todo_app/core/themes/color/color_app.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home';
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate=DateTime.now();

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:buildBottomNavigation(),
      floatingActionButton: buildFloatingActionBottom(context),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      body:Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children:[ AppBar(
              title: const Text("To Do List"),
              actions: [
                IconButton(onPressed: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route)=>false);
                },
                    icon:Icon(Icons.logout,))
              ],
            ),
              Visibility(
                visible:  currentIndex==0,
                child: Positioned(
                  bottom: -40,
                    left: 0,
                    right: 0,
                    child: EasyInfiniteDateTimeLine(
                      showTimelineHeader: false,
                        dayProps: EasyDayProps(
                          width: 58,
                          height: 79,
                          todayStyle: DayStyle(

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:BorderRadius.circular(15) ,
                              )),
                          inactiveDayStyle: DayStyle(

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:BorderRadius.circular(15) ,
                            )
                          )
                        ),
                        firstDate: DateTime.now(),
                        focusDate: selectedDate,
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      onDateChange: (newDate){
                          setState(() {
                            selectedDate=newDate;
                          });
                      },
                    )),
              )


            ]
          ),
          Expanded(child: currentIndex==0?ListTab(selectedDate):SettingsTab())
        ],
      ) ,
    );
  }

  Widget buildBottomNavigation() => BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 10,
    clipBehavior: Clip.hardEdge,
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (tappedIndex){
        currentIndex=tappedIndex;
        setState(() {

        });
      },

      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings"
        ),
      ],

    ),
  );

  Widget buildFloatingActionBottom(BuildContext context) => FloatingActionButton(

      shape: StadiumBorder(side: BorderSide(color: Colors.white,width: 4)
      ),
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add,size: 30,color: ColorApp.white,),

      onPressed: (){
        AddButtonsheet.show(context);
      }
  );
}
