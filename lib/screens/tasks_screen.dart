import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/menu.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'list_of_tasks.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  final _pageOptions = [
    ListOfTasks(),
    AddTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Color(0xFF222831),
            color: Color(0xFFececec),
            animationDuration: Duration(milliseconds: 300),
            items: <Widget>[
              Icon(Icons.list, size: 30),
              Icon(Icons.add, size: 30),
            ],
            onTap: (index) {
              Provider.of<MenuController>(context, listen: false).setPage =
                  index;
            },
          ),
          // appBar: AppBar(
          //   backgroundColor: Color(0xFF212121),
          //   title: Center(
          //     child: Text(
          //       'EFFORTLESS',
          //       style: TextStyle(
          //           color: Colors.white, fontSize: 50, letterSpacing: 5.0),
          //     ),
          //   ),
          // ),
          backgroundColor: Color(0xFF222831),
          body: _pageOptions[Provider.of<MenuController>(context).getPage]),
    );
  }
}
