import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const CafeMenuApp());
}

class CafeMenuApp extends StatelessWidget {
  const CafeMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Café',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
      seedColor: studentColor,
      ),
      scaffoldBackgroundColor: const Color(0xFFFBF8F5),
      useMaterial3: true,
      ),
      home: CafeMenuPage(),
    );
  }
}

class CafeMenuPage extends StatelessWidget {
  CafeMenuPage({super.key});

  final ValueNotifier<String> _selectedCategory = ValueNotifier<String>('All');
  final ValueNotifier<int> _orderCount = ValueNotifier<int>(0);

  final List<Map<String, String>> menuItems = const [
    {
      'name': 'Iced Coffee',
      'price': '₱85',
      'category': 'Drinks',
      'description': 'Chilled espresso with cold milk & ice',
    },
    {
      'name': 'Cappuccino',
      'price': '₱95',
      'category': 'Drinks',
      'description': 'Rich espresso with silky steamed foam',
    },
    {
      'name': 'Chocolate Cake',
      'price': '₱75',
      'category': 'Desserts',
      'description': 'Decadent moist dark chocolate slice',
    },
    {
      'name': 'Club Sandwich',
      'price': '₱120',
      'category': 'Meals',
      'description': 'Triple-decker with chicken & veggies',
    },
    {
      'name': 'Caramel Latte',
      'price': '₱110',
      'category': 'Best Seller',
      'description': 'Velvety espresso with caramel drizzle',
    },
    {
      'name': 'Cheese Burger',
      'price': '₱130',
      'category': 'Meals',
      'description': 'Juicy beef patty, cheddar & sauce',
    },
  ];

  final List<String> categories = const [
    'All',
    'Drinks',
    'Meals',
    'Desserts',
    'Best Seller',
  ];

  IconData _getItemIcon(String name, String category) {
    switch (name) {
      case 'Iced Coffee':
        return Icons.local_cafe_rounded;
      case 'Cappuccino':
        return Icons.coffee_rounded;
      case 'Chocolate Cake':
        return Icons.cake_rounded;
      case 'Club Sandwich':
        return Icons.lunch_dining_rounded;
      case 'Caramel Latte':
        return Icons.emoji_food_beverage_rounded;
      case 'Cheese Burger':
        return Icons.fastfood_rounded;
      default:
        return category == 'Drinks' ? Icons.local_cafe : Icons.restaurant_menu;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Best Seller':
        return const Color(0xFFE65100);
      case 'Drinks':
        return const Color(0xFF00897B);
      case 'Meals':
        return const Color(0xFFD84315);
      case 'Desserts':
        return const Color(0xFF8E24AA);
      default:
        return const Color(0xFF6D4C41);
    }
  }

  void _addToCart(BuildContext context, String itemName) {
    _orderCount.value++;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added $itemName to tray!'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.amberAccent,
          onPressed: () {
            if (_orderCount.value > 0) {
              _orderCount.value--;
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campus Café',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: _orderCount,
            builder: (context, count, _) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    tooltip: 'My Tray',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Your tray contains $count item(s)'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),
                  if (count > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFD84315),
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          // Banner with Stack and Positioned
          Stack(
            children: [
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3E2723),
                      Color(0xFF5D4037),
                      Color(0xFF795548),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3E2723).withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
              // Background coffee icon watermark
              Positioned(
                right: -15,
                bottom: -20,
                child: Icon(
                  Icons.coffee_rounded,
                  size: 150,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
              // Banner content
              Positioned(
                left: 20,
                top: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.school, size: 14, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        'STUDENT PERK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Campus Café!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Freshly brewed coffee & campus bites daily',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Categories Filter Row
          ValueListenableBuilder<String>(
            valueListenable: _selectedCategory,
            builder: (context, activeCat, _) {
              return SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final isSelected = activeCat == cat;
                    return ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: const Color(0xFF4E342E),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color:
                            isSelected ? Colors.white : const Color(0xFF4E342E),
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                      side: BorderSide(
                        color: isSelected
                            ? const Color(0xFF4E342E)
                            : Colors.brown.shade200,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          _selectedCategory.value = cat;
                        }
                      },
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20),

          // Menu section header & Grid
          ValueListenableBuilder<String>(
            valueListenable: _selectedCategory,
            builder: (context, activeCat, _) {
              final filteredItems = activeCat == 'All'
                  ? menuItems
                  : menuItems
                      .where((item) => item['category'] == activeCat)
                      .toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        activeCat == 'All'
                            ? 'Our Menu'
                            : '$activeCat (${filteredItems.length})',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3E2723),
                        ),
                      ),
                      Text(
                        '${filteredItems.length} items',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.brown.shade400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.72,
                    ),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final categoryColor =
                          _getCategoryColor(item['category']!);
                      final iconData =
                          _getItemIcon(item['name']!, item['category']!);

                      return Card(
                        elevation: 2,
                        shadowColor: Colors.brown.withValues(alpha: 0.15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Colors.brown.shade100,
                            width: 0.8,
                          ),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Category badge & Star
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: categoryColor.withValues(
                                        alpha: 0.12,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      item['category']!,
                                      style: TextStyle(
                                        color: categoryColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  if (item['category'] == 'Best Seller')
                                    const Icon(
                                      Icons.star_rounded,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                ],
                              ),
                              const Spacer(),

                              // Center Food/Beverage Icon
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF5EBE6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    iconData,
                                    size: 38,
                                    color: const Color(0xFF5D4037),
                                  ),
                                ),
                              ),
                              const Spacer(),

                              // Item Name
                              Text(
                                item['name']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF3E2723),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),

                              // Description
                              Text(
                                item['description'] ?? '',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 11,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),

                              // Bottom Row: Price & Add Button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item['price']!,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4E342E),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        _addToCart(context, item['name']!),
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF4E342E),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
