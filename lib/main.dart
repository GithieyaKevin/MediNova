import 'package:flutter/material.dart';

void main() {
  runApp(MediNovaApp());
}

class MediNovaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediNova',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Helvetica',
      ),
      home: MediNovaHomePage(),
    );
  }
}

class MediNovaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // No top AppBar
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MediNova',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[900],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue[100],
                      child: Icon(Icons.person, color: Colors.blue[900]),
                    )
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'Hello,\nWelcome to MediNova!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),

                // TeleHealth ChatBot
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/DoctorAvatar.png',
                        height: 100,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TeleHealth ChatBot',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Ask health questions to our AI chatbot',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Buttons
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    MenuButton(
                      icon: Icons.medication,
                      label: 'Medication Reminder',
                      color: Colors.green[50],
                      iconColor: Colors.green[700],
                    ),
                    MenuButton(
                      icon: Icons.menu_book,
                      label: 'Health Library',
                      color: Colors.blue[100],
                      iconColor: Colors.blue[700],
                    ),
                    MenuButton(
                      icon: Icons.local_hospital,
                      label: 'Emergency',
                      color: Colors.blueGrey[700],
                      iconColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    MenuButton(
                      icon: Icons.location_on,
                      label: 'Find Facilities',
                      color: Colors.blueGrey[700],
                      iconColor: Colors.white,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Health Tips
                Text(
                  'Health Tips',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.apple, size: 40, color: Colors.blue[400]),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Eat a Balanced Diet',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Maintain a diet rich in fruits and vegetables.',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart), label: 'Health'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final Color? iconColor;
  final Color? textColor;

  const MenuButton({
    required this.icon,
    required this.label,
    this.color,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: iconColor ?? Colors.black),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.2,
              textBaseline: TextBaseline.alphabetic,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
