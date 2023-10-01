import 'package:dentalcavity/utils/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DentalDrawer extends StatelessWidget {
  final String username;
  final String avatarUrl;

  const DentalDrawer({
    required this.username,
    required this.avatarUrl,
  });

   Future<void> onLogOut(context) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setBool('isLoggedIn', false);
     showToast("Logged Out");
     Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
   }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(username),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Main Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/main');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap:  () async {
              onLogOut(context);
            }
    ),
    ],
    )

    );
  }
}
