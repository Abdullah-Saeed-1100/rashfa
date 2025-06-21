import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/repos/juice_repo.dart';

part 'delete_juice_state.dart';

class DeleteJuiceCubit extends Cubit<DeleteJuiceState> {
  final JuiceRepo juiceRepo;
  DeleteJuiceCubit({required this.juiceRepo}) : super(DeleteJuiceInitial());

  Future<void> deleteJuice({required int id}) async {
    emit(DeleteJuiceLoading());
    final result = await juiceRepo.deleteJuice(id: id);
    result.fold(
      (l) => emit(DeleteJuiceError(errMessage: l.message)),
      (r) => emit(DeleteJuiceSuccess(message: r)),
    );
  }
}
