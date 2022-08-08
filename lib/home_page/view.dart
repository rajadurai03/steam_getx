import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_final/home_page/model.dart';
import 'controller.dart';

class Homepage extends GetView<HomePageController> {

  final controllerData = HomePageController();
  var pageheight, pagewidth;

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    pagewidth = _size.width;
    pageheight = _size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Announcements",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<HomePageController>(
          initState: (e){
            controllerData.userController = new StreamController();
            Timer.periodic(Duration(seconds: 1), (_) =>controllerData.loadDetails());
          },
          dispose: (e){
            controllerData.userController.close();
          },
          builder: (controller) {
            return  StreamBuilder(
                stream:  controllerData.userController.stream,
                builder: (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
                  
                  if(snapshot.hasData){
                    return Column(
                      children: [
                        SizedBox(height: pagewidth/24),
                        ListView.builder(
                            itemCount: snapshot.data.total,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: pagewidth/36,horizontal: pagewidth/24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: pageheight/3.8,
                                      width: pagewidth,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(snapshot.data.data[index].image),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                    ),
                                    Container(
                                      margin:EdgeInsets.symmetric(vertical: pagewidth/36),
                                      child: Text(snapshot.data.data[index].title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                                    ),
                                    Container(
                                      child: Text(snapshot.data.data[index].subtype,
                                        style: TextStyle(fontSize: 13,color: Colors.grey),),
                                    ),
                                    Container(
                                      margin:EdgeInsets.symmetric(vertical: pagewidth/36),
                                      child: Text(snapshot.data.data[index].date,style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,color: Colors.green)),
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                    )
                                  ],
                                ),
                              );
                            }),
                      ],
                    );
                  }else{
                    return Container(
                        height: MediaQuery.of(context).size.height,
                        child: Center(child: CircularProgressIndicator()));
                  }
                });
          },
        ),
      ),
    );
  }
}