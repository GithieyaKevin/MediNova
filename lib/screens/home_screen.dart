// home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openChatBot() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatBotScreen()),
    );
  }

  void _openReminderScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReminderScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hello,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("Welcome to MediNova!", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),

            GestureDetector(
              onTap: _openChatBot,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.teal[50], borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Image.asset('images/DoctorAvatar.png', width: 60),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TeleHealth ChatBot", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Ask health questions to our AI chatbot")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildQuickButton("Medication Reminder", Icons.alarm, Colors.teal[100]!, _openReminderScreen),
                _buildQuickButton("Health Library", Icons.menu_book, Colors.blue[100]!, () {}),
                _buildQuickButton("Emergency", Icons.local_hospital, Colors.blueGrey, () {}),
                _buildQuickButton("Find Facilities", Icons.location_on, Colors.blueAccent, () {}),
              ],
            ),

            const SizedBox(height: 24),
            const Text("Health Tips", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 6)
              ]),
              child: const ListTile(
                leading: Icon(Icons.apple, color: Colors.blue),
                title: Text("Eat a Balanced Diet"),
                subtitle: Text("Maintain a diet rich in fruits and vegetables."),
                trailing: Icon(Icons.chevron_right),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQuickButton(String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

// Chatbot screen
class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MediNova ChatBot")),
      body: const Center(
        child: Text("This will integrate an AI chatbot (e.g., DialogFlow, OpenAI)"),
      ),
    );
  }
}

// Reminder screen
class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final TextEditingController _taskController = TextEditingController();
  TimeOfDay? _selectedTime;

  void _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Reminder")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                labelText: 'Reminder Task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _selectTime,
                    icon: const Icon(Icons.access_time),
                    label: Text(_selectedTime == null ? "Select Time" : _selectedTime!.format(context)),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Save to database or local storage
                Navigator.pop(context);
              },
              child: const Text("Save Reminder"),
            )
          ],
        ),
      ),
    );
  }
}
