import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_onaisa/bloc/blocobserver.dart';
import 'package:task_onaisa/bloc/getdata_bloc.dart';
import 'package:task_onaisa/service/diosevice.dart';

import 'package:task_onaisa/service/services.dart';
import 'package:task_onaisa/ui/pages/first_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioService.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}
