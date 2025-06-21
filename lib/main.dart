import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/services/get_it_service.dart';
import 'core/utils/app_keys.dart';
import 'features/home/ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Important

  // Initialize Supabase
  await Supabase.initialize(
    url: AppKeys.supabaseUrl,
    anonKey: AppKeys.supabaseAnonKey,
  );
  // Setup service locator
  ServiceLocator.setup();

  //
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  //
  runApp(const RashfaApp());
}

class RashfaApp extends StatelessWidget {
  const RashfaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF212325),
        fontFamily: "Marhey",
      ),
      home: const HomeScreen(),
    );
  }
}
