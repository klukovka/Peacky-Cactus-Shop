import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class BaseRouter {
  final StackRouter stackRouter;

  const BaseRouter(this.stackRouter);

  // TabsRouter? getMainPageTabsRouter(BuildContext context);

  // Future<void> pushRoot();

  // Future<void> replaceWithRoot();

  @protected
  void popUntilRoot() => stackRouter.popUntilRoot();

  T? getObserver<T extends AutoRouteObserver>(BuildContext context) {
    return RouterScope.of(context).firstObserverOfType<T>();
  }

  @protected
  Future<void> pushByPath(String path) => stackRouter.pushNamed(path);

  Future<void> pop() => stackRouter.pop();

  // Future<void> popOrRoot() =>
  //     stackRouter.canPopSelfOrChildren ? pop() : pushRoot();

  @protected
  void popUntilPath(String path) => stackRouter.popUntilRouteWithName(path);

  @protected
  Future<void> push(PageRouteInfo<dynamic> route) => stackRouter.push(route);

  @protected
  Future<void> replace(PageRouteInfo<dynamic> route) =>
      stackRouter.replace(route);

  @protected
  Future<void> replacePath(String path) => stackRouter.replaceNamed(path);

  @protected
  Future<void> pushAndClearStack(PageRouteInfo<dynamic> route) {
    return stackRouter.pushAndPopUntil(route, predicate: (_) => false);
  }
}
