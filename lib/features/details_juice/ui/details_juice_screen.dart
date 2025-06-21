import 'package:flutter/material.dart';

import '../../../core/models/juice_model.dart';

class DetailsJuiceScreen extends StatelessWidget {
  final JuiceModel juiceModel;
  const DetailsJuiceScreen({super.key, required this.juiceModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ==================  Title  ==================
        title: const Text(
          "Rashfa",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 30,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
        // ====================  زر الحذف  =========================
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.2),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {},
          child: Icon(Icons.delete_outline_rounded, color: Colors.orange),
        ),
        // ================  Button Edit  ==============
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              child: const Icon(Icons.edit, size: 35, color: Colors.orange),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder:
                //         (context) => EditItem(juiceModel: widget.juiceModel),
                //   ),
                // );
              },
            ),
          ),
        ],
        // =============================================
      ),
      body: Column(
        children: [
          // const SizedBox(height: 30),
          // =================  Image   ==================
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              juiceModel.imageUrl!,
              fit: BoxFit.fill,
              // width: MediaQuery.of(context).size.width / 1.3,
              // height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          // =============================================
          const SizedBox(height: 20),
          // =============================================
          // ===================  Column All under Image  =================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text(
                  //   "BEST JUICE",
                  //   style: TextStyle(
                  //     color: Colors.white.withOpacity(0.4),
                  //     letterSpacing: 3,
                  //   ),
                  // ),
                  // const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${juiceModel.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        juiceModel.name,
                        style: const TextStyle(
                          fontSize: 30,
                          letterSpacing: 1,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // const SizedBox(height: 20),
                  // ==================  Description  ====================
                  Text(
                    "إنه مشروب طازج, يجعلك تشعر بالانتعاش ويساعدك على أن تعيش يوما سعيدا.",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // =============================================
                  const SizedBox(height: 15),
                  // =============================================
                  const Text(
                    "الكمية: 60 ملي",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // =============================================
                  // const SizedBox(height: 50),
                  Spacer(),
                  // =============================================
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(19),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE57334),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 50,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 50, 54, 56),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Text(
                            "أضف الى السلة",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
