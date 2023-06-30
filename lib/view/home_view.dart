import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_buddy_riverpod/data/goal.dart';
import 'package:goal_buddy_riverpod/viewmodel/home_viewmodel.dart';
import 'package:goal_buddy_riverpod/widgets/goal_card.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      child: Consumer(
        builder: (context, watch, _) {
          final viewModel = ref.watch(homeScreenViewModelProvider);
          final goals = viewModel.goals;

          return ListView.builder(
            itemCount: goals.length,
            itemBuilder: (context, index) {
              final goal = goals[index];

              return Card(
                elevation: 3,
                child: CupertinoListTile(
                  title: Text(goal.name),
                  subtitle: Text(goal.description),
                  trailing: CupertinoButton(
                    child: Icon(Icons.delete),
                    onPressed: () {
                      viewModel.deleteGoal(goal);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
