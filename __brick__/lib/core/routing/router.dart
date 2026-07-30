// import 'package:canya_mobile/features/group/presentation/group_screen.dart';
// import 'package:canya_mobile/features/landing/landing_screen.dart';
// import 'package:canya_mobile/features/user/presentation/user_detail_screen.dart';
// import 'package:canya_mobile/features/user/presentation/user_list_screen.dart';
import 'package:{{app_name.snakeCase()}}/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, group, user, userDetail }

final routerConfig = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      pageBuilder: (_, state) =>
          MaterialPage(child: HomePage(), key: state.pageKey),
    ),

    // GoRoute(
    //   path: '/group/:id',
    //   name: AppRoute.group.name,
    //   pageBuilder: (_, state) {
    //     final groupId = state.pathParameters['id'] ?? '';
    //     logDebug('going to $groupId');
    //     return MaterialPage(
    //       child: GroupScreen(groupId: groupId),
    //       key: state.pageKey,
    //     );
    //   },
    // ),

    // GoRoute(
    //     path: '/user',
    //     name: AppRoute.user.name,
    //     pageBuilder: (_, state) {
    //       return MaterialPage(
    //         child: UserListScreen(),
    //         key: state.pageKey,
    //       );
    //     },
    //     routes: [
    //       GoRoute(
    //           path: ':id', name: AppRoute.userDetail
    //           .name, pageBuilder: (_, state) {
    //         final groupId = state.pathParameters['id'] ??
    //             '';
    //         logDebug('going to user $groupId');
    //         return MaterialPage(
    //             child: UserDetailScreen(id: groupId,),
    //             key: state.pageKey
    //         );
    //       }),

    //     ]
    // ),
  ],
);
