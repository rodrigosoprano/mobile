import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário Litúrgico'),
        actions: [
          IconButton(
            icon: const Icon(Icons.today),
            onPressed: () {
              setState(() {
                _selectedDate = DateTime.now();
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implementar configurações de notificações
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCalendarHeader(),
          _buildDailyInfo(),
          _buildLiturgicalReadings(),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: CalendarDatePicker(
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        onDateChanged: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }

  Widget _buildDailyInfo() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Santo do Dia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'São Francisco de Assis',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(),
            const Text(
              'Tempo Litúrgico',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Tempo Comum',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiturgicalReadings() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Leituras do Dia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildReadingItem(
              'Primeira Leitura',
              'Atos dos Apóstolos 2, 1-11',
            ),
            _buildReadingItem(
              'Salmo',
              'Salmo 103',
            ),
            _buildReadingItem(
              'Segunda Leitura',
              '1 Coríntios 12, 3-7.12-13',
            ),
            _buildReadingItem(
              'Evangelho',
              'João 20, 19-23',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadingItem(String title, String reference) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(reference),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // TODO: Implementar navegação para a leitura completa
            },
          ),
        ],
      ),
    );
  }
}