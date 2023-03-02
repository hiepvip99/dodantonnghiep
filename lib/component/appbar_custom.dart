import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: const Color(0xff000000).withAlpha(20)))),
          child: AppBar(
            titleSpacing: 0,
            elevation: 0,
            centerTitle: true,
            leadingWidth: 100,
            leading: Container(
              padding: const EdgeInsets.only(bottom: 18, top: 17),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 18,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      size: 21,
                    ),
                    SizedBox(
                      width: 14.7,
                    ),
                    Text(
                      '戻る',
                      style: TextStyle(fontSize: 16, height: 1.2),
                    ),
                  ],
                ),
              ),
            ),
            title: Container(
              padding: const EdgeInsets.only(bottom: 18, top: 17),
              child: const Text(
                '表示メッセージ',
                style:
                    TextStyle(color: Colors.black, fontSize: 16, height: 1.2),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(57);
}
