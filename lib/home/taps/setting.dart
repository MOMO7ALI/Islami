import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../bottom_sheets/language_bottom_sheet.dart';
import '../bottom_sheets/theme_bootom_sheet.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("theme".tr()),
          SizedBox(height: 12),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: false,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return ThemeBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: primaryColor),
              ),
              child: Text(
                provider.mode == ThemeMode.light ? 'light'.tr() : 'dark'.tr(),
              ),
            ),
          ),
          SizedBox(height: 44),
          Text("language".tr()),
          SizedBox(height: 12),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: false,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return LanguageBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: primaryColor),
              ),
              child: Text(
                context.locale.languageCode == 'ar' ? 'arabic'.tr() : 'english'.tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
