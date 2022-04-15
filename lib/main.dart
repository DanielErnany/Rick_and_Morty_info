import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty_info/providers/caracters_provider.dart';
import 'package:rick_and_morty_info/theme/app_theme.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CaractersProvider(),
      child: RefreshConfiguration(
        footerBuilder: () => CustomFooter(
          builder: (context, mode) {
            Widget? body;

            if (mode == LoadStatus.loading) {
              body = const CircularProgressIndicator();
            }
            if  (mode == LoadStatus.noMore ) {
              body = const Text("No more caracteres");
            }

            return Center(child: body);
          },
        ),
        child: MaterialApp(
          title: 'Rick and Morty info',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}


