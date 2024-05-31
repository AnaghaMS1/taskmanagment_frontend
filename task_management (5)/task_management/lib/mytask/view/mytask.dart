import 'package:flutter/material.dart';
import 'package:task_management/allocated_task/view/allocated_task.dart';
import 'package:task_management/completed_task/view/completed_task.dart';
import 'package:task_management/started_task/view/started_task.dart';

class Task {
  final String taskId;
  final String dueDate;
  final String taskName;
  final int progress;
  final String avatar;
  final String status;
  final String assignedBy;
  final String department;
  final String note;

  Task({
    required this.taskId,
    required this.dueDate,
    required this.taskName,
    required this.progress,
    required this.status,
    required this.avatar,
    required this.assignedBy,
    required this.department,
    required this.note,
  });
}

class MyTask extends StatefulWidget {
  const MyTask({super.key});

  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF186565),
      appBar: AppBar(
        title: const Text(
          'My Task',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF186565),
      ),
      body: const DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Ongoing',
                ),
                Tab(
                  text: 'Completed',
                ),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllocatedTaskCard(),
                  StartedTaskCard(),
                  CompletedTaskCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Side
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    task.taskId,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(task.dueDate),
                  const SizedBox(height: 8),
                  Text(task.taskName),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(task.avatar),
                      ),
                      Column(
                        children: [
                          Text(task.assignedBy),
                          Text(task.department),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Note: ${task.note}',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0), // Spacing between left and right sides
            // Right Side
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularProgressIndicator(
                    value: task.progress / 100,
                    backgroundColor: Colors.grey,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.teal),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${task.progress}%', // Convert progress to string
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    task.status,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

