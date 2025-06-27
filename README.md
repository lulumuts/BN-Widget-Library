# Braiding Nairobi Widget Library

A comprehensive Flutter widget library showcasing reusable components for the Braiding Nairobi application.

## 🚀 Live Demo

Visit the live widget library: [https://lulumuts.github.io/BN-Widget-Library/](https://lulumuts.github.io/BN-Widget-Library/)

## 🎨 Components

### Atoms

- **ServiceButton**: Interactive service booking buttons with SVG icons
- **CustomButton**: Reusable button component with various styles
- **AtomicText**: Typography component with LeagueSpartan font

### Molecules

- **ServicesSection**: Service booking section with toggle functionality
- **StyleItem**: Individual style category display
- **SalonItem**: Salon information display component

### Organisms

- **StylesSection**: Grid layout for style categories
- **SalonsSection**: List of popular salons

### Templates

- **HomeScreenTemplate**: Complete home screen layout template

## 🛠️ Features

- **SVG Icon Support**: Custom SVG icons for services (braids_vector.svg, braids_removal.svg)
- **Interactive States**: Active/inactive button states with dynamic coloring
- **Responsive Design**: Works across different screen sizes
- **Atomic Design**: Organized component architecture
- **Google Fonts**: LeagueSpartan typography throughout

## 🎯 Key Components

### Services Section

- Two interactive buttons: "Book a New Look" and "Book Braids Removal"
- SVG icons with proper active/inactive state coloring
- Toggle functionality (only one button active at a time)
- LeagueSpartan font styling

### Button Styling

- Active buttons: Dark purple background with white circular icon containers
- Inactive buttons: Transparent background with colored borders
- SVG icons: White when inactive, dark purple when active
- Proper hover and click states

## 📱 Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run -d chrome` for web development
4. Or use `flutter build web` to build for production

## 🔧 Development

The widget library uses Widgetbook for component development and testing. All components are built with Flutter and follow atomic design principles.

---

**Updated**: Now deployed via GitHub Actions for automatic builds and deployments!
