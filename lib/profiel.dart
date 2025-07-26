import 'package:flutter/material.dart';

class ProfielScreen extends StatefulWidget {
  final String username;
  const ProfielScreen({super.key, required this.username});

  @override
  State<ProfielScreen> createState() => _ProfielScreenState();
}

class _ProfielScreenState extends State<ProfielScreen> {
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _petController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil'), backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.orange],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Willkommen, ${widget.username}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
                const SizedBox(height: 16),
                _buildField('Lieblingsfarbe', _colorController),
                const SizedBox(height: 12),
                _buildField('Lieblingsessen', _foodController),
                const SizedBox(height: 12),
                _buildField('Haustiername', _petController),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Daten gespeichert')),
                    );
                  },
                  child: const Text('Speichern'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
