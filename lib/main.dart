import 'dart:math';

import 'package:bloc_payload/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Builder(builder: (context) {
            return MaterialApp(
              title: 'Event Payload',
              theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
                  ? ThemeData.light()
                  : ThemeData.dark(),
              home: const MyHomePage(),
            );
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Change Theme',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            final int randInt = Random().nextInt(10);
            print('randInt: $randInt');
            context.read<ThemeBloc>().add(ChagneThemeEvent(randInt: randInt));
          },
        ),
      ),
    );
  }
}
