// lib/presentation/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/responsive_utils.dart';
<<<<<<< HEAD
import '../../../core/localization/app_localizations.dart';
import '../../../core/localization/language_provider.dart';
=======
<<<<<<< HEAD
import '../../../core/localization/app_localizations.dart';
import '../../../core/localization/language_provider.dart';
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
import '../../../data/models/path_model.dart';
import '../../providers/user_provider.dart';
import '../../providers/paths_provider.dart';
import '../../providers/saved_paths_provider.dart';
import '../paths/widgets/path_card.dart';
import 'widgets/featured_paths_carousel.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/home_category_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoadingPaths = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoadingPaths = true;
    });
<<<<<<< HEAD

    await Future.delayed(const Duration(milliseconds: 500));

=======
<<<<<<< HEAD

    await Future.delayed(const Duration(milliseconds: 500));

=======
    
    await Future.delayed(const Duration(milliseconds: 500));
    
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
    setState(() {
      _isLoadingPaths = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils.init(context);
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10

    // استخدام النصوص المحلية
    final localizations = AppLocalizations.of(context)!;
    final languageProvider = Provider.of<LanguageProvider>(context);

    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    final pathsProvider = Provider.of<PathsProvider>(context);
    final featuredPaths = pathsProvider.featuredPaths;
    final suggestedPaths = pathsProvider.paths.take(3).toList();

    final savedPathsProvider = Provider.of<SavedPathsProvider>(context);
    final savedPaths = savedPathsProvider.savedPaths.take(2).toList();

<<<<<<< HEAD
=======
=======
    
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    
    final pathsProvider = Provider.of<PathsProvider>(context);
    final featuredPaths = pathsProvider.featuredPaths;
    final suggestedPaths = pathsProvider.paths.take(3).toList();
    
    final savedPathsProvider = Provider.of<SavedPathsProvider>(context);
    final savedPaths = savedPathsProvider.savedPaths.take(2).toList();
    
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadData,
        color: AppColors.primary,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                  Image.asset('assets/images/logo.png', height: 32),
                  const SizedBox(width: 8),
                  Text(
                    localizations.get('app_name'),
                    style: const TextStyle(
<<<<<<< HEAD
=======
=======
                  Image.asset(
                    'assets/images/logo.png',
                    height: 32,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Velora',
                    style: TextStyle(
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              centerTitle: false,
              actions: [
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                // زر تغيير اللغة
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      languageProvider.isArabic ? 'EN' : 'ع',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  onPressed: () {
                    final newLanguage = languageProvider.isArabic ? 'en' : 'ar';
                    languageProvider.changeLanguage(newLanguage);

                    // إظهار رسالة تأكيد
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          languageProvider.isArabic
                              ? 'Language changed to English'
                              : 'تم تغيير اللغة إلى العربية',
                        ),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
<<<<<<< HEAD
=======
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                // زر الإشعارات
                IconButton(
                  icon: Stack(
                    children: [
                      const Icon(
                        PhosphorIcons.bell,
                        color: AppColors.textPrimary,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                      SnackBar(
                        content: Text(
                          languageProvider.getText(
                            'لا توجد إشعارات جديدة',
                            'No new notifications',
                          ),
                        ),
                        duration: const Duration(seconds: 2),
<<<<<<< HEAD
=======
=======
                      const SnackBar(
                        content: Text('لا توجد إشعارات جديدة'),
                        duration: Duration(seconds: 2),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                      ),
                    );
                  },
                ),
                // زر الإعدادات
                IconButton(
                  icon: const Icon(
                    PhosphorIcons.gear,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () {
                    context.go('/profile/settings');
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: const EdgeInsets.only(top: 90, left: 16, right: 16),
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                  child:
                      user != null
                          ? Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: AppColors.primary,
                                child:
                                    user.profileImageUrl != null
                                        ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
                                          child: Image.network(
                                            user.profileImageUrl!,
                                            width: 44,
                                            height: 44,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                        : Text(
                                          user.name
                                              .substring(0, 1)
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      languageProvider.getText(
                                        'مرحباً، ${user.name}',
                                        'Hello, ${user.name}',
                                      ),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      languageProvider.getText(
                                        'استمتع باستكشاف فلسطين اليوم!',
                                        'Enjoy exploring Palestine today!',
                                      ),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                          : null,
                ),
              ),
            ),

<<<<<<< HEAD
=======
=======
                  child: user != null ? Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.primary,
                        child: user.profileImageUrl != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: Image.network(
                                  user.profileImageUrl!,
                                  width: 44,
                                  height: 44,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Text(
                                user.name.substring(0, 1).toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'مرحباً، ${user.name}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'استمتع باستكشاف فلسطين اليوم!',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ) : null,
                ),
              ),
            ),
            
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
            // شريط البحث والأزرار السريعة
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  children: [
                    const SearchBarWidget(),
                    const SizedBox(height: 16),
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
                    
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                    // الأزرار السريعة مع وظائف عاملة
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _QuickActionChip(
                            icon: PhosphorIcons.compass,
<<<<<<< HEAD
                            label: localizations.get('explore'),
=======
<<<<<<< HEAD
                            label: localizations.get('explore'),
=======
                            label: 'استكشف',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                            onTap: () => context.go('/explore'),
                          ),
                          _QuickActionChip(
                            icon: PhosphorIcons.map_trifold,
<<<<<<< HEAD
                            label: localizations.get('paths'),
=======
<<<<<<< HEAD
                            label: localizations.get('paths'),
=======
                            label: 'المسارات',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                            onTap: () => context.go('/paths'),
                          ),
                          _QuickActionChip(
                            icon: PhosphorIcons.mountains,
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                            label: localizations.get('climbing'),
                            onTap: () {
                              context.go('/paths');
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () {
                                  final pathsProvider =
                                      Provider.of<PathsProvider>(
                                        context,
                                        listen: false,
                                      );
                                  pathsProvider.setActivityFilter(
                                    ActivityType.climbing,
                                  );
                                },
                              );
<<<<<<< HEAD
=======
=======
                            label: 'التسلق',
                            onTap: () {
                              context.go('/paths');
                              Future.delayed(const Duration(milliseconds: 100), () {
                                final pathsProvider = Provider.of<PathsProvider>(context, listen: false);
                                pathsProvider.setActivityFilter(ActivityType.climbing);
                              });
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                            },
                          ),
                          _QuickActionChip(
                            icon: PhosphorIcons.campfire,
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                            label: localizations.get('camping'),
                            onTap: () {
                              context.go('/paths');
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () {
                                  final pathsProvider =
                                      Provider.of<PathsProvider>(
                                        context,
                                        listen: false,
                                      );
                                  pathsProvider.setActivityFilter(
                                    ActivityType.camping,
                                  );
                                },
                              );
<<<<<<< HEAD
=======
=======
                            label: 'التخييم',
                            onTap: () {
                              context.go('/paths');
                              Future.delayed(const Duration(milliseconds: 100), () {
                                final pathsProvider = Provider.of<PathsProvider>(context, listen: false);
                                pathsProvider.setActivityFilter(ActivityType.camping);
                              });
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                            },
                          ),
                          _QuickActionChip(
                            icon: PhosphorIcons.tree,
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                            label: localizations.get('nature'),
                            onTap: () {
                              context.go('/paths');
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () {
                                  final pathsProvider =
                                      Provider.of<PathsProvider>(
                                        context,
                                        listen: false,
                                      );
                                  pathsProvider.setActivityFilter(
                                    ActivityType.nature,
                                  );
                                },
                              );
<<<<<<< HEAD
=======
=======
                            label: 'الطبيعة',
                            onTap: () {
                              context.go('/paths');
                              Future.delayed(const Duration(milliseconds: 100), () {
                                final pathsProvider = Provider.of<PathsProvider>(context, listen: false);
                                pathsProvider.setActivityFilter(ActivityType.nature);
                              });
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
            
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
            // المسارات المميزة
            SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeCategoryHeader(
<<<<<<< HEAD
                    title: localizations.get('featured_paths'),
=======
<<<<<<< HEAD
                    title: localizations.get('featured_paths'),
=======
                    title: 'مسارات مميزة',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                    onViewAll: () => context.go('/paths'),
                  ),
                  if (_isLoadingPaths)
                    const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else
                    FeaturedPathsCarousel(paths: featuredPaths),
                ],
              ),
            ),
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
            
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
            // المسارات المحفوظة
            if (savedPaths.isNotEmpty)
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    HomeCategoryHeader(
<<<<<<< HEAD
                      title: localizations.get('saved'),
=======
<<<<<<< HEAD
                      title: localizations.get('saved'),
=======
                      title: 'محفوظاتك',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                      onViewAll: () => context.go('/profile/saved'),
                    ),
                    Container(
                      height: 220,
                      padding: const EdgeInsets.only(left: 16),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: savedPaths.length,
                        itemBuilder: (context, index) {
                          final path = savedPaths[index];
                          return Container(
                            width: 280,
                            padding: const EdgeInsets.only(right: 16),
                            child: PathCard(
                              path: path,
                              onTap: () => context.go('/paths/${path.id}'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
<<<<<<< HEAD

=======
<<<<<<< HEAD

=======
            
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
            // مغامرات مقترحة
            SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeCategoryHeader(
<<<<<<< HEAD
                    title: localizations.get('suggested_adventures'),
=======
<<<<<<< HEAD
                    title: localizations.get('suggested_adventures'),
=======
                    title: 'مغامرات مقترحة',
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                    onViewAll: () => context.go('/paths'),
                  ),
                  if (_isLoadingPaths)
                    const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                        children:
                            suggestedPaths.map((path) {
                              return PathCard(
                                path: path,
                                onTap: () => context.go('/paths/${path.id}'),
                              );
                            }).toList(),
<<<<<<< HEAD
=======
=======
                        children: suggestedPaths.map((path) {
                          return PathCard(
                            path: path,
                            onTap: () => context.go('/paths/${path.id}'),
                          );
                        }).toList(),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                      ),
                    ),
                ],
              ),
            ),
<<<<<<< HEAD

            const SliverToBoxAdapter(child: SizedBox(height: 100)),
=======
<<<<<<< HEAD

            const SliverToBoxAdapter(child: SizedBox(height: 100)),
=======
            
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
          ],
        ),
      ),
    );
  }
}

class _QuickActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
<<<<<<< HEAD
            Icon(icon, size: 18, color: AppColors.primary),
=======
<<<<<<< HEAD
            Icon(icon, size: 18, color: AppColors.primary),
=======
            Icon(
              icon,
              size: 18,
              color: AppColors.primary,
            ),
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
