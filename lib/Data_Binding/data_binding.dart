import 'package:get/get.dart';
import 'package:getx_final/home_page/controller.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
