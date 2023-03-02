import 'package:flutter/material.dart';
import 'package:getx_1/component/appbar_custom.dart';
import 'package:getx_1/component/button_bottom_bar.dart';
import 'package:getx_1/component/component_from.dart';
import 'package:getx_1/component/popup_dialog.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController t1 =
      TextEditingController(text: '作成したQRは、QR受付対応施設ならどこでも使えます。');
  TextEditingController t2 =
      TextEditingController(text: 'このサービスは入場をスムーズにするためのものです。避難所の予約はできません。');
  TextEditingController t3 =
      TextEditingController(text: 'QR受付に対応している避難所で係員にご掲示ください。');

  String vd1 = '';
  String vd2 = '';
  String vd3 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 45, left: 40, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '住民側の各画面に表示される住民向けのメッセージを設定できます。',
                    style: TextStyle(fontSize: 16, height: 1.2),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Componentfrom(
                          textValidate: vd1,
                          controller: t1,
                          text1: 'QR発行前テキスト',
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Componentfrom(
                          textValidate: vd2,
                          controller: t2,
                          text1: 'QR発行前強調テキスト',
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Componentfrom(
                          textValidate: vd3,
                          controller: t3,
                          text1: 'QR発行後テキスト',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtonBar(
        validate: validation,
      ),
    );
  }

  bool validation() {
    bool trong = false;
    if (t1.value.text == '' || t1.value.text.isEmpty) {
      setState(() {
        vd1 = "*フィールドは必須項目です。";
      });
      trong = true;
    } else {
      setState(() {
        vd1 = '';
      });
    }

    if (t3.value.text == '' || t3.value.text.isEmpty) {
      setState(() {
        vd3 = "*フィールドは必須項目です。";
      });
      trong = true;
    } else {
      setState(() {
        vd3 = '';
      });
    }
    if (t2.value.text == '' || t2.value.text.isEmpty) {
      setState(() {
        vd2 = "*フィールドは必須項目です。";
      });
      trong = true;
    } else {
      setState(() {
        vd2 = '';
      });
    }
    if (trong) {
      return false;
    }

    showDialog(
      context: context,
      builder: (context) {
        return PopupDialog(
          text: t1.value.text,
          text2: t2.value.text,
          text3: t3.value.text,
        );
      },
    );
    return true;
  }
}
