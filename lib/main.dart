import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fxfjpgembctxczacvzyp.supabase.co',
    publishableKey: 'sb_publishable_lEi6HRFjhv4GZVFKocONUg_bYUW6sDE',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
 