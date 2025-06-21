part of 'update_juice_cubit.dart';

sealed class UpdateJuiceState {}

final class UpdateJuiceInitial extends UpdateJuiceState {}

final class UpdateJuiceLoading extends UpdateJuiceState {}

final class UpdateJuiceSuccess extends UpdateJuiceState {
  final String message;
  UpdateJuiceSuccess({required this.message});
}

final class UpdateJuiceError extends UpdateJuiceState {
  final String errMessage;
  UpdateJuiceError({required this.errMessage});
}
