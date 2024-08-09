import 'package:get/get.dart';

class FilterController extends GetxController {
  // Variables to track the selected state of each toggle
  var isSelected1 = false.obs;
  var isSelected2 = false.obs;
  var isSelected3 = false.obs;

  void toggle(int index) {
    if (index == 1) {
      isSelected1.value = !isSelected1.value;
      isSelected2.value = false;
      isSelected3.value = false;
    } else if (index == 2) {
      isSelected1.value = false;
      isSelected2.value = !isSelected2.value;
      isSelected3.value = false;
    } else if (index == 3) {
      isSelected1.value = false;
      isSelected2.value = false;
      isSelected3.value = !isSelected3.value;
    }
  }
}
