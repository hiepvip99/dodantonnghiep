import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getx_1/test_get/model/my_page.dart';
import 'package:getx_1/test_get/screen/admin/page/account/account_manager_page.dart';
import 'package:getx_1/test_get/screen/admin/page/category/category_manager_page.dart';
import 'package:getx_1/test_get/screen/admin/page/customer/customer_manager_page.dart';
import 'package:getx_1/test_get/screen/admin/page/manufacturer/manufacturer_manager_page.dart';
import 'package:getx_1/test_get/screen/admin/page/order/order_manager_page.dart';
import 'package:getx_1/test_get/screen/admin/page/product/product_manager_page.dart';
import 'package:getx_1/test_get/screen/admin/page/staff/staff_manager_page.dart';
import 'package:getx_1/test_get/screen/admin/page/supplier/supplier_manager_page.dart';

class MyPageController with ChangeNotifier, DiagnosticableTreeMixin {
  int page = 0;

  void changePage(int value) {
    page = value;
    notifyListeners();
  }

  final List<MyPage> listManagement = [
    MyPage(
        text: 'Quản lý Tài Khoản',
        id: 1,
        icon: Icons.person,
        screen: const AccountManagerPage()),
    MyPage(
        text: 'Quản lý Danh Mục Sản Phẩm',
        id: 2,
        icon: Icons.text_snippet,
        screen: const CategoryManagerPage()),
    MyPage(
        text: 'Quản lý Khách Hàng',
        id: 3,
        icon: Icons.person_pin,
        screen: const CustomerManagerPage()),
    MyPage(
        text: 'Quản lý Đơn Hàng',
        id: 4,
        icon: Icons.assignment,
        screen: const OrderManagerPage()),
    MyPage(
        text: 'Quản lý Sản Phẩm',
        id: 5,
        icon: Icons.inventory,
        screen: const ProductManagerPage()),
    MyPage(
        text: 'Quản lý Nhân Viên',
        id: 6,
        icon: Icons.badge_outlined,
        screen: const StaffManagerPage()),
    MyPage(
        text: 'Quản lý Nhà Cung Cấp',
        id: 7,
        icon: Icons.move_to_inbox,
        screen: const SupplierManagerPage()),
    MyPage(
        text: 'Quản lý Nhà Sản Xuất',
        id: 8,
        icon: Icons.outbox,
        screen: const ManufacturerManagerPage()),
  ];
}
