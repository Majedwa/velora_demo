<<<<<<< HEAD
// lib/presentation/screens/profile/profile_screen.dart - مُصحح
=======
// lib/presentation/screens/profile/profile_screen.dart
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/localization/language_provider.dart';
<<<<<<< HEAD
import '../../../core/localization/app_localizations.dart';
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
import '../../providers/user_provider.dart';
import '../../providers/saved_paths_provider.dart';
import '../../widgets/common/loading_indicator.dart';

import 'completed_trips_sheet.dart';
import 'edit_profile_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });
    
    await Future.delayed(const Duration(milliseconds: 300));
    
    setState(() {
      _isLoading = false;
    });
  }

  void _showLogoutConfirmation() {
<<<<<<< HEAD
    final localizations = AppLocalizations.of(context)!;
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.get('logout')),
        content: Text(
          languageProvider.isArabic 
            ? 'هل أنت متأكد من تسجيل الخروج؟'
            : 'Are you sure you want to logout?'
        ),
=======
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تسجيل الخروج'),
        content: const Text('هل أنت متأكد من تسجيل الخروج؟'),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
<<<<<<< HEAD
            child: Text(localizations.get('cancel')),
=======
            child: const Text('إلغاء'),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _logout();
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
<<<<<<< HEAD
            child: Text(localizations.get('logout')),
=======
            child: const Text('تسجيل الخروج'),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
          ),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    setState(() {
      _isLoading = true;
    });
    
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.logout();
    
    if (mounted) {
      context.go('/login');
    }
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
<<<<<<< HEAD
      final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            languageProvider.isArabic 
              ? 'لا يمكن فتح الرابط'
              : 'Cannot open link'
          ),
=======
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لا يمكن فتح الرابط'),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  void _showAboutDialog() {
<<<<<<< HEAD
    final localizations = AppLocalizations.of(context)!;
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
    showAboutDialog(
      context: context,
      applicationName: 'Velora',
      applicationVersion: '1.0.0',
      applicationIcon: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/logo.png',
          width: 64,
          height: 64,
        ),
      ),
      children: [
<<<<<<< HEAD
        Text(
          languageProvider.isArabic 
            ? 'تطبيق لاستكشاف المسارات السياحية في فلسطين'
            : 'An app for exploring tourist routes in Palestine'
        ),
=======
        const Text('تطبيق لاستكشاف المسارات السياحية في فلسطين'),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => _openUrl(AppConstants.termsUrl),
<<<<<<< HEAD
              child: Text(
                languageProvider.isArabic 
                  ? 'شروط الاستخدام'
                  : 'Terms of Service'
              ),
            ),
            TextButton(
              onPressed: () => _openUrl(AppConstants.privacyUrl),
              child: Text(
                languageProvider.isArabic 
                  ? 'سياسة الخصوصية'
                  : 'Privacy Policy'
              ),
=======
              child: const Text('شروط الاستخدام'),
            ),
            TextButton(
              onPressed: () => _openUrl(AppConstants.privacyUrl),
              child: const Text('سياسة الخصوصية'),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
            ),
          ],
        ),
      ],
    );
  }

  void _showLanguageBottomSheet() {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Consumer<LanguageProvider>(
        builder: (context, provider, child) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Text(
<<<<<<< HEAD
                provider.isArabic ? 'اختر اللغة' : 'Choose Language',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              
              // اللغة العربية
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: provider.isArabic ? AppColors.primary.withOpacity(0.1) : Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'ع',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: provider.isArabic ? AppColors.primary : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                title: const Text('العربية'),
                subtitle: const Text('Arabic'),
                trailing: provider.isArabic
                    ? const Icon(PhosphorIcons.check_circle_fill, color: AppColors.primary)
=======
                'اختر اللغة',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const CircleAvatar(
                  child: Text('ع'),
                ),
                title: const Text('العربية'),
                trailing: provider.isArabic
                    ? const Icon(PhosphorIcons.check, color: AppColors.primary)
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                    : null,
                onTap: () {
                  provider.changeLanguage('ar');
                  Navigator.pop(context);
<<<<<<< HEAD
                  _showLanguageChangeSnackBar('ar');
                },
              ),
              
              // اللغة الإنجليزية
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: provider.isEnglish ? AppColors.primary.withOpacity(0.1) : Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'En',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: provider.isEnglish ? AppColors.primary : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                title: const Text('English'),
                subtitle: const Text('الإنجليزية'),
                trailing: provider.isEnglish
                    ? const Icon(PhosphorIcons.check_circle_fill, color: AppColors.primary)
=======
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Text('En'),
                ),
                title: const Text('English'),
                trailing: !provider.isArabic
                    ? const Icon(PhosphorIcons.check, color: AppColors.primary)
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                    : null,
                onTap: () {
                  provider.changeLanguage('en');
                  Navigator.pop(context);
<<<<<<< HEAD
                  _showLanguageChangeSnackBar('en');
                },
              ),
              
              const SizedBox(height: 16),
