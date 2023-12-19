// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mijo/provider/user_provider.dart';
import 'package:mijo/widgets/custom_side_drawer.dart';
import 'package:mijo/models/user_model.dart' as user;
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);
  static const String route = '/profile';

  
  @override
Widget build(BuildContext context) {
  final UserProvider userProvider = Provider.of<UserProvider>(
    context,
    listen: false,
  );

  final user.User? loggedUser = userProvider.loggedUser;

  return Scaffold(
    appBar: AppBar(
      title: const DefaultTextStyle(
        style: TextStyle(color: Colors.black, fontSize: 30, fontStyle: FontStyle.normal),
        child: Text("Profile"),
      ),
    ),
    drawer: const CustomSideDrawer(),
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              'Username:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              loggedUser?.username ?? "John Doe",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              loggedUser?.email ?? 'johndoe@example.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'UserType:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              loggedUser?.userType ?? 'No UserType',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

}