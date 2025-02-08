import 'package:flutter/material.dart';
import 'package:qoute_train/config/locale/app_localizations.dart';
import 'package:qoute_train/core/utils/app_colors.dart';
import 'package:qoute_train/core/utils/media_query_values.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorScreen({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_sharp,
            color: AppColors.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            AppLocalizations.of(context)!.translate('something_went_wrong')!,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            AppLocalizations.of(context)!.translate('try_again')!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 55,
          width: context.width * 0.55,
          child: ElevatedButton(
            onPressed: () => onPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child:  Text(
              AppLocalizations.of(context)!.translate('reload_screen')!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
