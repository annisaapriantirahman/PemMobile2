import 'package:flutter/material.dart';

class SidebarMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sidebar Menu'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Sidebar Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Menu 1'),
              onTap: () {
                // Tambahkan logika untuk menu 1 di sini
              },
            ),
            ListTile(
              title: Text('Menu 2'),
              onTap: () {
                // Tambahkan logika untuk menu 2 di sini
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Sidebar Menu Page'),
      ),
    );
  }
}
