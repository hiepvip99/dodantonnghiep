// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getx_1/test_get/components/item_list_page.dart';
import 'package:getx_1/test_get/controller/page_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'ADMIN PAGE',
                      style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontFamily: GoogleFonts.roboto().fontFamily),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Chào nhân viên: NAKA'),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: context
                            .watch<MyPageController>()
                            .listManagement
                            .length,
                        itemBuilder: (context, index) {
                          return ItemList(
                            index: index,
                            text: context
                                .watch<MyPageController>()
                                .listManagement[index]
                                .text,
                            icon: context
                                .watch<MyPageController>()
                                .listManagement[index]
                                .icon,
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: context
                  .watch<MyPageController>()
                  .listManagement[context.watch<MyPageController>().page]
                  .screen),
        ],
      ),
    );
  }
}
