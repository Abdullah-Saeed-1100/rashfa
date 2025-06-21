import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/juice_model.dart';
import '../../../../core/repos/juice_repo.dart';
part 'update_juice_state.dart';

class UpdateJuiceCubit extends Cubit<UpdateJuiceState> {
  final JuiceRepo juiceRepo;
  UpdateJuiceCubit({required this.juiceRepo}) : super(UpdateJuiceInitial());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  late final int id;
  late final String imageUrl;
  File? image;

  Future<void> updateJuice() async {
    if (formstate.currentState!.validate()) {
      emit(UpdateJuiceLoading());
      final result = await juiceRepo.updateJuice(
        juiceModel: JuiceModel(
          id: id,
          name: nameController.text,
          description: "مشروب على كيف كيفك يخليك فوق النخل",
          price: int.parse(priceController.text),
          image: image,
          imageUrl: imageUrl,
        ),
      );
      result.fold(
        (l) => emit(UpdateJuiceError(errMessage: l.message)),
        (r) => emit(UpdateJuiceSuccess(message: r)),
      );
    } else {
      emit(UpdateJuiceError(errMessage: "الرجاء قم باختيار صورة"));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    priceController.dispose();
    return super.close();
  }
}
