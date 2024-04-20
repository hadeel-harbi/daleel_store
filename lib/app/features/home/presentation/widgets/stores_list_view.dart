import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/features/home/data/stores_data.dart';
import 'package:daleel_store/app/features/home/data/products_data.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/store_card.dart';
import 'package:flutter/material.dart';

class StoresListView extends StatelessWidget {
  const StoresListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 16, right: 24),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: productList.length,
        itemBuilder: (context, index) => StoreCard(
          image: storesList[index]["image"],
        ),
        separatorBuilder: (context, index) => AppSpaces.width4,
      ),
    );
  }
}
