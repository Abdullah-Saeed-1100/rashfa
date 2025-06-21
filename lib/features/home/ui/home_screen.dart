import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashfa/core/services/get_it_service.dart';

import '../../../core/repos/juice_repo.dart';
import '../../../core/widgets/item_card.dart';
import '../logic/cubit/fetch_all_juices_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FetchAllJuicesCubit(juiceRepo: getIt.get<JuiceRepo>())
                ..fetchAllJuices(),
      child: Scaffold(
        // ====================  Button Add + ========================
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.green,
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.add, size: 35),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const AddItem()),
            // );
          },
        ),
        // ======================  App Bar  ======================
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
          automaticallyImplyLeading: false,
        ),
        // ======================  Body  ===========================
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // textDirection: TextDirection.rtl,
                children: [
                  // ========================  Text  =========================
                  const Center(
                    child: Text(
                      "برّد على قلبك",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  // =========   الخط   =======
                  const Divider(
                    indent: 60,
                    endIndent: 60,
                    thickness: 5,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 40),
                  // ======================  Name List  =======================
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: const [
                        Icon(Icons.filter_list, size: 25, color: Colors.white),
                        Text(
                          "  جميع العصائر",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 0,
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  // ========================  FutureBuilder  ================
                  BlocBuilder<FetchAllJuicesCubit, FetchAllJuicesState>(
                    builder: (context, state) {
                      if (state is FetchAllJuicesLoading) {
                        return Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                              backgroundColor: Colors.orange[100],
                            ),
                          ),
                        );
                      } else if (state is FetchAllJuicesSuccess) {
                        // Replace 'snapshot' with 'state' and fix closing brackets
                        return state.juices.isEmpty
                            ? Padding(
                              padding: EdgeInsets.only(top: 200),
                              child: Center(
                                child: Text(
                                  "لا يوجد عصائر",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            )
                            : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  state
                                      .juices
                                      .length, // Assuming state has a 'juices' list
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: (1 / 1.60),
                                    crossAxisCount: 2, // Number of columns
                                    mainAxisSpacing:
                                        8.0, // Spacing between rows
                                    crossAxisSpacing:
                                        8.0, // Spacing between columns
                                  ),
                              itemBuilder: (context, index) {
                                return ItemCard(
                                  juiceModel: state.juices[index],
                                );
                              },
                            );
                      } else if (state is FetchAllJuicesFailure) {
                        return Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: Center(
                            child: Text(
                              "فشل الاتصال",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
