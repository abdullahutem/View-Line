part of 'navigation_cubit.dart';

// Make NavigationState define the getter used by UI
abstract class NavigationState {
  int get currentIndex;
}

// Concrete initial / normal state
class NavigationInitial extends NavigationState {
  @override
  final int currentIndex;

  NavigationInitial({required this.currentIndex});
}
