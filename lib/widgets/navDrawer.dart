import 'package:cafastrolab/screens/institute.dart';
import 'package:cafastrolab/screens/profile.dart';
import 'package:cafastrolab/screens/setting.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  final String accountName;

  NavDrawer({required this.accountName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(accountName),
            accountEmail: null, // You can add an email address here if needed
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 50.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Institution List'),
            onTap: () {
              // Navigate to the institution list screen
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstituteListScreen()),
              );
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to the settings screen
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              // Implement logout functionality here
            },
          ),
          ListTile(
            leading: Icon(Icons.comment),
            title: Text('Comment My App'),
            onTap: () {
              // Navigate to the comment screen
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              // Navigate to the about us screen
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
        ],
      ),
    );
  }
}
