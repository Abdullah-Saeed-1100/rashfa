import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashfa/core/helper_functions/valid.dart';
import 'package:rashfa/core/widgets/customtextformfiled.dart';
import 'package:rashfa/features/add_juice/logic/cubit/add_juices_cubit.dart';
import 'package:rashfa/features/add_juice/ui/widgets/box_picker_image.dart';
import 'package:rashfa/features/add_juice/ui/widgets/button_add_juice.dart';

class AddJuiceScreenBody extends StatelessWidget {
  const AddJuiceScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final addJuiceCubit = context.read<AddJuicesCubit>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: addJuiceCubit.formstate,
        child: ListView(
          children: [
            // ====================== حقل الادخال الاول  ===========
            CustomTextFormFiled(
              hint: "اسم المشروب",
              icon: const Icon(Icons.local_drink_rounded),
              myCcontroller: addJuiceCubit.nameController,
              myValid: (val) {
                return validInput(val!, 1, 20);
              },
              typeKeyword: TextInputType.name,
            ),
            const SizedBox(height: 10),
            // ====================== حقل الادخال الثاني  ===========
            CustomTextFormFiled(
              hint: "السعر",
              icon: const Icon(Icons.attach_money_rounded),
              myCcontroller: addJuiceCubit.priceController,
              myValid: (val) {
                return validInput(val!, 1, 3);
              },
              typeKeyword: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // ================  زر اضافه الصورة مع المعرض==================
            BoxPickerImage(),
            const SizedBox(height: 20),
            // ===================== زر الاضافه  =====================
            ButtonAddJuice(),
          ],
        ),
      ),
    );
  }
}
