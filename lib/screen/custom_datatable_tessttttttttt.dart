// import 'package:flutter/material.dart';

// class CustomDataTable extends StatelessWidget {
//   CustomDataTable({super.key});

//   final List<int> _list = List.generate(50, (index) => index);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 30,
//                 color: Colors.green,
//                 child: const SizedBox(
//                   width: 50,
//                   child: Text('col data1'),
//                 ),
//               ),
//               Container(
//                 height: 30,
//                 color: Colors.amber,
//                 child: const SizedBox(
//                   width: 50,
//                   child: Text('col data2'),
//                 ),
//               ),
//               Container(
//                 height: 30,
//                 color: Colors.red,
//                 child: const SizedBox(
//                   width: 50,
//                   child: Text('col data3'),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Column(
//             children: _list
//                 .map((e) => Row(
//                       children: [
//                         Container(
//                           height: 30,
//                           color: Colors.green,
//                           child: SizedBox(
//                             width: 50,
//                             child: Text('data $e'),
//                           ),
//                         ),
//                         Container(
//                           height: 30,
//                           color: Colors.amber,
//                           child: SizedBox(
//                             width: 50,
//                             child: Text('data $e'),
//                           ),
//                         ),
//                         Container(
//                           height: 30,
//                           color: Colors.red,
//                           child: SizedBox(
//                             width: 50,
//                             child: Text('data $e'),
//                           ),
//                         ),
//                       ],
//                     ))
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomDataTableCell extends DataCell {
  // final Widget child;

  const CustomDataTableCell(super.child);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Center(
        child: SizedBox(
          // width: double.infinity,
          // height: ,
          child: child,
        ),
      ),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  List<int> test = List.generate(20, (index) => index);
  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        CustomDataTableCell(
          SizedBox(width: 10, child: Text('Data ${test[index]}')),
        ),
        CustomDataTableCell(
          Text('Data ${test[index] * 2}'),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => test.length;

  @override
  int get selectedRowCount => 0;
}
