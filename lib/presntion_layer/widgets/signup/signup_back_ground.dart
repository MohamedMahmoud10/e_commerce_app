import 'package:flutter/cupertino.dart';
import 'package:shop_app/constant/image_root.dart';

class SignupBackGround extends StatelessWidget {
  final Widget child;
  const SignupBackGround({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            width: size.width * 0.50,
            child: Image.asset(AppImageAssets.signupTopPhoto),
          ),
          child
        ],
      ),
    );
  }
}
