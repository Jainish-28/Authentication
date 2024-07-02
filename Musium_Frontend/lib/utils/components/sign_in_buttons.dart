import 'package:flutter/material.dart';
import 'package:musium/utils/utils_color.dart';

class SIgnInButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height,width;
  final String img;
  final Color btnColor ,textColor;
  final bool loading;

  const SIgnInButton({super.key,
    required this.title,
    required this.onPress,
    required this.img,
    this.height=55,
    this.width=800,
    this.textColor=UtilsColor.whiteColor,
    this.btnColor =UtilsColor.secondaryBlackColor,
    this.loading=false
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 20.0,right: 20.0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: btnColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: UtilsColor.whiteColor)
          ),
          child: loading ? const CircularProgressIndicator() : Row(
            children: [
              const SizedBox(width: 50),
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(image: AssetImage(img),fit: BoxFit.cover)
                  ),
              ),
              const SizedBox(width: 20),
              Text(title,style: const TextStyle(color: UtilsColor.whiteColor,fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
