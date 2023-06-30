import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_buddy_riverpod/data/goal.dart';

final addGoalViewModelProvider = ChangeNotifierProvider<AddGoalViewModel>((ref) => AddGoalViewModel());

class AddGoalViewModel extends ChangeNotifier {
  Goal? _newGoal;

  Goal? get newGoal => _newGoal;

  void saveGoal(String name, String description, Color color) {
    final Goal goal = Goal(
      name: name,
      description: description,
      color: color,
    );

    // TODO: Save the goal to local storage or perform any other necessary actions

    _newGoal = goal;
    notifyListeners();
  }

  void deleteGoal() {
    _newGoal = null;
    notifyListeners();
  }
}
