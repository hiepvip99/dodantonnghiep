import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/screen/datatable2_testscreen.dart';
import 'package:getx_1/screen/screen.dart';
import 'package:getx_1/screen/testdaynha.dart';
import 'package:getx_1/test_get/screen/admin/admin_home_screen.dart';
import 'package:getx_1/test_get/screen/sign_up.dart';
import 'package:getx_1/test_get/screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screen/custom_datatable_tessttttttttt.dart';
import 'test_get/controller/page_controller.dart';
import 'package:getx_1/screen/testexpansion.dart';
import 'package:getx_1/screen/hero_animation/test_hero.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    home: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => MyPageController(),
      )
    ], child: const HomeAdminScreen()),
  ));
  // runApp(MaterialApp(
  //   home: const TestScreen(),
  //   theme: ThemeData(
  //       textTheme: GoogleFonts.notoSansTextTheme(),
  //       appBarTheme: const AppBarTheme(
  //           backgroundColor: Colors.white, foregroundColor: Colors.blue)),
  // ));
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//       home: Scaffold(
//     // body: ExpandableTable(
//     //     rows: List.generate(
//     //         20,
//     //         (index) => DataRow(cells: [
//     //               DataCell(Text('$index')),
//     //               DataCell(Text('$index')),
//     //               DataCell(Text('$index'))
//     //             ]))),
//     body: Test(),
//   )));
//   // runApp(MaterialApp(
//   //     home: Scaffold(
//   //   body: Theme(
//   //     data: ThemeData(dividerColor: Colors.transparent),
//   //     child: PaginatedDataTable(
//   //       header: const Text('Example'),
//   //       columns: const [
//   //         DataColumn(label: SizedBox(width: 10, child: Text('Column 1'))),
//   //         DataColumn(label: Text('Column 2')),
//   //       ],
//   //       source: MyDataTableSource(),
//   //       columnSpacing: 0,
//   //       horizontalMargin: 20,
//   //       rowsPerPage: 3,
//   //     ),
//   //   ),
//   // )));
// }

// void main() {
//   runApp(const MyApp());
// }
// void main() {
//   runApp(const MyAppTable());
// }
