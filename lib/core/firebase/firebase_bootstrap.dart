import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';

/// Initializes Firebase after `flutterfire configure` has generated the
/// platform-specific configuration files for the selected Firebase project.
class FirebaseBootstrap {
  const FirebaseBootstrap._();

  static Future<FirebaseApp> initialize() {
    return Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
