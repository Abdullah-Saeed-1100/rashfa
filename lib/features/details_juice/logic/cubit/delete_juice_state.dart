part of 'delete_juice_cubit.dart';

sealed class DeleteJuiceState {}

final class DeleteJuiceInitial extends DeleteJuiceState {}

final class DeleteJuiceLoading extends DeleteJuiceState {}

final class DeleteJuiceError extends DeleteJuiceState {
  final String errMessage;
  DeleteJuiceError({required this.errMessage});
}

final class DeleteJuiceSuccess extends DeleteJuiceState {
  final String message;
  DeleteJuiceSuccess({required this.message});
}
