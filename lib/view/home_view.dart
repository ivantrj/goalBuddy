import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_buddy_riverpod/viewmodel/home_viewmodel.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Goal Tracky'),
        trailing: CupertinoButton(
          onPressed: () {
            context.go('/add_goal');
          },
          child: const Icon(Icons.add),
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
                    child: const Icon(Icons.delete),
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
