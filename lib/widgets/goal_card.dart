import 'package:flutter/material.dart';
import 'package:goal_buddy_riverpod/data/goal.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;

  GoalCard({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            goal.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            goal.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          // Add more widgets to display goal tracking details (e.g., progress, date, etc.)
        ],
      ),
    );
  }
}
