import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DioHelper/Dio.dart';
import '../components/Reusable component.dart';
import '../models/ArticleModel.dart';

class CategoryView extends StatefulWidget {
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ArticleModel>articles=[];
  bool isLoading=true;
  void initState(){
    super.initState();
    News();
  }
  Future<void> News() async {
    articles=await DioHelper().getNews(
        category: cat,
    );
    isLoading=false;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body:CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverList(

            delegate: SliverChildBuilderDelegate(
                childCount:articles.length,
                    (context,index) {
                  return articles.isNotEmpty?NewsItemCategory(
                      articleModel: articles[index]
                  ):SliverToBoxAdapter(child: Center(child: Text('There is an error !',style: TextStyle(fontWeight: FontWeight.bold),)),);

                }),
          ),
        ],
      ),

    );
  }
}
