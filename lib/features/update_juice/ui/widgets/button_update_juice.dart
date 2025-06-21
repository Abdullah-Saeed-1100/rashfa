import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashfa/features/details_juice/logic/update_juice_cubit/update_juice_cubit.dart';
import '../../../home/logic/cubit/fetch_all_juices_cubit.dart';

class ButtonUpdateJuice extends StatelessWidget {
  const ButtonUpdateJuice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateJuiceCubit, UpdateJuiceState>(
      listener: (context, state) {
        if (state is UpdateJuiceSuccess) {
          context.read<FetchAllJuicesCubit>().fetchAllJuices();
          Navigator.pop(context);
          Navigator.pop(context);
        }
        if (state is UpdateJuiceError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[800],
            disabledBackgroundColor: Colors.orange[800],
            padding: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed:
              state is UpdateJuiceLoading
                  ? null
                  : () async {
                    context.read<UpdateJuiceCubit>().updateJuice();
                  },
          child:
              state is UpdateJuiceLoading
                  ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 4,
                    ),
                  )
                  : const Text(
                    "تحديث",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
        );
      },
    );
  }
}
