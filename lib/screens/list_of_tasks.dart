import 'package:flutter/material.dart';
import 'package:todoey_flutter/components/animated_clock.dart';
import 'package:todoey_flutter/components/animated_text.dart';
import 'package:todoey_flutter/components/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

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
                children: <Widget>[],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Provider.of<TaskData>(context, listen: true).taskCount <= 0
                ? Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Center(
                          child: NoTasksAnimatedText(),
                        ),
                      ),
                      AnimatedClock(),
                    ],
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
