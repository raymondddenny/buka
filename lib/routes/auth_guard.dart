// import 'dart:js';

// import 'package:auto_route/auto_route.dart';
// import 'package:bukalapak_test/controller/auth_provider.dart';
// import 'package:bukalapak_test/routes/routes.gr.dart';
// import 'package:bukalapak_test/ui/pages/login_page/login_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           resolver.next(true);
//         } else {
//           router.push(const LoginRoute());
//         }
//         // return Container();
//       },
//     );
//   }
// }
