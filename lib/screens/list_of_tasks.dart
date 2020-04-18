import 'package:flutter/material.dart';
import 'package:todoey_flutter/components/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ListOfTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 60.0,
            left: 30.0,
            right: 30.0,
            bottom: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // MaterialButton(
                  //     shape: CircleBorder(),
                  //     height: 50.0,
                  //     color: Colors.white,
                  //     elevation: 5.0,
                  //     child: Icon(
                  //       Icons.add,
                  //       size: 40.0,
                  //       color: Colors.lightBlueAccent,
                  //     ),
                  //     onPressed: () {
                  //       showModalBottomSheet(
                  //         context: context,
                  //         isScrollControlled: true,
                  //         builder: (context) => SingleChildScrollView(
                  //           child: Container(
                  //             padding: EdgeInsets.only(
                  //                 bottom: MediaQuery.of(context)
                  //                     .viewInsets
                  //                     .bottom),
                  //             child: AddTaskScreen(),
                  //           ),
                  //         ),
                  //       );
                  //     }),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Provider.of<TaskData>(context, listen: true).taskCount <= 0
                ? Container(
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: TyperAnimatedTextKit(
                        speed: Duration(milliseconds: 30),
                        isRepeatingAnimation: false,
                        text: [
                          'All tasks completed! Add a new task by tapping on the + sign'
                        ],
                        textAlign: TextAlign.center,
                        textStyle:
                            TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                    ),
                  )
                : TasksList(),
            decoration: BoxDecoration(
              color: Color(0xFF222831),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
