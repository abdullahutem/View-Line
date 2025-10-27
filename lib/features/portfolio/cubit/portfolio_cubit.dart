import 'package:bloc/bloc.dart';
import 'package:view_line/core/data/mock_data.dart';
import 'package:view_line/features/portfolio/models/portfolio_item.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial());
  void loadPortfolio() {
    emit(PortfolioLoading());
    try {
      final items = MockData.getPortfolioItems();
      emit(PortfolioLoaded(items: items));
    } catch (e) {
      emit(PortfolioError(message: e.toString()));
    }
  }
}
