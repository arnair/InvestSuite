import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/theme/theme_provider.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isNeobank = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Section
          Text(
            'Appearance',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                _ThemeOptionTile(
                  title: 'Retail Bank',
                  subtitle: 'Clean, blue theme',
                  icon: Icons.account_balance,
                  isSelected: !isNeobank,
                  themeType: AppThemeType.retailBank,
                  onTap: () {
                    ref
                        .read(themeNotifierProvider.notifier)
                        .setTheme(AppThemeType.retailBank);
                  },
                ),
                const Divider(height: 1),
                _ThemeOptionTile(
                  title: 'Neobank',
                  subtitle: 'Modern, dark neon theme',
                  icon: Icons.rocket_launch,
                  isSelected: isNeobank,
                  themeType: AppThemeType.neobank,
                  onTap: () {
                    ref
                        .read(themeNotifierProvider.notifier)
                        .setTheme(AppThemeType.neobank);
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _ThemeOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final AppThemeType themeType;
  final VoidCallback onTap;

  const _ThemeOptionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.themeType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = themeType == AppThemeType.retailBank
        ? AppTheme.retailBankPrimary
        : AppTheme.neobankAccent;

    return ListTile(
      leading: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected
              ? primaryColor.withValues(alpha: 0.2)
              : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            icon,
            key: ValueKey(isSelected),
            color: isSelected
                ? primaryColor
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: isSelected
            ? Icon(
                Icons.check_circle,
                key: const ValueKey(true),
                color: primaryColor,
              )
            : const SizedBox.shrink(key: ValueKey(false)),
      ),
      onTap: onTap,
    );
  }
}
