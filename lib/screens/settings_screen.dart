import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Dark Mode'),
            trailing: Switch(value: false, onChanged: (v) {}),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy Policy'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About MediNova'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
