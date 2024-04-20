import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:daleel_store/app/features/home/data/partners_data.dart';
import 'package:daleel_store/app/features/home/data/products_data.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/partner_card.dart';
import 'package:flutter/material.dart';

class PartnersListView extends StatelessWidget {
  const PartnersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 16, right: 24),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: productList.length,
        itemBuilder: (context, index) => PartnerCard(
          image: partnersList[index]["image"],
        ),
        separatorBuilder: (context, index) => AppSpaces.width4,
      ),
    );
  }
}
