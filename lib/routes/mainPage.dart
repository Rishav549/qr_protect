import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_protect/routes/details.dart';
import 'package:qr_protect/routes/login.dart';

import '../bloc/authentication_bloc/authentication_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationErrorState) {
          Fluttertoast.showToast(msg: state.error.message);
        } else if(state is AuthenticationLoggedOutState){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const Login();
          }));
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoadingState) {
          const Center(child: CircularProgressIndicator());
        }
        if (state is AuthenticationLoggedInState) {
          return const Details();
        }
        if(state is AuthenticationLoggedOutState){
          return const Login();
        }
        return const Login();
      },
    );
  }
}
