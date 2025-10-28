import 'package:bloc/bloc.dart';
import 'package:view_line/features/about_us/models/branch.dart';

part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit() : super(BranchesInitial());
  void loadBranches() {
    // emit(BranchesLoading());
    // try {
    //   final branches = MockData.getBranches();
    //   emit(BranchesLoaded(branches: branches));
    // } catch (e) {
    //   emit(BranchesError(message: e.toString()));
    // }
  }
}
