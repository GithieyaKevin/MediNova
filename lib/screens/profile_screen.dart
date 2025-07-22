import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> patientInfo = {
    'name': 'John Doe',
    'age': 42,
    'gender': 'Male',
    'bloodType': 'O+',
    'email': 'john.doe@example.com',
    'phone': '+1 555 123 4567',
    'address': '123 Health Ave, Wellness City',
    'history': [
      'Hypertension (Diagnosed: 2015)',
      'Type 2 Diabetes (Diagnosed: 2018)',
      'Recovered from COVID-19 (2021)'
    ],
    'medications': [
      'Metformin 500mg twice daily',
      'Lisinopril 10mg once daily'
    ],
    'appointments': [
      'Cardiology - Jan 15, 2023',
      'Endocrinology - Feb 28, 2023',
      'General Checkup - July 1, 2023'
    ],
  };

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text("• $item", style: const TextStyle(fontSize: 16)),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patient Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/doctor_avatar.png'),
              ),
              const SizedBox(height: 12),
              Text("${patientInfo['name']}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text("Age: ${patientInfo['age']}"),
              Text("Gender: ${patientInfo['gender']}"),
              Text("Blood Type: ${patientInfo['bloodType']}"),
              const SizedBox(height: 12),
              Text("Email: ${patientInfo['email']}"),
              Text("Phone: ${patientInfo['phone']}"),
              Text("Address: ${patientInfo['address']}"),
              _buildSection("Medical History", List<String>.from(patientInfo['history'])),
              _buildSection("Medications", List<String>.from(patientInfo['medications'])),
              _buildSection("Past Appointments", List<String>.from(patientInfo['appointments'])),
            ],
          ),
        ),
      ),
    );
  }
}
