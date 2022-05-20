import 'package:codingexercise/src/core/core.dart';
import 'package:codingexercise/src/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Injector _injector;

  @override
  void initState() {
    super.initState();
    _injector = DefaultInjector();
    _injector.initialize();
  }

  @override
  void dispose() {
    _injector.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: _injector.isInitialized(),
      stream: _injector.initializationStream,
      builder: (context, snapshot) {
        Widget result;

        if (snapshot.data == true) {
          result = Provider<Injector>.value(
            value: _injector,
            child: const HomeScreen(),
          );
        } else {
          result = const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'URL Shortener',
          home: result,
        );
      },
    );
  }
}
