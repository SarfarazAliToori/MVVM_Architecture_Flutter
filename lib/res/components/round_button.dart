import 'package:flutter/material.dart';
import 'package:flutter_mvvm_archetecture/res/app_colors.dart';

class RoundButton extends StatelessWidget {
  final title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {super.key,
      required this.title,
      required this.loading,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
          ),
        ),
      ),
      onTap: onPress,
    );
  }
}
