import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_buddy_riverpod/data/goal.dart';

final homeScreenViewModelProvider = ChangeNotifierProvider<HomeScreenViewModel>((ref) => HomeScreenViewModel());

class HomeScreenViewModel extends ChangeNotifier {
  List<Goal> _goals = [
    Goal(name: 'Goal 1', description: 'This is goal 1', color: Colors.red),
    Goal(name: 'Goal 2', description: 'This is goal 2', color: Colors.blue),
    Goal(name: 'Goal 3', description: 'This is goal 3', color: Colors.green),
  ];

  List<Goal> get goals => _goals;

  void deleteGoal(Goal goal) {
    _goals.remove(goal);
    notifyListeners();
  }
}
