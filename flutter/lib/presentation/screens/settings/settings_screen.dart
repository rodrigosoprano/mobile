import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _fontSize = 16.0;
  bool _isDarkMode = false;
  bool _enableNotifications = true;
  bool _enableAudioControls = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('Aparência'),
          _buildThemeSettings(),
          _buildFontSizeSettings(),
          const Divider(),
          _buildSectionHeader('Notificações'),
          _buildNotificationSettings(),
          const Divider(),
          _buildSectionHeader('Áudio'),
          _buildAudioSettings(),
          const Divider(),
          _buildSectionHeader('Sobre'),
          _buildAboutSettings(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildThemeSettings() {
    return SwitchListTile(
      title: const Text('Modo Escuro'),
      subtitle: const Text('Ativar tema escuro'),
      value: _isDarkMode,
      onChanged: (value) {
        setState(() {
          _isDarkMode = value;
        });
        // TODO: Implementar mudança de tema
      },
    );
  }

  Widget _buildFontSizeSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tamanho da Fonte'),
          Slider(
            value: _fontSize,
            min: 12,
            max: 24,
            divisions: 12,
            label: _fontSize.round().toString(),
            onChanged: (value) {
              setState(() {
                _fontSize = value;
              });
              // TODO: Implementar mudança de tamanho da fonte
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('A', style: TextStyle(fontSize: 12)),
              Text('A', style: TextStyle(fontSize: 24)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSettings() {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Notificações'),
          subtitle: const Text('Receber notificações diárias'),
          value: _enableNotifications,
          onChanged: (value) {
            setState(() {
              _enableNotifications = value;
            });
            // TODO: Implementar configuração de notificações
          },
        ),
        ListTile(
          title: const Text('Horário das Notificações'),
          subtitle: const Text('Definir horário para receber notificações'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // TODO: Implementar configuração de horário
          },
        ),
      ],
    );
  }

  Widget _buildAudioSettings() {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Controles de Áudio'),
          subtitle: const Text('Ativar controles de reprodução de áudio'),
          value: _enableAudioControls,
          onChanged: (value) {
            setState(() {
              _enableAudioControls = value;
            });
            // TODO: Implementar configuração de áudio
          },
        ),
        ListTile(
          title: const Text('Voz do Narrador'),
          subtitle: const Text('Escolher voz para leitura da Bíblia'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // TODO: Implementar seleção de voz
          },
        ),
      ],
    );
  }

  Widget _buildAboutSettings() {
    return Column(
      children: [
        ListTile(
          title: const Text('Versão do Aplicativo'),
          subtitle: const Text('1.0.0'),
        ),
        ListTile(
          title: const Text('Política de Privacidade'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // TODO: Implementar navegação para política de privacidade
          },
        ),
        ListTile(
          title: const Text('Termos de Uso'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // TODO: Implementar navegação para termos de uso
          },
        ),
      ],
    );
  }
}