import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashfa/features/add_juice/logic/cubit/add_juices_cubit.dart';

import '../../../home/logic/cubit/fetch_all_juices_cubit.dart';

class ButtonAddJuice extends StatelessWidget {
  const ButtonAddJuice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddJuicesCubit, AddJuicesState>(
      listener: (context, state) {
        if (state is AddJuicesSuccess) {
          context.read<FetchAllJuicesCubit>().fetchAllJuices();
          Navigator.pop(context, true);
        }
        if (state is AddJuicesError) {
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
              state is AddJuicesLoading
                  ? null
                  : () async {
                    context.read<AddJuicesCubit>().addJuice();
                  },
          child:
              state is AddJuicesLoading
                  ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 4,
                    ),
                  )
                  : const Text(
                    "إضافة",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
        );
      },
    );
  }
}
