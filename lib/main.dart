import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async{
  await dotenv.load(); 
   WidgetsFlutterBinding.ensureInitialized();
   
    await Supabase.initialize(
    url: dotenv.get('url'),
    publishableKey: dotenv.get('publishableKey'),
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
 