import 'package:ehospital/components/utilities.dart';
import 'package:flutter/material.dart';

class DrawerNew extends StatelessWidget {
  final String uName, uPhoto;
  final String uMobile;
  //int _selectedDestination = 0;
  const DrawerNew({
    super.key,
    required this.uName,
    required this.uPhoto,
    required this.uMobile,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 90,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 116,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: AppStyles.c1,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
