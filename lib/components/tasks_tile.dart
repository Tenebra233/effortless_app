import 'package:flutter/material.dart';
import 'package:flare_checkbox/flare_checkbox.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function onDismissed;
  final Key key;
  final int hour;
  final int minute;
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.key,
      this.onDismissed,
      this.hour,
      this.minute});

  @override
  Widget build(BuildContext context) {
    bool isTimePicked = false;
    if (hour == null && minute == null) {
      isTimePicked = false;
    } else {
      isTimePicked = true;
    }
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Color(0xFF30475E),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), color: Colors.red),
          alignment: AlignmentDirectional.centerEnd,
          child: Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        key: key,
        onDismissed: onDismissed,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // padding: EdgeInsets.all(10.0),
                child: ListTile(
                  title: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: isChecked
                        ? TextStyle(
                            fontSize: 30.0,
                            color: Colors.white70,
                            decoration: TextDecoration.lineThrough,
                          )
                        : TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                    child: Row(
                      children: <Widget>[
                        FlareCheckbox(
                          animation: 'assets/checked.flr',
                          animationOn: 'on',
                          animationOff: 'off',
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          value: isChecked,
                          onChanged: checkboxCallback,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                taskTitle,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Visibility(
                                visible: isTimePicked,
                                child: Text(
                                  '${hour.toString()}:${minute.toString()}',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
