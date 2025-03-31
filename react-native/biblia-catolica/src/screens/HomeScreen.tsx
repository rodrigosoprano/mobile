import React from 'react';
import { View, StyleSheet, ScrollView } from 'react-native';
import { Card, Title, useTheme } from 'react-native-paper';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
import type { NativeStackNavigationProp } from '@react-navigation/native-stack';

type HomeScreenProps = {
  navigation: NativeStackNavigationProp<any>;
};

const HomeScreen: React.FC<HomeScreenProps> = ({ navigation }) => {
  const theme = useTheme();

  const menuItems = [
    {
      title: 'Bíblia',
      icon: 'book-open-variant',
      route: 'Bible',
      description: 'Leia a Bíblia Católica completa'
    },
    {
      title: 'Orações',
      icon: 'hands-pray',
      route: 'Prayers',
      description: 'Orações tradicionais e devoções'
    },
    {
      title: 'Calendário',
      icon: 'calendar-month',
      route: 'Calendar',
      description: 'Calendário litúrgico e santos do dia'
    },
    {
      title: 'Configurações',
      icon: 'cog',
      route: 'Settings',
      description: 'Personalize sua experiência'
    },
  ];

  return (
    <ScrollView style={styles.container}>
      <View style={styles.grid}>
        {menuItems.map((item, index) => (
          <Card
            key={index}
            style={styles.card}
            onPress={() => navigation.navigate(item.route)}
          >
            <Card.Content style={styles.cardContent}>
              <Icon
                name={item.icon}
                size={40}
                color={theme.colors.primary}
                style={styles.icon}
              />
              <Title style={styles.title}>{item.title}</Title>
            </Card.Content>
          </Card>
        ))}
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  grid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    padding: 8,
    justifyContent: 'space-between',
  },
  card: {
    width: '48%',
    marginVertical: 8,
    elevation: 4,
    borderRadius: 12,
  },
  cardContent: {
    alignItems: 'center',
    padding: 16,
  },
  icon: {
    marginBottom: 8,
  },
  title: {
    fontSize: 16,
    textAlign: 'center',
  },
});

export default HomeScreen;