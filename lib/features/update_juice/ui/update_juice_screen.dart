import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashfa/core/models/juice_model.dart';
import 'package:rashfa/features/details_juice/ui/widgets/box_picker_image_for_update_screen.dart';
import 'package:rashfa/features/update_juice/ui/widgets/button_update_juice.dart';

import '../../../core/helper_functions/valid.dart';
import '../../../core/widgets/customtextformfiled.dart';
import '../../details_juice/logic/update_juice_cubit/update_juice_cubit.dart';

class UpdateJuiceScreen extends StatefulWidget {
  final JuiceModel juiceModel;
  const UpdateJuiceScreen({super.key, required this.juiceModel});

  @override
  State<UpdateJuiceScreen> createState() => _UpdateJuiceScreenState();
}

class _UpdateJuiceScreenState extends State<UpdateJuiceScreen> {
  @override
  void initState() {
    _initialJuiceData(
      JuiceModel(
        id: widget.juiceModel.id,
        name: widget.juiceModel.name,
        description: widget.juiceModel.description,
        price: widget.juiceModel.price,
        imageUrl: widget.juiceModel.imageUrl,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final updateJuiceCubit = context.read<UpdateJuiceCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rashfa",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 30,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.2),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: updateJuiceCubit.formstate,
            child: ListView(
              children: [
                // =============================================
                const SizedBox(height: 20),
                // =============================================
                BoxPickerImageForUpdateScreen(
                  imageUrl: widget.juiceModel.imageUrl!,
                ),

                // =============================================
                const SizedBox(height: 55),
                // =============  Text Form Filed  =============
                CustomTextFormFiled(
                  hint: "اسم المشروب",
                  icon: const Icon(Icons.title_rounded),
                  myCcontroller: updateJuiceCubit.nameController,
                  myValid: (val) {
                    return validInput(val!, 1, 20);
                  },
                  typeKeyword: TextInputType.name,
                ),
                const SizedBox(height: 10),
                CustomTextFormFiled(
                  hint: "السعر",
                  icon: const Icon(Icons.attach_money_rounded),
                  myCcontroller: updateJuiceCubit.priceController,
                  myValid: (val) {
                    return validInput(val!, 1, 3);
                  },
                  typeKeyword: TextInputType.number,
                ),
                // =============================================
                const SizedBox(height: 60),
                // =============================================
                ButtonUpdateJuice(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _initialJuiceData(JuiceModel juiceModel) {
    context.read<UpdateJuiceCubit>().id = juiceModel.id!;
    context.read<UpdateJuiceCubit>().nameController.text = juiceModel.name;
    context.read<UpdateJuiceCubit>().priceController.text =
        juiceModel.price.toString();
    context.read<UpdateJuiceCubit>().imageUrl = juiceModel.imageUrl!;
  }
}
