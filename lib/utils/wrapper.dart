// TODO: Remove this file when the issue is fixed
// THIS IS A WORKAROUND
// https://github.com/flutter/flutter/issues/120353

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    super.key,
    required this.child,
  });
  final Widget child;

  bool canPop(BuildContext context) {
    final lastMatch = GoRouter.of(context)
        .routerDelegate
        .currentConfiguration
        .matches
        .lastOrNull;

    if (lastMatch is ShellRouteMatch) {
      return lastMatch.matches.length == 1;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop(context),
      child: child,
    );
  }
}
