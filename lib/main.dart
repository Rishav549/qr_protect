import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_protect/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:qr_protect/routes/mainPage.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> AuthenticationBloc()..add(AuthenticationLoggedInEvent()),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MainPage(),
      ),
    );
  }
}
