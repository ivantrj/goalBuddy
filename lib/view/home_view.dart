import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_buddy_riverpod/data/goal.dart';
import 'package:goal_buddy_riverpod/widgets/goal_card.dart';

class HomeView extends StatelessWidget {
  final goals = [Goal(name: "test", description: "description", color: Colors.purple)];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Goal Tracky'),
        trailing: CupertinoButton(
          onPressed: () {
            context.go('/add_goal');
          },
          child: Icon(Icons.add),
        ),
      ),
      child: ListView.builder(
        itemCount: goals.length,
        itemBuilder: (context, index) {
          final goal = goals[index];
          return GoalCard(goal: goal);
        },
      ),
    );
  }
}
