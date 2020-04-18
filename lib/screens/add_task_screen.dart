import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTaskScreen extends StatelessWidget {
  final nameHolder = TextEditingController();

  Widget displaySnackbar(IconData icon, Color color) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      duration: Duration(milliseconds: 1500),
      shape: CircleBorder(),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    int newHour;
    int newMinute;

    return Container(
      color: Color(0xFF222831),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xFF222831),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Something to do?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                  ),
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFF2A365))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFF2A365))),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Type it there',
                  ),
                  textAlign: TextAlign.center,
                  autofocus: true,
                  controller: nameHolder,
                  onChanged: (newText) {
                    newTaskTitle = newText;
                  },
                ),
                FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color(0xFFF2A365),
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                    color: Color(0xFFF2A365),
                    onPressed: () {
                      DatePicker.showTimePicker(context,
                          showTitleActions: true,
                          showSecondsColumn: false,
                          onChanged: (time) {}, onConfirm: (time) {
                        print('${time.hour}');
                        print('${time.minute}');
                        newHour = time.hour;
                        newMinute = time.minute;
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Pick time',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )),
                SizedBox(height: 20.0),
                Column(
                  children: <Widget>[
                    FlatButton(
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.add,
                        size: 100.0,
                      ),
                      color: Color(0xFFF2A365),
                      onPressed: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        //Spammando l'add button viene subito generato un nuovo snackbar
                        Scaffold.of(context).hideCurrentSnackBar();

                        //Se non controllo che sia isEmpty aggiunge comunque una task vuota
                        if (newTaskTitle == null || nameHolder.text.isEmpty) {
                          Scaffold.of(context).showSnackBar(
                              displaySnackbar(Icons.error_outline, Colors.red));
                          return '';
                        } else {
                          Scaffold.of(context).showSnackBar(
                              displaySnackbar(Icons.check, Colors.green));
                        }

                        Provider.of<TaskData>(context, listen: false).addTask(
                          newTaskTitle == null ? '' : newTaskTitle,
                          newHour,
                          newMinute,
                        );
                        Provider.of<TaskData>(context, listen: false)
                            .cleanInput(nameHolder);
                        newTaskTitle = null;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
