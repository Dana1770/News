import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ArticleModel.dart';
class Item extends StatelessWidget{
  String? t1;
  String? t;

  @override
  Item({this.t,this.t1});
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 10,right: 5,bottom: 25),
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        image:DecorationImage(
            image: AssetImage(t!),
            fit: BoxFit.fill) ,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(t1!,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
    );

  }
}
class ItemCategory extends StatelessWidget{
  List <Item>item=[
    Item(t:'assets/sports.jpg',t1: 'Sports'),
    Item(t:'assets/business.png',t1: 'Business'),
    Item(t:'assets/technology.jpg',t1: 'Tecnology'),
    Item(t:'assets/health.jpg',t1: 'Health'),
    Item(t:'assets/general.jpg',t1: 'General'),
    Item(t:'assets/science.jpg',t1: 'Science'),
    Item(t:'assets/entertainment.jpg',t1: 'Entertainment'),
  ];
  @override
  Widget build(BuildContext context) {
return SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Padding(
    padding: const EdgeInsets.only(left: 5.0,right: 10),
    child: Row(
      children: item,
    ),
  ),);
  }

}
class NewsItemCategory extends StatelessWidget{
  String? imageURL;
  String? t;
  String? t1;
  ArticleModel  articleModel;
  NewsItemCategory({
    this.imageURL,
    this.t1,
    this.t,
    required this.articleModel});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
        padding: const EdgeInsets.only(bottom: 22,right: 15,left: 15),
        child:Column(
          children: [
            Container(
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image:articleModel.image !=null ? DecorationImage(image: NetworkImage(
                     articleModel.image??'assets/1.jpg',
                  )
                      , fit: BoxFit.fill)
                      : DecorationImage(image: AssetImage('assets/1.jpg')
                      , fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 10,),
            Text(articleModel.title??" ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),maxLines: 3,overflow: TextOverflow.ellipsis,),
            Text(articleModel.subTitle??" ",style: TextStyle(color: Colors.grey,fontSize: 15),maxLines: 2,),

          ],
        ),
      );
        },

    );
  }

}
