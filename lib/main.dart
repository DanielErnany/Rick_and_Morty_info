import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_info/providers/caracters_provider.dart';
import 'package:rick_and_morty_info/widgets/caracters_gridview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CaractersProvider(),
      child: MaterialApp(
        title: 'Rick and Morty info',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    final caractersProvider =
        Provider.of<CaractersProvider>(context, listen: false);
    caractersProvider.loadCaracters().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty info'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :const CaractersGridview(),
    );
  }
}
