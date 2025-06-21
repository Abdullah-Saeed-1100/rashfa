import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../logic/cubit/add_juices_cubit.dart';

class BoxPickerImage extends StatefulWidget {
  const BoxPickerImage({super.key});

  @override
  State<BoxPickerImage> createState() => _BoxPickerImageState();
}

class _BoxPickerImageState extends State<BoxPickerImage> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            context.read<AddJuicesCubit>().image != null
                ? Colors.green.shade900
                : Colors.green.shade200,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: () async {
        final ImagePicker imagePicker = ImagePicker();
        final XFile? imageGallery = await imagePicker.pickImage(
          source: ImageSource.gallery,
        );
        if (imageGallery != null) {
          context.read<AddJuicesCubit>().image = File(imageGallery.path);
          setState(() {});
        }
      },
      child: Text(
        "إضافة صورة من المعرض",
        style: TextStyle(
          color:
              context.read<AddJuicesCubit>().image != null
                  ? Colors.white
                  : Colors.black87,
          fontSize: 20,
        ),
      ),
    );
  }
}
