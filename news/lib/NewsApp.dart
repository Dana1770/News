import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/components/Reusable%20component.dart';
import 'package:news/models/ArticleModel.dart';

import 'DioHelper/Dio.dart';

class NewsApp extends StatefulWidget{


  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  List<ArticleModel>articles=[];
  bool isLoading=true;
  void initState(){
    super.initState();
   generalNews();
  }

  Future<void> generalNews() async {
    articles=await DioHelper().getNews();
    isLoading=false;
    setState(() {

    });
  }
  Widget build(BuildContext context) {

    // TODO: implement build
return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('News',style: TextStyle(color: Colors.black)),
        Text('Cloud',style: TextStyle(color: Colors.orange),),
      ],
    ),
  ),
body: CustomScrollView(
  physics: BouncingScrollPhysics(),
  slivers: [
    SliverToBoxAdapter(
      child:  isLoading?Center(child: CircularProgressIndicator()):ItemCategory() ,
    ),
/*
    SliverList(

        delegate: SliverChildBuilderDelegate(
            childCount:articles.length,
                (context,index) {
              return articles.isNotEmpty?NewsItemCategory(
                  articleModel: articles[index]
              ):SliverToBoxAdapter(child: Center(child: Text('There is an error !',style: TextStyle(fontWeight: FontWeight.bold),)),);

    }),
    ),
*/
  FutureBuilder(future:DioHelper().getNews() ,
      builder: (context,snapshot){
    return  SliverList(

      delegate: SliverChildBuilderDelegate(
          childCount:articles.length,
              (context,index) {
            return articles.isNotEmpty?NewsItemCategory(
                articleModel: articles[index],
            ):SliverToBoxAdapter(child: Center(child: Text('There is an error !',style: TextStyle(fontWeight: FontWeight.bold),)),);

          }),
    );
  }),
  ],
),







);
  }
}