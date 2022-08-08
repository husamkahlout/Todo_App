
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Todo_provider/views/screens/root_screen.dart';
import 'Todo_provider/data/db_helper.dart';
import 'Todo_provider/providers/db_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbhelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DbProvider>(create: (context) => DbProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainTodoPage(),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(Provider.of<Student>(context).name),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//               onPressed: () {
                   // listen : false , when send data to provider
//                 Provider.of<Student>(context, listen: false).changeName("omar");
//               },
//               child: Text("Change Name")),
//         ],
//       )),
//     );
//   }
// }
