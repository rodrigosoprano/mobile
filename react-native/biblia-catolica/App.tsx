import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Provider as PaperProvider } from 'react-native-paper';
import { Provider as StoreProvider } from 'react-redux';
import { store } from './src/store';
import { theme } from './src/theme';

// Screens
import HomeScreen from './src/screens/HomeScreen';
import BibleScreen from './src/screens/BibleScreen';
import PrayersScreen from './src/screens/PrayersScreen';
import CalendarScreen from './src/screens/CalendarScreen';
import SettingsScreen from './src/screens/SettingsScreen';

const Stack = createNativeStackNavigator();

const App = () => {
  return (
    <StoreProvider store={store}>
      <PaperProvider theme={theme}>
        <NavigationContainer>
          <Stack.Navigator
            initialRouteName="Home"
            screenOptions={{
              headerStyle: {
                backgroundColor: theme.colors.primary,
              },
              headerTintColor: '#fff',
              headerTitleStyle: {
                fontWeight: 'bold',
              },
            }}
          >
            <Stack.Screen name="Home" component={HomeScreen} options={{ title: 'Bíblia Católica' }} />
            <Stack.Screen name="Bible" component={BibleScreen} options={{ title: 'Bíblia' }} />
            <Stack.Screen name="Prayers" component={PrayersScreen} options={{ title: 'Orações' }} />
            <Stack.Screen name="Calendar" component={CalendarScreen} options={{ title: 'Calendário' }} />
            <Stack.Screen name="Settings" component={SettingsScreen} options={{ title: 'Configurações' }} />
          </Stack.Navigator>
        </NavigationContainer>
      </PaperProvider>
    </StoreProvider>
  );
};

export default App;