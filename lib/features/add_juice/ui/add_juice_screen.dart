import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashfa/core/services/get_it_service.dart';
import 'package:rashfa/features/add_juice/ui/widgets/add_juice_screen_body.dart';
import '../../../core/repos/juice_repo.dart';
import '../logic/cubit/add_juices_cubit.dart';

class AddJuiceScreen extends StatelessWidget {
  const AddJuiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddJuicesCubit(juiceRepo: getIt.get<JuiceRepo>()),
      child: Scaffold(
        // ================================ App Bar ===================
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
        // =========================  Body  =======================
        body: AddJuiceScreenBody(),
      ),
    );
  }
}
