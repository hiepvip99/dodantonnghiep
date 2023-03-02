import 'package:flutter/material.dart';

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({
    super.key,
    required this.validate,
  });

  final VoidCallback validate;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Colors.white,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: validate,
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(StadiumBorder(

                    /*
                    borderRadius: BorderRadius.circular(500)*/
                    )),
                elevation: MaterialStatePropertyAll<double>(0),
                backgroundColor:
                    MaterialStatePropertyAll<Color>(Color(0xff007AFF)),
              ),
              // Có hiệu ứng bóng khi bấm
              // style: ElevatedButton.styleFrom(
              //     elevation: 0.0,
              //     shadowColor: Colors.transparent,
              //     backgroundColor: const Color(0xff007AFF),
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20))),
              child: const SizedBox(
                height: 52,
                width: 220,
                child: Center(
                  child: Text(
                    '確定',
                    style: TextStyle(
                        fontSize: 16, height: 1.2, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
