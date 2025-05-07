import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localization/language_provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../providers/user_provider.dart';
import '../../widgets/common/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'الإعدادات',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Account Section
          _SectionHeader(
            title: 'الحساب',
            icon: PhosphorIcons.user_circle,
          ),
          const SizedBox(height: 8),
          // Edit Profile
          _SettingItem(
            title: 'تعديل الملف الشخصي',
            icon: PhosphorIcons.user_focus,
            onTap: () {
              // TODO: Implement edit profile
            },
            enabled: !userProvider.isGuest,
          ),
          // Change Password
          _SettingItem(
            title: 'تغيير كلمة المرور',
            icon: PhosphorIcons.lock_key,
            onTap: () {
              // TODO: Implement change password
            },
            enabled: !userProvider.isGuest,
          ),
          const Divider(),

          // App Settings Section
          _SectionHeader(
            title: 'إعدادات التطبيق',
            icon: PhosphorIcons.gear,
          ),
          const SizedBox(height: 8),
          // Language
          _SettingItem(
            title: 'اللغة',
            icon: PhosphorIcons.translate,
            trailing: DropdownButton<String>(
              value: languageProvider.currentLanguage,
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(
                  value: 'ar',
                  child: Text('العربية'),
                ),
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  languageProvider.changeLanguage(value);
                }
              },
            ),
          ),
          // Notifications
          _SettingItem(
            title: 'الإشعارات',
            icon: PhosphorIcons.bell,
            trailing: Switch(
              value: true, // TODO: Connect to actual state
              onChanged: (value) {
                // TODO: Implement notification toggle
              },
            ),
          ),
          // Map Settings
          _SettingItem(
            title: 'إعدادات الخريطة',
            icon: PhosphorIcons.map_pin,
            onTap: () {
              // TODO: Implement map settings
            },
          ),
          const Divider(),

          // Support Section
          _SectionHeader(
            title: 'الدعم',
            icon: PhosphorIcons.question,
          ),
          const SizedBox(height: 8),
          // Help & FAQ
          _SettingItem(
            title: 'المساعدة والأسئلة الشائعة',
            icon: PhosphorIcons.info,
            onTap: () {
              // TODO: Implement help & FAQ
            },
          ),
          // Report a Problem
          _SettingItem(
            title: 'الإبلاغ عن مشكلة',
            icon: PhosphorIcons.warning,
            onTap: () {
              // TODO: Implement report a problem
            },
          ),
          // About App
          _SettingItem(
            title: 'عن التطبيق',
            icon: PhosphorIcons.info,
            onTap: () {
              // TODO: Implement about app
            },
          ),
          const Divider(),

          // Logout
          _SettingItem(
            title: 'تسجيل الخروج',
            icon: PhosphorIcons.sign_out,
            textColor: AppColors.error,
            iconColor: AppColors.error,
            onTap: () {
              _showLogoutConfirmation(context);
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تسجيل الخروج'),
        content: const Text('هل أنت متأكد من تسجيل الخروج؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              final userProvider = Provider.of<UserProvider>(context, listen: false);
              userProvider.logout();
              context.go('/login');
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('تسجيل الخروج'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                ),
          ),
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? iconColor;
  final bool enabled;

  const _SettingItem({
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
    this.textColor,
    this.iconColor,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        leading: Icon(
          icon,
          color: iconColor ?? AppColors.textPrimary,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: textColor ?? AppColors.textPrimary,
          ),
        ),
        trailing: trailing ??
            (onTap != null
                ? const Icon(
                    PhosphorIcons.caret_right,
                    color: AppColors.textSecondary,
                  )
                : null),
        onTap: enabled ? onTap : null,
      ),
    );
  }
}