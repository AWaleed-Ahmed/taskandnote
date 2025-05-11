import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task {
  String title;
  String description;
  String date;
  String time;

  Task({required this.title, required this.description, required this.date, required this.time});

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'date': date,
    'time': time,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    title: json['title'],
    description: json['description'],
    date: json['date'],
    time: json['time'],
  );
}

class TaskTaker extends StatefulWidget {
  @override
  _TaskTakerState createState() => _TaskTakerState();
}

class _TaskTakerState extends State<TaskTaker> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  Future<void> _saveTask() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getStringList('tasks') ?? [];

    final newTask = Task(
      title: _titleController.text,
      description: _descriptionController.text,
      date: _dateController.text,
      time: _timeController.text,
    );

    tasksJson.add(jsonEncode(newTask.toJson()));
    await prefs.setStringList('tasks', tasksJson);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task saved!')));
    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _timeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Taker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: _descriptionController, decoration: InputDecoration(labelText: 'Description')),
            TextField(controller: _dateController, decoration: InputDecoration(labelText: 'Date')),
            TextField(controller: _timeController, decoration: InputDecoration(labelText: 'Time')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveTask, child: Text('Save Task')),
          ],
        ),
      ),
    );
  }
}
