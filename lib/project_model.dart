// lib/project_model.dart
import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String description;
  final WidgetBuilder builder;

  ProjectModel({
    required this.title,
    required this.description,
    required this.builder,
  });
}
