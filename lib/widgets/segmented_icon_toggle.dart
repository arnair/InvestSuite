import 'package:flutter/material.dart';

/// A segmented toggle button with icons
class SegmentedIconToggle<T> extends StatelessWidget {
  final T value;
  final List<SegmentedIconOption<T>> options;
  final ValueChanged<T> onChanged;

  const SegmentedIconToggle({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: options.map((option) {
          final isSelected = option.value == value;
          return _ToggleButton(
            icon: option.icon,
            isSelected: isSelected,
            onTap: () => onChanged(option.value),
          );
        }).toList(),
      ),
    );
  }
}

/// An option for SegmentedIconToggle
class SegmentedIconOption<T> {
  final T value;
  final IconData icon;

  const SegmentedIconOption({required this.value, required this.icon});
}

class _ToggleButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToggleButton({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 20,
          color: isSelected
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
