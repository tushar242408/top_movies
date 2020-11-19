import 'dart:convert';

import 'package:http/http.dart' as http;
class filedata2 {
  final String key;

  filedata2({this.key});
}



class Homedata{

  Future<String> getmovie(int id) async{

    String  url;
    String url1="https://api.themoviedb.org/3/movie/$id/videos?api_key=f6fc25524195e6c8f2649ca71e88b8af&language=en-US";
    var response=await http.get(url1);

    print(url1);
    filedata2 a;
    var jasondata=jsonDecode(response.body);
print(id);

print("dfghj");

    print("dfghj1");

    jasondata["results"].forEach((element) {
      print("dfghdddddd");
      print(element["key"]);
      a = filedata2(
          key: element["key"]

      );
    });

    url=a.key;
    print(url);
    return url;
  }

}