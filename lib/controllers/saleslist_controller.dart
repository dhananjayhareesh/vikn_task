import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SalesController extends GetxController {
  final salesList = <Map<String, dynamic>>[].obs;
  final filteredSalesList = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final isLastPage = false.obs;
  final currentPage = 1.obs;
  final totalItems = 0.obs;
  final itemsPerPage = 10;
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<void> fetchSales({bool isRefresh = false}) async {
    if (isLoading.value) return;

    isLoading.value = true;
    if (isRefresh) {
      currentPage.value = 1;
      isLastPage.value = false;
      salesList.clear();
      filteredSalesList.clear();
    }

    try {
      String? accessToken = await secureStorage.read(key: 'accessToken');
      String? userId = await secureStorage.read(key: 'userId');

      if (accessToken == null || userId == null) {
        Get.snackbar('Error', 'Access token or user ID not found');
        return;
      }

      final response = await http.post(
        Uri.parse(
            'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          "BranchID": 1,
          "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
          "CreatedUserID": int.parse(userId),
          "PriceRounding": 2,
          "page_no": currentPage.value,
          "items_per_page": itemsPerPage,
          "type": "Sales",
          "WarehouseID": 1,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['StatusCode'] == 6000) {
          List<Map<String, dynamic>> salesData =
              List<Map<String, dynamic>>.from(data['data']);
          salesList.addAll(salesData);
          filteredSalesList.addAll(salesData);

          totalItems.value = data['total_count'];
          isLastPage.value = salesList.length >= totalItems.value;
          currentPage.value++;
        } else {
          Get.snackbar('Error', 'Failed to fetch sales data');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  void searchSales(String query) {
    if (query.isEmpty) {
      filteredSalesList.assignAll(salesList);
    } else {
      filteredSalesList.assignAll(
        salesList.where((sale) =>
            sale['VoucherNo'].toString().contains(query) ||
            sale['CustomerName']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase())),
      );
    }
  }

  @override
  void onInit() {
    fetchSales();
    super.onInit();
  }
}
