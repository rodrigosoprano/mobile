import { MD3LightTheme, MD3DarkTheme } from 'react-native-paper';
import { DefaultTheme, DarkTheme } from '@react-navigation/native';

const lightColors = {
  ...MD3LightTheme.colors,
  primary: '#800020', // Vermelho bordô (cor tradicional católica)
  secondary: '#B8860B', // Dourado escuro
  tertiary: '#4B0082', // Índigo (cor litúrgica)
  background: '#FFFFFF',
  surface: '#F5F5F5',
  text: '#1A1A1A',
  error: '#B00020',
};

const darkColors = {
  ...MD3DarkTheme.colors,
  primary: '#D4AF37', // Dourado
  secondary: '#800020', // Vermelho bordô
  tertiary: '#9370DB', // Púrpura médio
  background: '#121212',
  surface: '#1E1E1E',
  text: '#FFFFFF',
  error: '#CF6679',
};

export const theme = {
  light: {
    ...MD3LightTheme,
    colors: lightColors,
    navigation: {
      ...DefaultTheme,
      colors: {
        ...DefaultTheme.colors,
        primary: lightColors.primary,
        background: lightColors.background,
        card: lightColors.surface,
        text: lightColors.text,
      },
    },
  },
  dark: {
    ...MD3DarkTheme,
    colors: darkColors,
    navigation: {
      ...DarkTheme,
      colors: {
        ...DarkTheme.colors,
        primary: darkColors.primary,
        background: darkColors.background,
        card: darkColors.surface,
        text: darkColors.text,
      },
    },
  },
};