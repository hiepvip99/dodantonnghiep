import 'package:flutter/material.dart';

class PopupDialog extends StatelessWidget {
  const PopupDialog(
      {super.key,
      required this.text,
      required this.text2,
      required this.text3});

  final String text;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(text,
                          style: const TextStyle(fontSize: 16, height: 1.2)),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(text2,
                          style: const TextStyle(fontSize: 16, height: 1.2)),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(text3,
                          style: const TextStyle(fontSize: 16, height: 1.2)),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Exit')),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
