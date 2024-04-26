import 'package:daleel_store/app/core/utils/exports.dart';

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
                        padding: EdgeInsets.only(
                            bottom: 120,
                            right: DeviceUtils.isPortraitOrientation(context)
                                ? 24
                                : 56,
                            left: DeviceUtils.isPortraitOrientation(context)
                                ? 24
                                : 56),
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
