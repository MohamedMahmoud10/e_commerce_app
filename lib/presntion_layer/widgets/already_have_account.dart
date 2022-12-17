import 'package:flutter/material.dart';
import 'package:shop_app/constant/color.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({Key? key, this.login = true, required this.onTap})
      : super(key: key);
  final bool login;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Don\'t have an account?' : 'Already have an Account ?',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.darkHeaderClr),
        ),
        TextButton(
            onPressed: onTap,
            child: Text(login ? 'Request Now' : 'Sign in',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold)))
      ],
    );
  }
}
