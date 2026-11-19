import 'package:flutter/material.dart';

import 'app/constructly_app.dart';
import 'core/firebase/firebase_bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseBootstrap.initialize();
  runApp(const ConstructlyApp());
}
