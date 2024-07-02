import 'package:flutter/material.dart';
import 'package:musium/utils/utils_color.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height,width;
  final Color btnColor ,textColor;
  final bool loading;

   const SubmitButton({super.key,
      required this.title,
      required this.onPress,
      this.height=55,
      this.width=800,
      this.textColor=UtilsColor.whiteColor,
      this.btnColor =UtilsColor.primaryColor,
      this.loading=false
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(50),
          ),
        child: loading ? CircularProgressIndicator() : Center(child: Text(title,style: const TextStyle(color: UtilsColor.whiteColor,fontSize: 20),)),
      ),
    );
  }
}
