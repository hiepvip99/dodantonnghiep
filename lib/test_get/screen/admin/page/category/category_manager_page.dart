import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_1/test_get/components/data_table/category_data_table.dart';
import 'package:getx_1/test_get/controller/category_controller.dart';
import 'package:getx_1/test_get/screen/admin/page/category/add_edit_category.dart';

class CategoryManagerPage extends StatefulWidget {
  const CategoryManagerPage({super.key});

  @override
  State<CategoryManagerPage> createState() => _CategoryManagerPageState();
}

class _CategoryManagerPageState extends State<CategoryManagerPage> {
  CategoryController controllerCate = CategoryController();
  bool sort = true;
  int? column = 0;
  bool isLoading = true;

  final _keyCate = GlobalKey<PaginatedDataTableState>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    await controllerCate.initCategoryList();
    isLoading = false;
  }

  @override
  void dispose() {
    controllerCate.dispose();
    super.dispose();
  }

  void sortColumn(int columnIndex, bool ascending) {
    setState(() {
      column = columnIndex;
      sort = ascending;
    });
    switch (columnIndex) {
      case 0:
        controllerCate.sortListById(ascending);
        break;
      case 1:
        controllerCate.sortListByName(ascending);
        break;
      default:
        controllerCate.sortListById(ascending);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // ignore: invalid_use_of_protected_member
        body: controllerCate.categoryList.value.isEmpty
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isLoading
                          ? const CircularProgressIndicator()
                          : Column(
                              children: const [
                                Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                Text('Lỗi không thể lấy dữ liệu'),
                              ],
                            ),
                    ],
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text('Danh sách Danh Mục'),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: TextField(
                                      onChanged: (value) {
                                        controllerCate.searchCategory(value);
                                      },
                                      decoration: const InputDecoration(
                                        label: Text('Tìm kiếm danh mục'),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 0),
                                        // hintText: ,
                                        suffixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Tooltip(
                                          waitDuration:
                                              const Duration(seconds: 1),
                                          message: 'Thêm danh mục',
                                          child: InkWell(
                                            onTap: () async {
                                              bool response = await Get.dialog(
                                                  AddEditCategory(
                                                controllerCate: controllerCate,
                                                // save: controller.saveAccount(data),
                                                category: null,
                                              ));
                                              response
                                                  ? _keyCate.currentState!
                                                      .pageTo(controllerCate
                                                              .categoryList
                                                              .length -
                                                          1)
                                                  : null;
                                            },
                                            splashColor: Colors.blue[100],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.add_box_outlined,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Theme(
                                data:
                                    ThemeData(dividerColor: Colors.transparent),
                                child: PaginatedDataTable(
                                  key: _keyCate,
                                  rowsPerPage:
                                      (MediaQuery.of(context).size.height -
                                              254) ~/
                                          kMinInteractiveDimension,
                                  source: CategoryDataTable(
                                      controllerCate: controllerCate,
                                      categoryList:
                                          // ignore: invalid_use_of_protected_member
                                          controllerCate.categoryList.value),
                                  sortAscending: sort,
                                  sortColumnIndex: column,
                                  horizontalMargin: 10,
                                  columnSpacing: 0,
                                  columns: [
                                    DataColumn(
                                      label: const SizedBox(
                                          width: 50, child: Text('ID')),
                                      onSort: sortColumn,
                                    ),
                                    DataColumn(
                                        onSort: sortColumn,
                                        label: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: const Text(
                                              'Tên Danh Mục',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    const DataColumn(
                                        label: SizedBox(
                                            width: 80,
                                            child: Text(
                                              'Hành Động',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
