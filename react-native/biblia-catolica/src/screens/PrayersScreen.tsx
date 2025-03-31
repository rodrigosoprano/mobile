import React, { useState } from 'react';
import { View, StyleSheet, ScrollView } from 'react-native';
import { List, Searchbar, Card, Title, Paragraph, IconButton, useTheme } from 'react-native-paper';

const PrayersScreen = () => {
  const [searchQuery, setSearchQuery] = useState('');
  const theme = useTheme();

  const prayers = [
    {
      id: 1,
      title: 'Pai Nosso',
      category: 'Orações Básicas',
      content: 'Pai Nosso que estais nos céus, santificado seja o vosso nome...',
      isFavorite: false,
    },
    {
      id: 2,
      title: 'Ave Maria',
      category: 'Orações Básicas',
      content: 'Ave Maria, cheia de graça, o Senhor é convosco...',
      isFavorite: false,
    },
    {
      id: 3,
      title: 'Salve Rainha',
      category: 'Orações Marianas',
      content: 'Salve Rainha, Mãe de misericórdia, vida, doçura e esperança nossa...',
      isFavorite: false,
    },
    {
      id: 4,
      title: 'Credo',
      category: 'Orações Básicas',
      content: 'Creio em Deus Pai todo-poderoso, criador do céu e da terra...',
      isFavorite: false,
    },
  ];

  const [prayersList, setPrayersList] = useState(prayers);

  const handleSearch = (query: string) => {
    setSearchQuery(query);
    // Implementar lógica de busca
  };

  const toggleFavorite = (id: number) => {
    setPrayersList(prayersList.map(prayer => 
      prayer.id === id ? { ...prayer, isFavorite: !prayer.isFavorite } : prayer
    ));
  };

  const categories = Array.from(new Set(prayers.map(prayer => prayer.category)));

  return (
    <View style={styles.container}>
      <Searchbar
        placeholder="Buscar orações"
        onChangeText={handleSearch}
        value={searchQuery}
        style={styles.searchBar}
      />

      <ScrollView style={styles.content}>
        {categories.map((category, index) => (
          <View key={index} style={styles.categorySection}>
            <Title style={styles.categoryTitle}>{category}</Title>
            {prayersList
              .filter(prayer => prayer.category === category)
              .map(prayer => (
                <Card key={prayer.id} style={styles.prayerCard}>
                  <Card.Content>
                    <View style={styles.prayerHeader}>
                      <Title>{prayer.title}</Title>
                      <IconButton
                        icon={prayer.isFavorite ? 'star' : 'star-outline'}
                        iconColor={prayer.isFavorite ? theme.colors.primary : undefined}
                        onPress={() => toggleFavorite(prayer.id)}
                      />
                    </View>
                    <Paragraph>{prayer.content}</Paragraph>
                  </Card.Content>
                </Card>
              ))}
          </View>
        ))}
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  searchBar: {
    margin: 16,
    elevation: 4,
  },
  content: {
    flex: 1,
    padding: 16,
  },
  categorySection: {
    marginBottom: 24,
  },
  categoryTitle: {
    marginBottom: 16,
    fontSize: 20,
    fontWeight: 'bold',
  },
  prayerCard: {
    marginBottom: 16,
    elevation: 2,
  },
  prayerHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 8,
  },
});

export default PrayersScreen;