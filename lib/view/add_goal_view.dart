import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_buddy_riverpod/viewmodel/add_goal_viewmodel.dart';

class AddGoalView extends ConsumerStatefulWidget {
  const AddGoalView({super.key});

  @override
  _AddGoalViewState createState() => _AddGoalViewState();
}

class _AddGoalViewState extends ConsumerState<AddGoalView> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  Color _selectedColor = Colors.blue; // Default color

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(addGoalViewModelProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Add a new goal'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoTextField(
                controller: _nameController,
                placeholder: "Goal Name",
                padding: const EdgeInsets.all(12),
              ),
              const SizedBox(height: 16),
              CupertinoTextField(
                controller: _descriptionController,
                placeholder: "Description",
                padding: const EdgeInsets.all(12),
              ),
              const SizedBox(height: 16),
              const Center(
                  child: Text(
                'Select Goal Color:',
                style: TextStyle(fontSize: 20),
              )),
              const SizedBox(height: 8),
              Center(
                child: Wrap(
                  children: [
                    _buildColorPickerItem(Colors.red),
                    _buildColorPickerItem(Colors.green),
                    _buildColorPickerItem(Colors.blue),
                    _buildColorPickerItem(Colors.purple),
                    _buildColorPickerItem(Colors.yellow),
                    _buildColorPickerItem(Colors.orange),
                    _buildColorPickerItem(Colors.pink),
                    // Add more color picker items as needed
                  ],
                ),
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                onPressed: () {
                  viewModel.saveGoal(_nameController.toString(), _descriptionController.toString(), _selectedColor);
                },
                child: const Text('Add Goal'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorPickerItem(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectedColor == color ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
