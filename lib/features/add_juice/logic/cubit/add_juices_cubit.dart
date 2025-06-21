import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/juice_model.dart';
import '../../../../core/repos/juice_repo.dart';
part 'add_juices_state.dart';

class AddJuicesCubit extends Cubit<AddJuicesState> {
  final JuiceRepo juiceRepo;

  AddJuicesCubit({required this.juiceRepo}) : super(AddJuicesInitial());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  File? image;

  Future<void> addJuice() async {
    if (formstate.currentState!.validate()) {
      if (image != null) {
        emit(AddJuicesLoading());
        final result = await juiceRepo.addJuice(
          juiceModel: JuiceModel(
            name: nameController.text,
            description: "مشروب على كيف كيفك يخليك فوق النخل",
            price: int.parse(priceController.text),
            image: image!,
          ),
        );
        result.fold(
          (l) => emit(AddJuicesError(errMessage: l.message)),
          (r) => emit(AddJuicesSuccess()),
        );
      } else {
        emit(AddJuicesError(errMessage: "الرجاء قم باختيار صورة"));
      }
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    priceController.dispose();
    return super.close();
  }
}
