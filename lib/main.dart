import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/cubit_logics.dart';
import 'package:travel_app/cubit/cubits.dart';
import 'package:travel_app/services/data_services.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(dataServices: DataServices()),
        child: const AppCubitLogics(),
      ),
    );
  }
}
