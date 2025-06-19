import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widget_library/components/button.dart';

part 'widgetbook.directories.g.dart';

@WidgetbookApp.material(
  name: 'Widget Library',
  directories: [
    WidgetbookFolder(
      name: 'Button',
      children: [
        WidgetbookComponent(
          name: 'Button',
          useCases: [
            WidgetbookUseCase(
              name: 'Default Button',
              builder: (context) => Center(
                child: CustomButton(
                  text: 'Click Me',
                  onPressed: () {
                    debugPrint('Button clicked!');
                  },
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Secondary Button',
              builder: (context) => Center(
                child: CustomButton(
                  text: 'Click Me',
                  isPrimary: false,
                  onPressed: () {
                    debugPrint('Button clicked!');
                  },
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Small Button',
              builder: (context) => Center(
                child: CustomButton(
                  text: 'Click Me',
                  isSmall: true,
                  onPressed: () {
                    debugPrint('Button clicked!');
                  },
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Small Secondary Button',
              builder: (context) => Center(
                child: CustomButton(
                  text: 'Click Me',
                  isPrimary: false,
                  isSmall: true,
                  onPressed: () {
                    debugPrint('Button clicked!');
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
)
class WidgetbookApp {}