=======
                },
              ),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
  
  void _showLanguageChangeSnackBar(String newLanguage) {
    final message = newLanguage == 'ar' 
        ? 'تم تغيير اللغة إلى العربية'
        : 'Language changed to English';
        
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(PhosphorIcons.check_circle, color: Colors.white),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils.init(context);
    
    final userProvider = Provider.of<UserProvider>(context);
    final savedPathsProvider = Provider.of<SavedPathsProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
<<<<<<< HEAD
    final localizations = AppLocalizations.of(context)!;
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
    
    final user = userProvider.user;
    final savedPathsCount = savedPathsProvider.savedPaths.length;
    
    if (_isLoading || user == null) {
<<<<<<< HEAD
      return Scaffold(
        body: LoadingIndicator(
          message: languageProvider.isArabic 
            ? 'جاري تحميل البيانات...'
            : 'Loading data...',
=======
      return const Scaffold(
        body: LoadingIndicator(
          message: 'جاري تحميل البيانات...',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // شريط التطبيق
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
<<<<<<< HEAD
              // زر تغيير اللغة المحسن
              Container(
                margin: const EdgeInsets.all(8),
                child: Material(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: _showLanguageBottomSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            PhosphorIcons.translate,
                            color: AppColors.primary,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            languageProvider.isArabic ? 'EN' : 'ع',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              // زر الإعدادات
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    PhosphorIcons.gear,
                    color: AppColors.primary,
                  ),
                ),
                onPressed: () {
                  context.go('/profile/settings');
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // الخلفية
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary,
                            AppColors.primary.withOpacity(0.8),
                            AppColors.primary.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // الحافة المنحنية
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  
                  // معلومات المستخدم
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        // صورة المستخدم
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: user.profileImageUrl != null
                                ? Image.network(
                                    user.profileImageUrl!,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Text(
                                      user.name.substring(0, 1).toUpperCase(),
                                      style: const TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        
                        // الاسم والبريد
                        Text(
                          user.name,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                        Text(
                          user.email,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // إحصائيات المستخدم
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _StatItem(
                      value: user.completedTrips.toString(),
<<<<<<< HEAD
                      label: localizations.get('completed_trips'),
=======
                      label: 'رحلات مكتملة',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                      icon: PhosphorIcons.check_circle,
                      color: AppColors.success,
                    ),
                  ),
                  Expanded(
                    child: _StatItem(
                      value: savedPathsCount.toString(),
<<<<<<< HEAD
                      label: localizations.get('saved_trips'),
=======
                      label: 'رحلات محفوظة',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                      icon: PhosphorIcons.bookmark_simple,
                      color: AppColors.primary,
                    ),
                  ),
                  Expanded(
                    child: _StatItem(
                      value: user.achievements.toString(),
<<<<<<< HEAD
                      label: localizations.get('achievements'),
=======
                      label: 'إنجازات',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                      icon: PhosphorIcons.trophy,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // قائمة الخيارات
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _MenuItem(
                    icon: PhosphorIcons.user,
<<<<<<< HEAD
                    title: languageProvider.isArabic ? 'حسابي' : 'My Account',
                    subtitle: languageProvider.isArabic 
                      ? 'تعديل المعلومات الشخصية'
                      : 'Edit personal information',
=======
                    title: 'حسابي',
                    subtitle: 'تعديل المعلومات الشخصية',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) => const EditProfileSheet(),
                      );
                    },
                  ),
                  _buildDivider(),
                  _MenuItem(
                    icon: PhosphorIcons.bookmark_simple,
<<<<<<< HEAD
                    title: localizations.get('saved'),
                    subtitle: languageProvider.isArabic 
                      ? 'عرض وإدارة المسارات المحفوظة'
                      : 'View and manage saved paths',
=======
                    title: 'المسارات المحفوظة',
                    subtitle: 'عرض وإدارة المسارات المحفوظة',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                    onTap: () {
                      context.go('/profile/saved');
                    },
                  ),
                  _buildDivider(),
                  _MenuItem(
                    icon: PhosphorIcons.check_circle,
<<<<<<< HEAD
                    title: localizations.get('my_trips'),
                    subtitle: languageProvider.isArabic 
                      ? 'المسارات التي أكملتها'
                      : 'Paths you have completed',
=======
                    title: 'رحلاتي',
                    subtitle: 'المسارات التي أكملتها',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) => const CompletedTripsSheet(),
                      );
                    },
                  ),
                  _buildDivider(),
                  _MenuItem(
                    icon: PhosphorIcons.trophy,
<<<<<<< HEAD
                    title: localizations.get('achievements'),
                    subtitle: languageProvider.isArabic 
                      ? 'الإنجازات التي حققتها'
                      : 'Achievements you have earned',
=======
                    title: 'إنجازاتي',
                    subtitle: 'الإنجازات التي حققتها',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                    onTap: () {
                      context.go('/profile/achievements');
                    },
                  ),
                ],
              ),
            ),
          ),
          
<<<<<<< HEAD
          // الإعدادات واللغة
=======
          // الإعدادات
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _MenuItem(
                    icon: PhosphorIcons.gear,
<<<<<<< HEAD
                    title: localizations.get('settings'),
                    subtitle: languageProvider.isArabic 
                      ? 'تخصيص التطبيق'
                      : 'Customize the app',
=======
                    title: 'الإعدادات',
                    subtitle: 'تخصيص التطبيق',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                    onTap: () {
                      context.go('/profile/settings');
                    },
                  ),
                  _buildDivider(),
                  _MenuItem(
                    icon: PhosphorIcons.translate,
<<<<<<< HEAD
                    title: localizations.get('language'),
                    subtitle: languageProvider.isArabic 
                      ? 'تغيير لغة التطبيق'
                      : 'Change app language',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            languageProvider.isArabic ? 'العربية' : 'English',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
=======
                    title: 'اللغة',
                    subtitle: 'تغيير لغة التطبيق',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          languageProvider.isArabic ? 'العربية' : 'English',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                        Icon(
                          PhosphorIcons.caret_right,
                          color: AppColors.textSecondary,
                          size: 16,
                        ),
                      ],
                    ),
                    onTap: _showLanguageBottomSheet,
                  ),
                  _buildDivider(),
                  _MenuItem(
                    icon: PhosphorIcons.question,
<<<<<<< HEAD
                    title: localizations.get('help_support'),
                    subtitle: languageProvider.isArabic 
                      ? 'الأسئلة الشائعة والدعم الفني'
                      : 'FAQ and technical support',
=======
                    title: 'المساعدة والدعم',
                    subtitle: 'الأسئلة الشائعة والدعم الفني',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                    onTap: () {
                      _openUrl(AppConstants.faqUrl);
                    },
                  ),
                  _buildDivider(),
                  _MenuItem(
<<<<<<< HEAD
                    icon: PhosphorIcons.info,
                    title: localizations.get('about_app'),
                    subtitle: languageProvider.isArabic 
                      ? 'معلومات عن Velora'
                      : 'Information about Velora',
                    trailing: Text(
                      languageProvider.isArabic ? 'النسخة 1.0.0' : 'Version 1.0.0',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    onTap: _showAboutDialog,
                  ),
=======
  icon: PhosphorIcons.info,
  title: 'عن التطبيق',
  subtitle: 'معلومات عن Velora',
  trailing: Text(
    'النسخة 1.0.0',
    style: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 14,
    ),
  ),
  onTap: _showAboutDialog,
),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                ],
              ),
            ),
          ),
          
          // زر تسجيل الخروج
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: _MenuItem(
                icon: PhosphorIcons.sign_out,
<<<<<<< HEAD
                title: localizations.get('logout'),
                subtitle: languageProvider.isArabic 
                  ? 'الخروج من حسابك'
                  : 'Sign out of your account',
=======
                title: 'تسجيل الخروج',
                subtitle: 'الخروج من حسابك',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
                iconColor: AppColors.error,
                titleColor: AppColors.error,
                onTap: _showLogoutConfirmation,
              ),
            ),
          ),
          
          // مساحة إضافية
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDivider() {
    return const Divider(
      color: AppColors.divider,
      thickness: 1,
      height: 1,
      indent: 60,
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? titleColor;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.onTap,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (iconColor ?? AppColors.primary).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor ?? AppColors.primary,
            size: 20,
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: titleColor ?? AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: AppColors.textSecondary,
        ),
      ),
      trailing: trailing ?? Icon(
        PhosphorIcons.caret_right,
        color: AppColors.textSecondary,
      ),
      onTap: onTap,
    );
  }
}