import 'package:bloc_pattern_example/product/app/app_bloc_providers.dart';
import 'package:bloc_pattern_example/product/app/app_dependency_injection.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetItLocators();
  runApp(const AppBlocProviders());
}
