import 'package:flutter/material.dart';
import 'package:todo_app/Features/Home/presentation/views/tabs/list/list_tab.dart';
import 'package:todo_app/Features/Home/presentation/views/tabs/settings/settings_tab.dart';
import 'package:todo_app/Features/Home/presentation/views/widgets/add_button_sheet/add_buttonsheet.dart';
import 'package:todo_app/core/themes/color/color_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  List<Widget> tabs=[
    ListTab(),
    SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
      ),
      bottomNavigationBar:buildBottomNavigation(),
      floatingActionButton: buildFloatingActionBottom(context),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      body: tabs[currentIndex],
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
