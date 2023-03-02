import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Componentfrom extends StatelessWidget {
  const Componentfrom({
    super.key,
    required this.text1,
    required this.controller,
    required this.textValidate,
  });

  final String text1;
  // final String text2;
  final String textValidate;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/icon.svg',
              height: 20,
              width: 20,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text1,
              style: const TextStyle(fontSize: 16, height: 1.2),
            )
          ],
        ),
        const SizedBox(
          height: 9,
        ),
        SizedBox(
          height: textValidate.isNotEmpty ? 88 : 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFFFFF).withAlpha(128),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(128, 162, 167, 181))),
                // child: Material(
                //   elevation: 4,
                //   shadowColor: const Color(0xff000000).withOpacity(0.16),
                child: TextFormField(
                  minLines: 2,
                  maxLines: 2,
                  controller: controller,
                  // initialValue: text2,
                  style: const TextStyle(fontSize: 16, height: 1.2),

                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0)),
                  // decoration: const InputDecoration(
                  //   contentPadding: EdgeInsets.only(top: 10, left: 16),
                  //   border: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.transparent, width: 2)),
                  // ),
                  // ),
                ),
              ),
              textValidate.isNotEmpty
                  ? const SizedBox(
                      height: 10,
                    )
                  : Container(),
              textValidate.isNotEmpty
                  ? Text(
                      textValidate,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.red, height: 1.2),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }

  // Future void show
}
