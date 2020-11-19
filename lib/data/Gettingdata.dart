import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:promovie/module/Mmodel.dart';

class GetData{
  List<Mmodel> movies=[];
  Future<List<Mmodel>> getmovie() async{
    String url1="https://api.themoviedb.org/3/movie/top_rated?api_key=f6fc25524195e6c8f2649ca71e88b8af&language=en-US&page=1";
    print(url1);
    var response=await http.get(url1);
    print(response.body);
    var jasondata=jsonDecode(response.body);
    print(response.body);

      jasondata["results"].forEach((element){
        if(element["poster_path"]!=null){
          Mmodel a=Mmodel(
            tittle: element["title"],
            id: element["id"],
            popularity: element["popularity"],
            poster: element["poster_path"],


          );
          print(a.popularity);
          print(a);
           movies.add(a);}

});
      return movies;
        }

}