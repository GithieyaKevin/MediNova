import 'package:flutter/material.dart';

class HealthScreen extends StatelessWidget {
  final Map<String, String> vitalSigns = {
    'Heart Rate': '78 bpm',
    'Blood Pressure': '120/80 mmHg',
    'Respiratory Rate': '16 breaths/min',
    'Temperature': '98.6 °F',
    'Oxygen Saturation': '97%',
  };

  final Map<String, String> patientInfo = {
    'Name': 'John Doe',
    'Age': '35',
    'Gender': 'Male',
    'Blood Type': 'O+',
    'Organ Donor': 'Yes',
  };

  Widget buildVitalCard(String label, String value) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          SizedBox(height: 8),
          Text(value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal[800])),
        ],
      ),
    );
  }

  Widget buildPatientInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Patient Overview',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              ...patientInfo.entries.map((entry) => buildPatientInfo(entry.key, entry.value)).toList(),

              SizedBox(height: 24),
              Text('Vital Signs',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: NeverScrollableScrollPhysics(),
                children: vitalSigns.entries
                    .map((entry) => buildVitalCard(entry.key, entry.value))
                    .toList(),
              ),

              SizedBox(height: 24),
              Text('Organ Donor Info',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Registered Organ Donor',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[800])),
                    SizedBox(height: 8),
                    Text(
                      'This patient is a registered organ donor and has agreed to donate liver, kidney, and corneas.',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
