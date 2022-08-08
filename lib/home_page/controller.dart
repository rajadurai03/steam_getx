import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class HomePageController extends GetxController {
  StreamController<SearchResult> userController;

  @override
  void onInit() {
    streamdata();
    super.onInit();
  }

  Future streamdata() async{
    var response = await http.post('http://balram.twics.in/api/announcements?lang=1',
    headers: {
      "Accept":"application/json",
      "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijg4ZDFjNmNjNGJjZTg1ZTEwZTVjMzc2MDg3ZDAyZmRlZTY0ZTdhZmIzYmExN2RjOWQxNzliZWM3ZGM2NDNhZGY4YWVkMDc5ODg1ZDg2ZGVjIn0.eyJhdWQiOiIxIiwianRpIjoiODhkMWM2Y2M0YmNlODVlMTBlNWMzNzYwODdkMDJmZGVlNjRlN2FmYjNiYTE3ZGM5ZDE3OWJlYzdkYzY0M2FkZjhhZWQwNzk4ODVkODZkZWMiLCJpYXQiOjE2NDA4NjQ4ODksIm5iZiI6MTY0MDg2NDg4OSwiZXhwIjoxNjcyNDAwODg5LCJzdWIiOiI2MzY2NDEiLCJzY29wZXMiOltdfQ.WbOkBE73VlGTyG1VO0_NLbGAIKZPF765H4-f7dlKZ94hzcnOT7S2j6iVxYf_ul0wPgV_F9nKq-V4hbba0y_LqJ7mFAYTSCh6S-qK07I-ugqO8Erb6GfaWNhxtn5fDiXi_SsKyEL45B4wII4frQnyGMFkbbc9zT_BNsx7K4c74UMUxsyFPGiEMagHv6mps8YifIkZGCD4sbsWasU6mEcH5TY88B_TTekWTlhm-LsaxjAxvILuGivnwmy8MzboR2JOHKc30SrqkOnGCXA-HvxEBm4nBLQvSp1jIiEbSsylxRQpeUE1MFPasLCOthWIW77H2N0kbAt8-5z0TCFblyQdNAB-zCYMPBEem0rfnbA5Azr9kqTSrB1qsvEeK-v6KKREDloagRMuZsQFhbNsbHvrb8RSBtuc_52U9IvijnTdVL_8-gxRshpF4thCHnY_39bSzeCQu-sLaI4JRtAixmhYHI7M23w4eueTwkMeL5hjmRBCE4qYX7ISdBfVAvRoxMheOvxXNYRta5jHFJHl8Mbq5HfCTxCNnN1F74BlaXFfH8hOqaYhiu1Ka7_yPBDnz4T1dWphAjkPQBfwvNIiiLD97JZnjyOS9q8KI88xcBrG0W1MgrrTO5iIEnzJKvnmIKlyfBJ09CLaw7tC-5Gc_plsVVvqIGToSyCq0VCknxOCMkc" },
    );
    if(response.statusCode !=200){
      return Future.error(response.statusCode);
    }
    else{
   var jsonResponse = json.decode(response.body);
   SearchResult enddata= SearchResult.fromJson(jsonResponse);
      return enddata;
    }
  }

  Future loadDetails() async {
    HomePageController().streamdata().then((res) async{
      userController.add(res);
      return res;
    });
  }
}