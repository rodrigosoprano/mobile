import React, { useState } from 'react';
import { View, StyleSheet, ScrollView } from 'react-native';
import { List, Switch, Divider, Text, useTheme } from 'react-native-paper';

const SettingsScreen = () => {
  const theme = useTheme();
  const [darkMode, setDarkMode] = useState(false);
  const [notifications, setNotifications] = useState(true);
  const [fontSize, setFontSize] = useState('medium');
  const [audioAutoplay, setAudioAutoplay] = useState(false);

  const fontSizes = ['small', 'medium', 'large', 'extra-large'];

  return (
    <ScrollView style={styles.container}>
      <List.Section>
        <List.Subheader>Aparência</List.Subheader>
        <List.Item
          title="Modo Escuro"
          left={props => <List.Icon {...props} icon="theme-light-dark" />}
          right={() => (
            <Switch
              value={darkMode}
              onValueChange={setDarkMode}
              color={theme.colors.primary}
            />
          )}
        />
        <Divider />
        <List.Item
          title="Tamanho da Fonte"
          description={fontSize}
          left={props => <List.Icon {...props} icon="format-size" />}
          onPress={() => {
            const currentIndex = fontSizes.indexOf(fontSize);
            const nextIndex = (currentIndex + 1) % fontSizes.length;
            setFontSize(fontSizes[nextIndex]);
          }}
        />
      </List.Section>

      <List.Section>
        <List.Subheader>Notificações</List.Subheader>
        <List.Item
          title="Notificações Diárias"
          description="Receba lembretes de orações e leituras"
          left={props => <List.Icon {...props} icon="bell" />}
          right={() => (
            <Switch
              value={notifications}
              onValueChange={setNotifications}
              color={theme.colors.primary}
            />
          )}
        />
      </List.Section>

      <List.Section>
        <List.Subheader>Áudio</List.Subheader>
        <List.Item
          title="Reprodução Automática"
          description="Iniciar áudio automaticamente ao abrir um texto"
          left={props => <List.Icon {...props} icon="play-circle" />}
          right={() => (
            <Switch
              value={audioAutoplay}
              onValueChange={setAudioAutoplay}
              color={theme.colors.primary}
            />
          )}
        />
      </List.Section>

      <View style={styles.aboutSection}>
        <Text style={styles.version}>Versão 1.0.0</Text>
        <Text style={styles.copyright}>© 2023 Bíblia Católica</Text>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  aboutSection: {
    padding: 16,
    alignItems: 'center',
    marginTop: 24,
  },
  version: {
    fontSize: 16,
    marginBottom: 8,
  },
  copyright: {
    fontSize: 14,
    color: '#666',
  },
});

export default SettingsScreen;