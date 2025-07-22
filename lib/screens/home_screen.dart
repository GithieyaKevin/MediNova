import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget buildCard(IconData icon, String title, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.white),
            SizedBox(height: 8),
            Text(title,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MediNova',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                      )),
                  CircleAvatar(
                    backgroundColor: Colors.teal[100],
                    child: Icon(Icons.person, color: Colors.teal[800]),
                  )
                ],
              ),
              SizedBox(height: 16),
              Text('Hello,\nWelcome to MediNova!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 24),

              // Grid Buttons
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildCard(Icons.chat_bubble, 'ChatBot', Colors.teal, () {}),
                  buildCard(Icons.notifications, 'Reminders', Colors.teal.shade400, () {}),
                  buildCard(Icons.local_hospital, 'Emergency', Colors.blueGrey, () {}),
                  buildCard(Icons.location_on, 'Facilities', Colors.indigo, () {}),
                ],
              ),

              SizedBox(height: 24),
              Text('Health Tips', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.apple, size: 40, color: Colors.blue),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Eat a Balanced Diet',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(height: 4),
                          Text('Maintain a diet rich in fruits and vegetables.',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
