import 'package:demo/src/blocs/base/cubit.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> increment() async {
    try {
      emit(state.copyWith(
        count: state.count! + 1,
      ));
    } catch (e) {
      emit(state.copyWith(error: e, isLoading: false));
    }
  }
}
