import 'package:flutter/material.dart';

class WFFlexibleFormBody extends StatelessWidget {
  final Widget body;
  final Widget? footer;
  final ScrollPhysics? scrollPhysics;

  const WFFlexibleFormBody(
      {Key? key, required this.body, this.footer, this.scrollPhysics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            physics: this.scrollPhysics ?? BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.minHeight,
                  maxHeight: double.infinity),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  body,
                  if (footer != null) footer!,
                ],
              ), // ,
            ),
          );
        },
      ),
    );
  }
}
