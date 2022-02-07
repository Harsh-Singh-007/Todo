import 'package:flutter/material.dart';
import 'package:todo/screens/new_task_screen.dart';
import 'screens/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      /*routes: {
        newTaskScreenID: (context) {
          return const NewTaskScreen();
        },
      },*/ //used for changing screen with the help with Navigator.push on line 46. and with the routing.dart file.
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 35),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const NewTaskScreen(); //name of stateful widget in new_task_screen. Then only it will work.
            }),
          );
          //Navigator.pushNamed(context, newTaskScreenID);  // it is doing the same thing taking user to new screen with the help of routing.dart file.
        },
      ),
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: const [
          ActivityCard(header: "Pay fees", date: "3rd Jan", list: "Pay bills"),
          ActivityCard(header: "Pay bill", date: "4th Jan", list: "Pay bills"),
          ActivityCard(
              header: "Do recharge", date: "4th Jan", list: "Pay bills"),
          ActivityCard(header: "Wake up", date: "4th Jan", list: "Daily"),
          ActivityCard(header: "Wake up", date: "4th Jan", list: "Daily"),
          ActivityCard(header: "Wake up", date: "4th Jan", list: "Daily"),
          ActivityCard(header: "Wake up", date: "4th Jan", list: "Daily"),
          ActivityCard(header: "Wake up", date: "4th Jan", list: "Daily"),
          ActivityCard(header: "Wake up", date: "4th Jan", list: "Daily"),
          ActivityCard(header: "Wake up", date: "4th Jan", list: "Daily"),
        ],
      ),
    );
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
