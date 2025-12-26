import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Report Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
