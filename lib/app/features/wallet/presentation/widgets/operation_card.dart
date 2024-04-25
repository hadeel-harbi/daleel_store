import 'package:daleel_store/app/core/utils/exports.dart';

class OperationCard extends StatefulWidget {
  const OperationCard({
    super.key,
    required this.operation,
  });
  final Operation operation;

  @override
  State<OperationCard> createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        width: AppSpaces.screenWidth(context),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff6E7588).withOpacity(0.09),
                blurRadius: 40,
                spreadRadius: 8,
                offset: const Offset(1, 5))
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  decoration: BoxDecoration(
                      color: widget.operation.type == "outcome"
                          ? AppColors.secondaryRed
                          : AppColors.secondaryGreen,
                      shape: BoxShape.circle),
                  child: Center(
                    child: IconSvg(
                      widget.operation.type == "outcome"
                          ? AppIcons.outcome
                          : AppIcons.income,
                      color: AppColors.light,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppSpaces.screenWidth(context) * 0.45,
                  child: Text(
                    widget.operation.name ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Spacer(),
                Text(
                  widget.operation.amount ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: widget.operation.type == "outcome"
                            ? AppColors.secondaryRed
                            : AppColors.secondaryGreen,
                      ),
                ),
              ],
            ),
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                reverseDuration: const Duration(milliseconds: 200),
                switchInCurve: Curves.elasticOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return SizeTransition(
                    axisAlignment: -1,
                    sizeFactor: animation,
                    child: child,
                  );
                },
                child: isExpanded
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppSpaces.height8,
                          OperationDetails(
                            label: "تاريخ العملية",
                            content: "24 - 11 - 2023",
                          ),
                          OperationDetails(
                            label: "رقم الطلب",
                            content: "MFB2732BCW7",
                          ),
                          OperationDetails(
                            label: "عدد النقاط",
                            content: "50",
                          ),
                          OperationDetails(
                            label: "اسم البرنامج",
                            content: "برنامج أكثر",
                          ),
                          AppSpaces.height8,
                        ],
                      )
                        .animate()
                        .fadeIn(delay: const Duration(milliseconds: 100))
                    : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
