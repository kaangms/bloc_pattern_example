import 'package:auto_route/auto_route.dart';
import 'package:bloc_pattern_example/features/user/view/user_view.dart';
import 'package:bloc_pattern_example/product/app/app_bloc_providers.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppBlocProviders());
}
