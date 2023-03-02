// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_1/screen/custom_datatable_tessttttttttt.dart';

// class MyCustomTable extends StatefulWidget {
//   const MyCustomTable({super.key});

//   @override
//   State<MyCustomTable> createState() => _MyCustomTableState();
// }

// class _MyCustomTableState extends State<MyCustomTable> {
//   var isExpanded = false.obs;
//   var rows = <DataRow>[
//     DataRow(cells: CustomDataTableCell)
//   ].obs;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         horizontalMargin: 0,
//         columnSpacing: 5,
//         columns: const [
//           DataColumn(label: Text('')),
//           DataColumn(label: Text('Column 1')),
//           DataColumn(label: Text('Column 2')),
//           DataColumn(label: Text('Column 3')),
//         ],
//         rows: rows.value,
//       ),
//     );
//   }
// }

// class CustomDataRow extends DataRow{
//   CustomDataRow({required super.cells});

//   Widget build(BuildContext context){
//     return
//   }
// }

import 'package:flutter/material.dart';
import 'package:getx_1/screen/custom_datatable_tessttttttttt.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Map<int, List<int>> mapp = {};
  Map<int, List<int>> test = {
    1: [2, 3, 9],
    4: [5, 6, 7]
  };

  @override
  void initState() {
    super.initState();
    mapp = test;
  }

  var isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DataTable(
          columnSpacing: 5,
          horizontalMargin: 0,
          columns: [
            DataColumn(
                label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (isExpanded) {
                          test = {};
                        } else {
                          test = mapp;
                        }
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: Icon(isExpanded
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down)),
                // const Text('label'),
              ],
            )),
            const DataColumn(label: Text('label')),
            const DataColumn(label: Text('label')),
            const DataColumn(label: Text('label')),
            const DataColumn(label: Text('label')),
          ],
          rows: test.entries
              .map((e) => DataRow(cells: [
                    const DataCell(Text('')),
                    DataCell(Text(e.value[0].toString())),
                    DataCell(Text(e.value[1].toString())),
                    DataCell(Text(e.value[2].toString())),
                    DataCell(IconButton(
                        onPressed: () {
                          setState(() {
                            test.remove(e.key);
                            mapp.remove(e.key);
                          });
                        },
                        icon: const Icon(Icons.close))),
                  ]))
              .toList(),
        ),
      ],
    );
    // return SafeArea(
    //   child: Column(
    //     children: [
    //       InkWell(
    //         onTap: () {
    //           setState(() {
    //             isExpanded = !isExpanded;
    //           });
    //         },
    //         child: Row(
    //           children: [
    //             SizedBox(
    //               width: 50,
    //               height: 50,
    //               child: Icon(
    //                 isExpanded
    //                     ? Icons.keyboard_arrow_up
    //                     : Icons.keyboard_arrow_down,
    //                 color: Colors.blue,
    //               ),
    //             ),
    //             const Expanded(child: Text('data')),
    //             const Expanded(child: Text('data')),
    //             const Expanded(child: Text('data')),
    //           ],
    //         ),
    //       ),
    //       isExpanded
    //           ? Column(
    //               children: List.generate(
    //                   5,
    //                   (index) => Column(
    //                         children: [
    //                           Divider(
    //                             height: 1,
    //                             color: Colors.grey.shade300,
    //                           ),
    //                           Row(
    //                             children: const [
    //                               SizedBox(
    //                                 width: 50,
    //                                 height: 50,
    //                               ),
    //                               Expanded(child: Text('data')),
    //                               Expanded(child: Text('data')),
    //                               Expanded(child: Text('data')),
    //                             ],
    //                           ),
    //                         ],
    //                       )),
    //             )
    //           : const SizedBox(),
    //     ],
    //   ),
    // );
  }
}
