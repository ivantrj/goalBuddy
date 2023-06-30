import 'package:flutter/cupertino.dart';
import 'package:goal_buddy_riverpod/view/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
