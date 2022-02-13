import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  DateTime? _date = DateTime.now();
  String taskName = "";
  TextEditingController dateController = TextEditingController();
  String repetitionFrequency = "No Repeat";
  List<String> Options = [
    "No Repeat",
    "Once a Day",
    "Once a Day(Mon-Fri)",
    "Once a Week",
    "Once a Month",
    "Once a Year",
    "Other",
  ];

  List<DropdownMenuItem<String>> dropDownItemCreator(List<String> itemValues) {
    List<DropdownMenuItem<String>> dropdownItemCreator = [];

    for (var i = 0; i < itemValues.length; i++) {
      dropdownItemCreator.add(
        DropdownMenuItem<String>(
            value: itemValues[i], child: Text(itemValues[i])),
      );
    }
    return dropdownItemCreator;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What is to be done",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(hintText: "Enter your task"),
                  )),
                  CustomIconButton(
                    iconData: Icons.mic,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                "Due date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(hintText: "Enter Date"),
                    readOnly: true,
                    controller: dateController,
                  )),
                  CustomIconButton(
                    iconData: Icons.calendar_today_outlined,
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: _date == null ? DateTime.now() : _date!,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050));
                      if (date != null) _date = date;
                      setState(() {});
                      var dateString =
                          DateFormat('EEEE, d MMM, yyyy ').format(date!);
                      dateController.text = dateString;
                    },
                  ),
                  Visibility(
                    visible: _date == null ? false : true,
                    child: CustomIconButton(
                        iconData: Icons.cancel,
                        onPressed: () {
                          _date = null;
                          setState(() {});
                          dateController.text = " ";
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(hintText: "Enter Date"),
                    readOnly: true,
                    controller: dateController,
                  )),
                  CustomIconButton(
                    iconData: Icons.calendar_today_outlined,
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: _date == null ? DateTime.now() : _date!,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050));
                      if (date != null) _date = date;
                      setState(() {});
                      var dateString =
                          DateFormat('EEEE, d MMM, yyyy ').format(date!);
                      dateController.text = dateString;
                    },
                  ),
                  Visibility(
                    visible: _date == null ? false : true,
                    child: CustomIconButton(
                        iconData: Icons.cancel,
                        onPressed: () {
                          _date = null;
                          setState(() {});
                          dateController.text = " ";
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Repeat",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                items: dropDownItemCreator(Options),
                value: repetitionFrequency,
                onChanged: (String? chosenValue) {
                  if (chosenValue != null) {
                    if (chosenValue != Options.last) {
                      //Here Option.last = "Other"
                      repetitionFrequency = chosenValue;
                      setState(() {});
                    } else {
                      AlertDialog alert = AlertDialog(
                        content: Text("Content"),
                        actions: [
                          TextButton(child: Text("Set"), onPressed: () {}),
                          TextButton(child: Text("Cancel"), onPressed: () {}),
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  IconData iconData;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 7),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
      ),
      child: Icon(iconData),
      onPressed: onPressed,
    );
  }
}
