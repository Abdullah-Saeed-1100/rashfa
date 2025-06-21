part of 'add_juices_cubit.dart';

@immutable
sealed class AddJuicesState {}

final class AddJuicesInitial extends AddJuicesState {}

final class AddJuicesLoading extends AddJuicesState {}

final class AddJuicesSuccess extends AddJuicesState {}

final class AddJuicesError extends AddJuicesState {
  final String errMessage;
  AddJuicesError({required this.errMessage});
}
