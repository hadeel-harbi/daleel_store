import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/features/home/presentation/widgets/title_row.dart';
import 'package:daleel_store/app/features/wallet/domin/models/operation_model.dart';
import 'package:daleel_store/app/features/wallet/domin/repositories/operations_repository.dart';
import 'package:daleel_store/app/features/wallet/presentation/widgets/background_container.dart';
import 'package:daleel_store/app/features/wallet/presentation/widgets/balance_card.dart';
import 'package:daleel_store/app/features/wallet/presentation/widgets/operation_card.dart';
import 'package:daleel_store/app/features/wallet/presentation/widgets/wallet_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  List<Operation> operations = [];
  @override
  void initState() {
    operations = OperationsRepository().getOperations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryGreen,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Column(
                children: [
                  WalletHeader(),
                  BalanceCard(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 290,
                  ),
                  BackgroundContainer(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TitleRow(
                        headline: "سجل العمليات",
                        subtitle: "مشاهدة الكل",
                      ),
                    ),
                    if (operations.isEmpty)
                      Center(
                        child: Text(
                          "لا توجد عمليات الآن",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColors.dark.withOpacity(0.5)),
                        ),
                      )
                    else
                      ListView.separated(
                        padding: const EdgeInsets.only(
                            bottom: 120, right: 24, left: 24),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: operations.length,
                        itemBuilder: (context, index) => OperationCard(
                                operation: operations[index])
                            .animate()
                            .addEffect(const Effect(
                                curve: Curves.elasticOut,
                                duration: Duration(milliseconds: 1000)))
                            .slideY(
                                begin: 1,
                                duration: const Duration(milliseconds: 1000)),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 12,
                        ),
                      )
                  ]),
                ],
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                color: AppColors.secondaryGreen,
                child: const WalletHeader())
          ],
        ),
      ),
    );
  }
}
