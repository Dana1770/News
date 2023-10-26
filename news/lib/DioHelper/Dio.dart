import 'package:dio/dio.dart';
import 'package:news/models/ArticleModel.dart';

class DioHelper{
  final Dio dio=Dio();
  Future<List<ArticleModel>> getNews()async{
try{
  Response response=await dio.get('https://newsapi.org/v2/top-headlines?apiKey=e7a26be97d0742ea9de960846a050208&country=us&category=general');

  Map <String,dynamic> jsonData=response.data;
  List<dynamic> articles =jsonData['articles'] ;
  List<ArticleModel>articlesList=[];
  for(var article in articles){
    ArticleModel articleModel= ArticleModel(
        image:article['urlToImage'] ,
        title: article['title'],
        subTitle: article['description'],
        time: article['publishedAt']);
    articlesList.add(articleModel);}

    return articlesList;}catch(e){
return [];
}


}


}