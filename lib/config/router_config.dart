import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_talk/models/user_model.dart';
import 'package:snap_talk/chat/chat_screen.dart';
import 'package:snap_talk/home/home_screen.dart';
import 'package:snap_talk/authentication/login_screen.dart';
import 'package:snap_talk/authentication/signup_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerConfiguration = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/Login',
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'Login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'SignUp',
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'Home',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: 'Chat',
      path: '/chat',
      builder: (context, state) {
        final User user = state.extra as User;
        return ChatScreen(user: user);
      },
    ),
  ],
);
