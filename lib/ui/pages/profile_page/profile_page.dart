import 'package:bukalapak_test/controller/auth_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return FutureBuilder<DocumentSnapshot>(
        future: authProvider.getUserDoc(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: const Text("Something went wrong"));
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Center(child: const Text("Document does not exist"));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          data['photoUrl'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "${data['full_name']}",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Text("${data['email']}"),
                ],
              ),
            );
          }

          return Center(child: const Text("loading"));
        });
  }
}
