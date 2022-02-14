import 'package:flutter/material.dart';
import '../dataModel/sqlite.dart';
import '../task.dart';
import 'routing.dart' as routing;
import 'new_task_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Task>?> taskList = SQliteDB.getAllTasks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 35),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return NewTaskScreen(); //name of stateful widget in new_task_screen. Then only it will work.
              }),
            );
            //Navigator.pushNamed(context, newTaskScreenID);  // it is doing the same thing taking user to new screen with the help of routing.dart file.
          },
        ),
        appBar: AppBar(
          title: Text("Todo"),
        ),
        body: FutureBuilder<List<Task>?>(
          future: taskList,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              List<Widget> children = [];
              for (var task in data) {
                children.add(ActivityCard(
                    header: task.taskName,
                    date: task.deadlineDate.toString(),
                    list: task.taskListId));
              }
              return ListView(
                padding: const EdgeInsets.all(5),
                children: children,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    required this.header,
    required this.date,
    required this.list,
    Key? key,
  }) : super(key: key);

  final String header, date, list;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                onChanged: (value) {},
                value: false,
              ),
            ),
            Container(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(date),
                Text(list),
              ],
            ),
          ],
        ),
      ),
      color: Colors.yellow,
    );
  }
}
