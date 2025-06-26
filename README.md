# Widget Library - Atomic Design System

This is a Flutter widget library showcasing atomic design principles with Widgetbook integration for component preview and documentation.

## 🏗️ Atomic Design Structure

The components are organized following atomic design principles:

### **Atoms** (`lib/components/atoms/`)

The smallest building blocks - basic UI elements that can't be broken down further.

- **AtomicButton** - Reusable button component with multiple variants
- **AtomicText** - Typography component with predefined styles

### **Molecules** (`lib/components/molecules/`)

Simple combinations of atoms that work together as a unit.

- **StyleItem** - Card component for displaying style information

### **Organisms** (`lib/components/organisms/`)

Complex UI components composed of molecules and/or atoms.

- **StylesGrid** - Horizontal scrollable grid of style items

### **Templates** (`lib/components/templates/`)

Page-level components that define the structure and layout.

- **HomeTemplate** - Complete home page layout combining multiple organisms

## 🚀 Getting Started

### Running Widgetbook

1. Navigate to the widget_library directory:

   ```bash
   cd widget_library
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run Widgetbook:

   ```bash
   flutter run -d chrome --web-port=3000
   ```

4. Open your browser and go to `http://localhost:3000`

### Previewing Components

In Widgetbook, you can:

1. **Browse by Atomic Level**: Navigate through Atoms → Molecules → Organisms → Templates
2. **Test Different Variants**: Each component has multiple use cases showing different states
3. **Interactive Testing**: Click and interact with components in real-time
4. **Responsive Testing**: Test components at different screen sizes

## 🎨 Component Examples

### AtomicButton Variants

- Primary buttons
- Secondary buttons
- Small buttons
- Buttons with icons (left/right)
- Active state buttons

### AtomicText Variants

- Heading 1 (32px, bold)
- Heading 2 (24px, semibold)
- Body text (16px, regular)
- Caption text (14px, regular)
- Custom styled text

### StyleItem

- Image with title
- Clickable cards
- Consistent styling

### StylesGrid

- Horizontal scrollable grid
- Combines multiple StyleItem molecules
- Includes section heading

### HomeTemplate

- Complete page layout
- Combines header, hero section, and content
- Shows how organisms work together

## 🔧 Development Workflow

1. **Create New Atoms**: Start with the smallest components
2. **Build Molecules**: Combine atoms into functional units
3. **Develop Organisms**: Create complex components from molecules
4. **Design Templates**: Build page layouts using organisms
5. **Preview in Widgetbook**: Test and iterate on components

## 📁 File Structure

```
lib/
├── components/
│   ├── atoms/
│   │   ├── custom_button.dart
│   │   └── atomic_text.dart
│   ├── molecules/
│   │   └── style_item.dart
│   ├── organisms/
│   │   └── styles_grid.dart
│   └── templates/
│       └── home_template.dart
├── screens/
└── main.dart
```

## 🎯 Benefits of Atomic Design

- **Reusability**: Components can be used across different pages
- **Consistency**: Maintains design system standards
- **Maintainability**: Easy to update and modify components
- **Scalability**: New components can be built from existing atoms
- **Testing**: Each component can be tested in isolation
- **Documentation**: Widgetbook provides living documentation

## 🚀 Next Steps

1. Add more atoms (inputs, icons, dividers, etc.)
2. Create additional molecules (form fields, navigation items)
3. Build more organisms (headers, footers, sidebars)
4. Develop page templates for different sections
5. Add animations and interactions
6. Implement dark mode support
7. Add accessibility features

## License

MIT
