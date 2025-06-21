import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rashfa/features/details_juice/logic/update_juice_cubit/update_juice_cubit.dart';
import '../../../add_juice/logic/cubit/add_juices_cubit.dart';

class BoxPickerImageForUpdateScreen extends StatefulWidget {
  final String imageUrl;
  const BoxPickerImageForUpdateScreen({super.key, required this.imageUrl});

  @override
  State<BoxPickerImageForUpdateScreen> createState() =>
      _BoxPickerImageForUpdateScreenState();
}

class _BoxPickerImageForUpdateScreenState
    extends State<BoxPickerImageForUpdateScreen> {
  bool isSelectedImage = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelectedImage ? Colors.green.shade900 : Colors.green.shade200,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: () async {
        final ImagePicker imagePicker = ImagePicker();
        final XFile? imageGallery = await imagePicker.pickImage(
          source: ImageSource.gallery,
        );
        if (imageGallery != null) {
          context.read<UpdateJuiceCubit>().image = File(imageGallery.path);
          isSelectedImage = true;
          setState(() {});
        }
      },
      child: Text(
        "إضافة صورة من المعرض",
        style: TextStyle(
          color: isSelectedImage ? Colors.white : Colors.black87,
          fontSize: 20,
        ),
      ),
    );
  }
}
