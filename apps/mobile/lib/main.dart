import 'package:flutter/material.dart';

void main() {
  runApp(const BarAmaBaroApp());
}

class BarAmaBaroApp extends StatelessWidget {
  const BarAmaBaroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bar ama Baro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF1E40AF),
        useMaterial3: true,
      ),
      home: const HomeMockScreen(),
    );
  }
}

class HomeMockScreen extends StatelessWidget {
  const HomeMockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = ['Xisaab Fasalka 8aad', 'English Bilow', 'Computer Basics'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar ama Baro'),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Gal Akoonka')),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Meesha Aqoontu Ka Bilaabato',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Ku baro aqoon tayo leh, meel kasta oo aad joogto.'),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Raadi koorso ama maaddo',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Casharro La Doortay', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          for (final course in courses)
            Card(
              child: ListTile(
                leading: const Icon(Icons.play_circle_fill),
                title: Text(course),
                subtitle: const Text('Af-Soomaali • Bilaash'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
        ],
      ),
    );
  }
}
