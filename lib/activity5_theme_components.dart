import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const SettingsApp());
}

class SettingsApp extends StatefulWidget {
  const SettingsApp({super.key});

  @override
  State<SettingsApp> createState() => _SettingsAppState();
}

class _SettingsAppState extends State<SettingsApp> {
  bool _darkMode = false;
  Color _seedColor = studentColor;

  final List<Color> _availableColors = [
  studentColor,
  Colors.indigo,
  Colors.teal,
  Colors.deepOrange,
  Colors.green,
];

  ThemeData _buildTheme(bool isDark) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor:
          isDark ? const Color(0xFF121212) : const Color(0xFFF7F8FA),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: isDark ? 1 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.grey.shade200,
          ),
        ),
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 4),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(
          color: isDark
              ? Colors.white.withValues(alpha: 0.12)
              : Colors.grey.shade300,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings & Themes',
      theme: _buildTheme(false),
      darkTheme: _buildTheme(true),
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      home: SettingsPage(
        isDark: _darkMode,
        onThemeChanged: (val) => setState(() => _darkMode = val),
        currentColor: _seedColor,
        availableColors: _availableColors,
        onColorChanged: (c) => setState(() => _seedColor = c),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;
  final Color currentColor;
  final List<Color> availableColors;
  final ValueChanged<Color> onColorChanged;

  const SettingsPage({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
    required this.currentColor,
    required this.availableColors,
    required this.onColorChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  String _selectedLanguage = 'English';

  final Set<String> _selectedSkills = {
    'Programming',
    'UI Design',
    'Database Management',
  };

  final List<Map<String, dynamic>> _skillsList = const [
    {'name': 'Programming', 'icon': Icons.code},
    {'name': 'UI Design', 'icon': Icons.design_services},
    {'name': 'Database Management', 'icon': Icons.storage},
    {'name': 'Mobile Development', 'icon': Icons.phone_android},
    {'name': 'Cloud Computing', 'icon': Icons.cloud_outlined},
  ];

  void _showLanguageDialog() {
    final languages = ['English', 'Filipino', 'Spanish', 'Japanese'];
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: languages.map((lang) {
            final isSelected = _selectedLanguage == lang;
            return ListTile(
              title: Text(
                lang,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing: isSelected
                  ? Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : null,
              onTap: () {
                setState(() => _selectedLanguage = lang);
                Navigator.pop(ctx);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            tooltip: 'Toggle Theme',
            icon: Icon(
              widget.isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => widget.onThemeChanged(!widget.isDark),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          // Profile Header Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: colorScheme.primaryContainer,
                    foregroundColor: colorScheme.onPrimaryContainer,
                    child: const Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          studentName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Student ID: $studentId',
                          style: TextStyle(
                            fontSize: 13,
                            color: theme.textTheme.bodyMedium?.color
                                ?.withValues(alpha: 0.7),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'BS Information Technology',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Appearance Section Title
          _buildSectionHeader('APPEARANCE & THEME', colorScheme.primary),
          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: Icon(
                    widget.isDark ? Icons.dark_mode : Icons.light_mode,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Dark Mode'),
                  subtitle: Text(
                    widget.isDark
                        ? 'Dark theme is currently active'
                        : 'Light theme is currently active',
                  ),
                  value: widget.isDark,
                  onChanged: widget.onThemeChanged,
                ),
                const Divider(height: 1, indent: 56),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.palette_outlined,
                        color: colorScheme.primary,
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'Accent Color',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        children: widget.availableColors.map((color) {
                          final isSelected = widget.currentColor == color;
                          return GestureDetector(
                            onTap: () => widget.onColorChanged(color),
                            child: Container(
                              margin: const EdgeInsets.only(left: 8),
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: isSelected
                                    ? Border.all(
                                        color: widget.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        width: 2.5,
                                      )
                                    : null,
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // General Settings Section
          _buildSectionHeader('PREFERENCES', colorScheme.primary),
          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: Icon(
                    Icons.notifications_outlined,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Notifications'),
                  subtitle: const Text('Receive lab and campus alerts'),
                  value: _notifications,
                  onChanged: (val) {
                    setState(() => _notifications = val);
                  },
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: Icon(
                    Icons.language_outlined,
                    color: colorScheme.primary,
                  ),
                  title: const Text('Language'),
                  subtitle: Text(_selectedLanguage),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _showLanguageDialog,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Skills & Badges Section
          _buildSectionHeader('MY SKILLS', colorScheme.primary),
          const SizedBox(height: 8),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tap to highlight your core competencies:',
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.textTheme.bodyMedium?.color
                          ?.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _skillsList.map((skill) {
                      final name = skill['name'] as String;
                      final icon = skill['icon'] as IconData;
                      final isSelected = _selectedSkills.contains(name);

                      return FilterChip(
                        avatar: Icon(
                          icon,
                          size: 18,
                          color: isSelected
                              ? colorScheme.onPrimaryContainer
                              : colorScheme.onSurfaceVariant,
                        ),
                        label: Text(name),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              _selectedSkills.add(name);
                            } else {
                              _selectedSkills.remove(name);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // Action Button
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Settings saved for $studentName!',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.check_circle_outline),
            label: const Text(
              'Save Settings',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: color,
        ),
      ),
    );
  }
}
