import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const WeatherDashboardApp());
}

class WeatherDashboardApp extends StatelessWidget {
  const WeatherDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Dashboard',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: studentColor),
      useMaterial3: true,
      ),
      home: const WeatherPage(),
    );
  }
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Weather Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            tooltip: 'Refresh',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF42A5F5), Color(0xFF1E88E5), Color(0xFF1565C0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Location Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 22,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Magallanes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Thursday, Oct 22 • Clear Sky',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),

                // Main Weather Icon & Temperature Display
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withValues(alpha: 0.25),
                        blurRadius: 30,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.wb_sunny_rounded,
                    size: 96,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '32°',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 68,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                const Text(
                  'Sunny',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'H: 35°  •  L: 25°',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 28),

                // Hourly Forecast Section
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hourly Forecast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      HourlyForecastItem(
                        time: 'Now',
                        icon: Icons.wb_sunny_rounded,
                        temp: '32°',
                      ),
                      HourlyForecastItem(
                        time: '12 PM',
                        icon: Icons.wb_sunny_rounded,
                        temp: '33°',
                      ),
                      HourlyForecastItem(
                        time: '3 PM',
                        icon: Icons.wb_sunny_rounded,
                        temp: '34°',
                      ),
                      HourlyForecastItem(
                        time: '6 PM',
                        icon: Icons.wb_twilight_rounded,
                        iconColor: Colors.orangeAccent,
                        temp: '29°',
                      ),
                      HourlyForecastItem(
                        time: '9 PM',
                        icon: Icons.nightlight_round,
                        iconColor: Colors.amberAccent,
                        temp: '26°',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Weather Details Grid (2x2 layout)
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Weather Conditions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Expanded(
                      child: StatBox(
                        icon: Icons.thermostat,
                        label: 'Feels like',
                        value: '35°',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: StatBox(
                        icon: Icons.water_drop,
                        label: 'Humidity',
                        value: '65%',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Expanded(
                      child: StatBox(
                        icon: Icons.air,
                        label: 'Wind',
                        value: '12 km/h',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: StatBox(
                        icon: Icons.visibility,
                        label: 'Visibility',
                        value: '10 km',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final Color iconColor;
  final String temp;

  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.icon,
    this.iconColor = Colors.amber,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 8),
          Text(
            temp,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const StatBox({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
