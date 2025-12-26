import 'package:flutter/material.dart';
import 'project_model.dart';
import 'projects/01_login_screen_ui/main_login.dart';
import 'projects/02_banking_app_ui/main_banking_app.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<ProjectModel> projects = [
    ProjectModel(
      title: 'Login Page',
      description: 'Test sen bro',
      builder: (context) => LoginPage(),
    ),
    ProjectModel(
      title: 'Banking App UI',
      description: 'Test sen bro',
      builder: (context) => BankingApp(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Flutter UI Projects'))),
      body: SafeArea(
        // Use your list here
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(projects[index].title),
              subtitle: Text(projects[index].description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: projects[index].builder),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
