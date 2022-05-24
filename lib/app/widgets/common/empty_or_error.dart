import 'package:flutter/material.dart';

class EmptyErrorWidget extends StatelessWidget {
  const EmptyErrorWidget({
    Key? key,
    this.image,
    this.title = 'Nothing found',
    this.content = "Look like you haven't added any item yet",
    this.widgetImage,
    this.icon,
  }) : super(key: key);
  final String? image;
  final String title;
  final String content;
  final Widget? widgetImage;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        final height = constraints.maxHeight;
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: height,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (icon != null)
                  Icon(
                    icon!,
                    size: height * 0.2,
                    color: Theme.of(context).textTheme.caption!.color,
                  ),
                if (widgetImage != null) widgetImage!,
                if (image != null)
                  Image.asset(
                    image!,
                    width: height * 0.4,
                    height: height * 0.4,
                  ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: height * .04,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: height * .02,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
