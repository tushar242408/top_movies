import 'dart:convert';

import 'package:http/http.dart' as http;
class filedata1 {
  final String homepage,name,originaltittle,orignallang,overview,releadedate;

  filedata1({this.homepage,this.name,this.originaltittle,this.orignallang,this.overview,this.releadedate});
}



class Homedata{

  Future<dynamic> getmovie(String url1) async{
    print(url1);
     var  url;
    var response=await http.get(url1);
    var jasondata=jsonDecode(response.body);

          print( jasondata["homepage"]);


    filedata1 a=filedata1(
        homepage:jasondata["homepage"],
        originaltittle: jasondata["original_title"],
      releadedate: jasondata["release_date"],
      name: jasondata["name"],
      overview: jasondata["overview"],
      orignallang: jasondata["original_language"]

    );
    url=a;

    return url;
    }

        }