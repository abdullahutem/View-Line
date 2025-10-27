part of 'branches_cubit.dart';

abstract class BranchesState {
  const BranchesState();
}

class BranchesInitial extends BranchesState {}

class BranchesLoading extends BranchesState {}

class BranchesLoaded extends BranchesState {
  final List<Branch> branches;

  const BranchesLoaded({required this.branches});
}

class BranchesError extends BranchesState {
  final String message;

  const BranchesError({required this.message});
}
