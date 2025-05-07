// lib/core/router/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/providers/user_provider.dart';
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
      
      // Main app routes with bottom navigation bar shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldWithNavBar(child: child),
        routes: [
          // Home
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const HomeScreen(),
            ),
          ),
          
          // Paths
          GoRoute(
            path: '/paths',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const PathsScreen(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) => PathDetailsScreen(
                  pathId: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
          
          // Explore
          GoRoute(
            path: '/explore',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const ExploreScreen(),
            ),
          ),
          
          // Map
          GoRoute(
            path: '/map',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const MapScreen(),
            ),
          ),
          
          // Profile
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const ProfileScreen(),
            ),
            routes: [
              GoRoute(
                path: 'settings',
                builder: (context, state) => const SettingsScreen(),
              ),
              GoRoute(
                path: 'saved',
                builder: (context, state) => const SavedPathsScreen(),
              ),
              GoRoute(
                path: 'achievements',
                builder: (context, state) => const AchievementsScreen(),
              ),
            ],
          ),
        ],
      ),
      
      // Additional routes that use full screen
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
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

// Scaffold with bottom navigation bar for shell routes
class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}