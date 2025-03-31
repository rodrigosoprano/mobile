import React, { useState } from 'react';
import { View, StyleSheet, ScrollView } from 'react-native';
import { Card, Title, Paragraph, List, Divider, useTheme } from 'react-native-paper';

const CalendarScreen = () => {
  const theme = useTheme();
  const [selectedDate, setSelectedDate] = useState(new Date());

  const liturgicalEvents = [
    {
      date: new Date(),
      title: 'Tempo Comum',
      description: 'Período do calendário litúrgico dedicado ao crescimento na fé',
      color: '#2E7D32', // Verde litúrgico
    },
    {
      date: new Date(),
      title: 'Santo do Dia: São João Maria Vianney',
      description: 'Padroeiro dos Sacerdotes',
      color: theme.colors.primary,
    },
  ];

  const celebrations = [
    {
      title: 'Missa Diária',
      time: '07:00',
      type: 'Celebração Eucarística',
    },
    {
      title: 'Adoração ao Santíssimo',
      time: '15:00',
      type: 'Devoção',
    },
  ];

  return (
    <ScrollView style={styles.container}>
      <Card style={styles.currentDayCard}>
        <Card.Content>
          <Title style={styles.currentDayTitle}>
            {selectedDate.toLocaleDateString('pt-BR', {
              weekday: 'long',
              year: 'numeric',
              month: 'long',
              day: 'numeric',
            })}
          </Title>
        </Card.Content>
      </Card>

      <View style={styles.section}>
        <Title style={styles.sectionTitle}>Tempo Litúrgico</Title>
        {liturgicalEvents.map((event, index) => (
          <Card
            key={index}
            style={[styles.eventCard, { borderLeftColor: event.color }]}
          >
            <Card.Content>
              <Title>{event.title}</Title>
              <Paragraph>{event.description}</Paragraph>
            </Card.Content>
          </Card>
        ))}
      </View>

      <Divider style={styles.divider} />

      <View style={styles.section}>
        <Title style={styles.sectionTitle}>Celebrações de Hoje</Title>
        {celebrations.map((celebration, index) => (
          <List.Item
            key={index}
            title={celebration.title}
            description={celebration.type}
            left={props => <List.Icon {...props} icon="church" />}
            right={() => <Paragraph style={styles.time}>{celebration.time}</Paragraph>}
            style={styles.celebrationItem}
          />
        ))}
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  currentDayCard: {
    margin: 16,
    elevation: 4,
  },
  currentDayTitle: {
    textAlign: 'center',
    fontSize: 18,
    textTransform: 'capitalize',
  },
  section: {
    padding: 16,
  },
  sectionTitle: {
    marginBottom: 16,
    fontSize: 20,
    fontWeight: 'bold',
  },
  eventCard: {
    marginBottom: 16,
    borderLeftWidth: 4,
  },
  divider: {
    marginVertical: 8,
  },
  celebrationItem: {
    backgroundColor: '#f5f5f5',
    marginBottom: 8,
    borderRadius: 8,
  },
  time: {
    alignSelf: 'center',
    marginRight: 16,
  },
});

export default CalendarScreen;