import 'package:flutter/material.dart';
import 'package:flutter_objectbox_state/database/objectbox.dart';
import 'package:flutter_objectbox_state/screens/my_home_page.dart';
import 'package:flutter_objectbox_state/statemanagement/data_controller.dart';
import 'package:provider/provider.dart';

/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectBox;

Future<void> main() async {
  // This is required so ObjectBox can get the application directory to store the database in.
  WidgetsFlutterBinding.ensureInitialized();

  objectBox = await ObjectBox.create();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
