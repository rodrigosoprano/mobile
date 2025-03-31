import React, { useState } from 'react';
import { View, StyleSheet, ScrollView } from 'react-native';
import { List, Searchbar, FAB, Portal, Modal, Text, useTheme } from 'react-native-paper';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

const BibleScreen = () => {
  const [searchQuery, setSearchQuery] = useState('');
  const [isAudioModalVisible, setAudioModalVisible] = useState(false);
  const theme = useTheme();

  const bibleBooks = [
    { title: 'Gênesis', chapters: 50 },
    { title: 'Êxodo', chapters: 40 },
    { title: 'Levítico', chapters: 27 },
    // Adicionar mais livros aqui
  ];

  const handleSearch = (query: string) => {
    setSearchQuery(query);
    // Implementar lógica de busca
  };

  const toggleAudioModal = () => {
    setAudioModalVisible(!isAudioModalVisible);
  };

  return (
    <View style={styles.container}>
      <Searchbar
        placeholder="Pesquisar na Bíblia"
        onChangeText={handleSearch}
        value={searchQuery}
        style={styles.searchBar}
      />

      <ScrollView style={styles.bookList}>
        {bibleBooks.map((book, index) => (
          <List.Item
            key={index}
            title={book.title}
            description={`${book.chapters} capítulos`}
            left={props => <List.Icon {...props} icon="book" />}
            onPress={() => {}}
          />
        ))}
      </ScrollView>

      <Portal>
        <Modal
          visible={isAudioModalVisible}
          onDismiss={toggleAudioModal}
          contentContainerStyle={styles.modalContent}
        >
          <Text style={styles.modalTitle}>Áudio Bíblia</Text>
          <List.Item
            title="Reproduzir Áudio"
            left={props => <List.Icon {...props} icon="play" />}
            onPress={() => {}}
          />
        </Modal>
      </Portal>

      <FAB
        icon="headphones"
        style={[styles.fab, { backgroundColor: theme.colors.primary }]}
        onPress={toggleAudioModal}
      />
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
  bookList: {
    flex: 1,
  },
  fab: {
    position: 'absolute',
    margin: 16,
    right: 0,
    bottom: 0,
  },
  modalContent: {
    backgroundColor: 'white',
    padding: 20,
    margin: 20,
    borderRadius: 8,
  },
  modalTitle: {
    fontSize: 24,
    marginBottom: 16,
    fontWeight: 'bold',
  },
});

export default BibleScreen;