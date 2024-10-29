import 'package:chengdu80_prototype/app.dart';
import 'package:chengdu80_prototype/josh/form/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xyrvwphnfthdormbfqzz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5cnZ3cGhuZnRoZG9ybWJmcXp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzAwNTM0NjksImV4cCI6MjA0NTYyOTQ2OX0.Q-zQI57u_O0OsUE-R_nhhGqHTsl5fdk5wN3MMmKTsz4',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormProv(),
      child: const MaterialApp(
        home: Scaffold(
          body: MyApp(),
        ),
      ),
    );
  }
}
