import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashfa/core/repos/juice_repo.dart';

import '../../../../core/models/juice_model.dart';

part 'fetch_all_juices_state.dart';

class FetchAllJuicesCubit extends Cubit<FetchAllJuicesState> {
  final JuiceRepo juiceRepo;
  FetchAllJuicesCubit({required this.juiceRepo})
    : super(FetchAllJuicesInitial());

  Future<void> fetchAllJuices() async {
    emit(FetchAllJuicesLoading());
    final result = await juiceRepo.getAllJuices();
    result.fold(
      (l) => emit(FetchAllJuicesFailure(errMessage: l.message)),
      (r) => emit(FetchAllJuicesSuccess(juices: r)),
    );
  }
}
