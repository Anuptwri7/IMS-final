import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MainPage/main_page.dart';
import 'Notification/controller/notificationController.dart';
import 'contoller/selectItem_Controller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NotificationClass>(
          create: (_) => NotificationClass()),
      ChangeNotifierProvider<SelectItem>(create: (_) => SelectItem()),
    ],
    child: const MyApp(),
  ));
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soori LMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
