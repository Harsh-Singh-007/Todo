import 'package:flutter/material.dart';
import 'package:todo/dataModel/sqlite.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/screens/new_task_screen.dart';
import 'screens/routing.dart' as routing;

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //native code for sql it is useful for path in sql
  SQliteDB.initDb();
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
      initialRoute: routing.homeScreenID,
      routes: {
        routing.newTaskScreenID: (context) => NewTaskScreen(),
        routing.homeScreenID: (context) => MyHomePage(),
      },
    );
  } //used for changing screen with the help with Navigator.push on line 46. and with the routing.dart file.
}
