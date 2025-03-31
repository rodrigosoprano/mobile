import 'package:flutter/material.dart';

class BibleScreen extends StatefulWidget {
  const BibleScreen({super.key});

  @override
  State<BibleScreen> createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bíblia Católica'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Antigo Testamento'),
            Tab(text: 'Novo Testamento'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BibleSearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              // TODO: Implementar acesso aos favoritos
            },
          ),
          IconButton(
            icon: const Icon(Icons.headphones),
            onPressed: () {
              // TODO: Implementar função de áudio
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTestamentView(isOldTestament: true),
          _buildTestamentView(isOldTestament: false),
        ],
      ),
    );
  }

  Widget _buildTestamentView({required bool isOldTestament}) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 1, // TODO: Implementar lista real de livros
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(isOldTestament ? 'Gênesis' : 'Mateus'),
            subtitle: const Text('Capítulos disponíveis'),
            onTap: () {
              // TODO: Implementar navegação para capítulos
            },
          ),
        );
      },
    );
  }
}

class BibleSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Implementar resultados da pesquisa
    return const Center(child: Text('Resultados da pesquisa'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: Implementar sugestões de pesquisa
    return const Center(child: Text('Digite para pesquisar'));
  }
}