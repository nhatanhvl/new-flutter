part of 'home_cubit.dart';

class HomeState extends BaseState {
  const HomeState({this.count = 0, super.isLoading, super.error});

  final int? count;

  @override
  HomeState copyWith({
    int? count,
    bool? isLoading,
    dynamic error,
  }) {
    return HomeState(count: count ?? 0, isLoading: false, error: error);
  }

  @override
  List<Object?> get props => [count];
}
