
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Tracker',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: studentColor),
      useMaterial3: true,
    ),
      home: const WaterTrackerPage(),
    );
  }
}

class WaterTrackerPage extends StatefulWidget {
  const WaterTrackerPage({super.key});

  @override
  State<WaterTrackerPage> createState() => _WaterTrackerPageState();
}

class _WaterTrackerPageState extends State<WaterTrackerPage> {
  int _glasses = 0;
  final int _goal = 6;

  @override
  Widget build(BuildContext context) {
    debugPrint('build() called');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
              Icons.water_drop,
              size: 80,
              color: studentColor,
            ),
              const SizedBox(height: 16),
              const Text(
                'Daily Water Intake',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 12),
              Text(
                '$_glasses / $_goal glasses',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: (_glasses / _goal).clamp(0.0, 1.0),
                minHeight: 12,
              ),
              const SizedBox(height: 16),
              Text(
                _glasses >= _goal
                  ? 'Daily goal achieved! Stay hydrated!'
                  : 'Keep going! You can reach your daily goal!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _glasses > 0
                        ? () {
                            setState(() {
                              _glasses--;
                            });
                          }
                        : null,
                    icon: const Icon(Icons.remove_circle),
                    iconSize: 48,
                  ),
                  const SizedBox(width: 24),
                  IconButton(
                    onPressed: () {
                    setState(() {
                    _glasses++;
                    });
                    },
                    icon: const Icon(Icons.add_circle),
                    iconSize: 48,
                    color: studentColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
