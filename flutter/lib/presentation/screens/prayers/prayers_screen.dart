import 'package:flutter/material.dart';

class PrayersScreen extends StatefulWidget {
  const PrayersScreen({super.key});

  @override
  State<PrayersScreen> createState() => _PrayersScreenState();
}

class _PrayersScreenState extends State<PrayersScreen> {
  final List<PrayerCategory> _categories = [
    PrayerCategory(
      title: 'Orações Básicas',
      icon: Icons.star,
      prayers: [
        Prayer(title: 'Pai Nosso', isFavorite: true),
        Prayer(title: 'Ave Maria', isFavorite: true),
        Prayer(title: 'Glória ao Pai', isFavorite: false),
        Prayer(title: 'Credo', isFavorite: false),
      ],
    ),
    PrayerCategory(
      title: 'Santos',
      icon: Icons.person,
      prayers: [
        Prayer(title: 'Santo Antônio', isFavorite: false),
        Prayer(title: 'São Francisco', isFavorite: false),
        Prayer(title: 'Santa Rita', isFavorite: false),
      ],
    ),
    PrayerCategory(
      title: 'Terços',
      icon: Icons.radio_button_checked,
      prayers: [
        Prayer(title: 'Terço Mariano', isFavorite: false),
        Prayer(title: 'Terço da Misericórdia', isFavorite: false),
      ],
    ),
    PrayerCategory(
      title: 'Novenas',
      icon: Icons.calendar_today,
      prayers: [
        Prayer(title: 'Novena de Natal', isFavorite: false),
        Prayer(title: 'Novena de Pentecostes', isFavorite: false),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orações'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // TODO: Implementar visualização de favoritos
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implementar pesquisa de orações
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return Card(
            child: ExpansionTile(
              leading: Icon(category.icon),
              title: Text(
                category.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: category.prayers.map((prayer) {
                return ListTile(
                  title: Text(prayer.title),
                  trailing: IconButton(
                    icon: Icon(
                      prayer.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: prayer.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        prayer.isFavorite = !prayer.isFavorite;
                      });
                    },
                  ),
                  onTap: () {
                    // TODO: Implementar visualização detalhada da oração
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class PrayerCategory {
  final String title;
  final IconData icon;
  final List<Prayer> prayers;

  PrayerCategory({
    required this.title,
    required this.icon,
    required this.prayers,
  });
}

class Prayer {
  final String title;
  bool isFavorite;

  Prayer({
    required this.title,
    required this.isFavorite,
  });
}