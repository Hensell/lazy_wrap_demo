import 'package:flutter/material.dart';

import 'app/app.dart';
import 'shared/preferences/ui_preferences_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferencesController = UiPreferencesController();
  await preferencesController.load();
  runApp(LazyWrapDemoApp(preferencesController: preferencesController));
}
