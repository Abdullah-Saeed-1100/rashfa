import 'package:flutter/material.dart';

import '../models/juice_model.dart';

class ItemCard extends StatelessWidget {
  // final void Function()? onTap;
  final JuiceModel juiceModel;
  const ItemCard({super.key, required this.juiceModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // same color background in theme
        color: const Color(0xFF212325),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      // ================  content for Container ===============
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================  image ===============
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ItemInfo(juiceModel: juiceModel),
              //   ),
              // );
            },
            child: Center(
              child: Image.network(
                // juiceModel.imageUrl,
                "https://res.cloudinary.com/dm9jjz6qz/image/upload/v1750492056/Espresso_jgwt1g.png",
                // مايحتاج عرض تشل العرض حقها لأننا عطيناها contain
                // width: 120,
                alignment: AlignmentDirectional.center,
                height: 130,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10),
          // ================  Name Product ===============
          Text(
            juiceModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          //
          const SizedBox(height: 8),
          // ==============   Description Product =============
          Text(
            juiceModel.description,
            style: const TextStyle(fontSize: 14, color: Colors.white60),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          //
          // const SizedBox(height: 13),
          Spacer(),
          // ================  row Price and Add button ===============
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xFFE57734),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "أضف الى السلة",
                  style: TextStyle(
                    fontSize: 11.5,
                    // fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                // const Icon(
                //   Icons.add,
                //   size: 20,
                //   color: Colors.white,
                // ),
              ),
              Text(
                "\$${juiceModel.price}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
