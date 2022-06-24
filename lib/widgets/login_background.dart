// Login background
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  const LoginBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [const BottomContainer(), const Banner(), child]);
  }
}

class Banner extends StatelessWidget {
  const Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    const icon = Icon(
      Icons.account_circle_sharp,
      size: 130,
      color: Colors.white,
    );
    return Container(
      height: size * 0.4,
      width: double.infinity,
      color: Colors.indigo,
      child: icon,
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container();
}
