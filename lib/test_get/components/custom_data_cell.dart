import 'package:flutter/material.dart';

class CustomDataCell extends StatelessWidget {
  const CustomDataCell({
    super.key,
    required this.value,
    // required this.width,
  });

  // ignore: prefer_typing_uninitialized_variables
  final value;
  // final double width;
  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(0),
    //   child: ConstrainedBox(
    //     constraints: BoxConstraints(maxWidth: 20),
    //     // width: MediaQuery.of(context).size.width * 0.1,
    //     // width: width,
    //     child: Text(
    //       '${value!}',
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //   ),
    // );
    return Text(
      '${value!}',
      overflow: TextOverflow.ellipsis,
    );
  }
}
