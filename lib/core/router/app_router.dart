<<<<<<< HEAD
// lib/core/router/app_router.dart - تحديث لإضافة مسار الرحلة
=======
<<<<<<< HEAD
// lib/core/router/app_router.dart - تحديث لإضافة مسار الرحلة
=======
// lib/core/router/app_router.dart
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/providers/user_provider.dart';
<<<<<<< HEAD
import '../../presentation/providers/paths_provider.dart';
=======
<<<<<<< HEAD
import '../../presentation/providers/paths_provider.dart';
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/auth/onboarding_screen.dart';
import '../../presentation/screens/auth/register_screen.dart';
import '../../presentation/screens/explore/explore_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/map/map_screen.dart';
import '../../presentation/screens/paths/path_details_screen.dart';
import '../../presentation/screens/paths/paths_screen.dart';
import '../../presentation/screens/profile/profile_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/search/search_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/saved_paths/saved_paths_screen.dart';
import '../../presentation/screens/achievements/achievements_screen.dart';
<<<<<<< HEAD
import '../../presentation/screens/journey/journey_tracking_screen.dart';
=======
<<<<<<< HEAD
import '../../presentation/screens/journey/journey_tracking_screen.dart';
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
import '../../presentation/widgets/navigation/scaffold_with_navbar.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: '/splash',
    navigatorKey: _rootNavigatorKey,
    redirect: _routeGuard,
    routes: [
      // Auth and splash routes
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
      // Journey tracking route (خارج الشل للشاشة الكاملة)
      GoRoute(
        path: '/journey/:pathId',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final pathId = state.pathParameters['pathId']!;
          final pathsProvider = Provider.of<PathsProvider>(context, listen: false);
          final path = pathsProvider.getPathById(pathId);
          
          if (path == null) {
            // إذا لم يتم العثور على المسار، العودة للصفحة السابقة
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pop();
            });
            return const Scaffold(
              body: Center(
                child: Text('لم يتم العثور على المسار'),
              ),
            );
          }
          
          return JourneyTrackingScreen(path: path);
        },
      ),
      
<<<<<<< HEAD
=======
=======
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
      // Main app routes with bottom navigation bar shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldWithNavBar(
          location: state.uri.path,
          child: child,
        ),
        routes: [
          // Home
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: 'search',
<<<<<<< HEAD
                parentNavigatorKey: _rootNavigatorKey,
=======
<<<<<<< HEAD
                parentNavigatorKey: _rootNavigatorKey,
=======
                parentNavigatorKey: _rootNavigatorKey, // هذا يضمن استخدام مستوى التنقل الجذر
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          
          // Paths
          GoRoute(
            path: '/paths',
            builder: (context, state) => const PathsScreen(),
            routes: [
              GoRoute(
                path: ':id',
<<<<<<< HEAD
                parentNavigatorKey: _rootNavigatorKey,
=======
<<<<<<< HEAD
                parentNavigatorKey: _rootNavigatorKey,
=======
                parentNavigatorKey: _rootNavigatorKey, // للصعود مستوى واحد فوق الشل
>>>>>>> c5e84a9c6bdf5d95948ba5bed7e7a7efbe2ecc7c
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                builder: (context, state) => PathDetailsScreen(
                  pathId: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
          
          // Explore
          GoRoute(
            path: '/explore',
            builder: (context, state) => const ExploreScreen(),
          ),
          
          // Map
          GoRoute(
            path: '/map',
            builder: (context, state) => const MapScreen(),
          ),
          
          // Profile
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: 'settings',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const SettingsScreen(),
              ),
              GoRoute(
                path: 'saved',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const SavedPathsScreen(),
              ),
              GoRoute(
                path: 'achievements',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const AchievementsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  // Route guard function to handle authentication
  static String? _routeGuard(BuildContext context, GoRouterState state) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final isLoggedIn = userProvider.isLoggedIn;
    final isInitialRoute = state.matchedLocation == '/splash';
    final isAuthRoute = state.matchedLocation == '/login' || 
                       state.matchedLocation == '/register' ||
                       state.matchedLocation == '/onboarding';
    
    // Allow splash and auth routes without authentication
    if (isInitialRoute || isAuthRoute) {
      return null;
    }
    
    // Redirect to login if not authenticated
    if (!isLoggedIn) {
      return '/login';
    }
    
    // Allow all other routes when authenticated
    return null;
  }
}