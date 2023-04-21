import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon/bloc/pokemon_event.dart';
import 'package:pokemon/screens/home_screen.dart';
import 'package:pokemon/screens/splashing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Splash(),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => PokemonBloc()..add(PokemonPageRequest(page: 0  )))
      ], child:  HomePage() ,),
      routes: {
        HomePage.routName:(context) =>  HomePage(),
      },
    );
  }
}

