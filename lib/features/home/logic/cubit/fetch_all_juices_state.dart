part of 'fetch_all_juices_cubit.dart';

sealed class FetchAllJuicesState {}

final class FetchAllJuicesInitial extends FetchAllJuicesState {}

final class FetchAllJuicesLoading extends FetchAllJuicesState {}

final class FetchAllJuicesSuccess extends FetchAllJuicesState {
  final List<JuiceModel> juices;
  FetchAllJuicesSuccess({required this.juices});
}

final class FetchAllJuicesFailure extends FetchAllJuicesState {
  final String errMessage;
  FetchAllJuicesFailure({required this.errMessage});
}
