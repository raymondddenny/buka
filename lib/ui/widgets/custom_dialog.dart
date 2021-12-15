import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      this.title = 'Dialog title',
      this.subtitle = 'Dialog subtitle',
      this.imagePath,
      this.child,
      this.isDismissible = true})
      : super(key: key);
  final String title;
  final String subtitle;
  final String? imagePath;
  final Widget? child;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (imagePath != null) ...[
                  Column(
                    children: [
                      Image.asset(
                        imagePath!,
                        width: 100,
                        height: 86,
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  )
                ],
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade300),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                child ?? SizedBox(),
              ],
            ),
          ),
        ),
        if (isDismissible) ...[
          GestureDetector(
            onTap: () {},
            child: Text(
              'Click anywhere to dissmiss',
              style: TextStyle(color: Colors.grey.shade300),
            ),
          )
        ]
      ],
    );
  }
}
