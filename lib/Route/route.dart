import 'package:get/get.dart';
import 'package:getx_final/Data_Binding/data_binding.dart';
import 'package:getx_final/home_page/view.dart';


class Routes{
  static final routes = [
    GetPage(
      name: '/homepage',
      page: () => Homepage(),
      binding: DataBinding(),
    ),
  ];
}