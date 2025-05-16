import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'task_view.dart';
import 'note_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merged App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF2196f3),
        canvasColor: Color(0xFFfafafa),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigateToTaskView() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => TaskView()));
  }

  void _navigateToNoteView() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => NoteView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Hello, User
            Text(
              "Hello, User",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),

            // Weather API Placeholder
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                "Weather API Placeholder",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 50),

            // Task & Expense Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _navigateToTaskView,
                    child: Text("Task Manager", style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {}, // You can add expense screen later
                    child: Text("Expense Manager", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Notes & Fitness Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _navigateToNoteView,
                    child: Text("Notes", style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {}, // You can add fitness screen later
                    child: Text("Fitness", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
            Spacer(),

            // AI Chat button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {}, // You can link AI Chat later
                child: Text("AI Chat", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
