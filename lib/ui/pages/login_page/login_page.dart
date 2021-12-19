import 'package:auto_route/auto_route.dart';
import 'package:bukalapak_test/controller/auth_provider.dart';
import 'package:bukalapak_test/routes/routes.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            AutoRouter.of(context);

            if (snapshot.hasData) {
              context.navigateTo(const HomeRoute());
              return Container();
            } else {
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final authProvider = Provider.of<AuthProvider>(context, listen: false);
                        await authProvider.googleLogin();
                      },
                      child: Text('Sign with Google'),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
