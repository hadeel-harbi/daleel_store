import 'dart:ui';
import 'package:daleel_store/app/core/utils/exports.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Drawer(
          backgroundColor: AppColors.light.withOpacity(0.9),
          elevation: 0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 54, bottom: 16),
                child: ListTile(
                  title: Text(
                    'القائمة الرئيسية',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.primary, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              for (final item in drawerItems)
                DrawerListItem(item["text"], item["icon"]),
              SizedBox(
                height: AppSpaces.screenHeight(context) * 0.3,
              ),
              const DrawerListItem("تسجيل الخروج", AppIcons.logout)
            ],
          ),
        ),
      ),
    );
  }
}
