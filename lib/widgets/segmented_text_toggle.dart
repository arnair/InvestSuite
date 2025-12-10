import 'package:flutter/material.dart';

/// A segmented toggle button with text labels
class SegmentedTextToggle<T> extends StatelessWidget {
  final T value;
  final List<SegmentedTextOption<T>> options;
  final ValueChanged<T> onChanged;

  const SegmentedTextToggle({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options.map((option) {
            final isSelected = option.value == value;
            return _TextToggleButton(
              label: option.label,
              isSelected: isSelected,
              selectedColor: theme.colorScheme.primary,
              onTap: () => onChanged(option.value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

/// An option for SegmentedTextToggle
class SegmentedTextOption<T> {
  final T value;
  final String label;

  const SegmentedTextOption({required this.value, required this.label});
}

class _TextToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  const _TextToggleButton({
    required this.label,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          constraints: const BoxConstraints(minWidth: 44, minHeight: 36),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? selectedColor.withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? selectedColor : Colors.transparent,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isSelected
                  ? selectedColor
                  : theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
