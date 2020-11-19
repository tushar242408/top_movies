import 'dart:async';

import 'package:flutter/material.dart';
import 'package:promovie/data/vedio.dart';
import 'package:promovie/module/filedata.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'onTap.dart';
class showdata extends StatefulWidget {
  final int id;
  final String tittle;
  showdata({this.id,this.tittle});
  @override
  _showdataState createState() => _showdataState();
}

class _showdataState extends State<showdata> {


  final Completer<WebViewController> completer=Completer<WebViewController>();
  var  url;
  filedata1 b= filedata1();
  bool loading=true;
  @override
  void initState() {
    url="https://api.themoviedb.org/3/movie/${widget.id}?api_key=f6fc25524195e6c8f2649ca71e88b8af&language=en-US";
    getPage();
    // TODO: implement initState
    super.initState();
  }

  getPage() async{
     Homedata hd=Homedata();
    b=await hd.getmovie(url);
    print("hello${b.originaltittle}");
    setState(() {
      loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("TUSHAR",style: TextStyle(color: Colors.blueAccent,fontSize: 18,fontWeight: FontWeight.bold),),
            Text("App",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),),
          ],

        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: loading? CircularProgressIndicator():Container(
        child: Column(
          children: [
            Text("Movie Title: ${widget.tittle}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("Release date: ${b.releadedate}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("Original lang: ${b.orignallang}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("Original name: ${b.originaltittle}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("home View:",style: TextStyle(fontSize: 20),),
                GestureDetector(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>
                        Webview(url:b.homepage ,)
                      ,
                    )),
                    child: Text(" ${b.homepage}",style: TextStyle(fontSize: 20,color: Colors.blue,fontStyle: FontStyle.italic,),))
                
              ],
               ),
            SizedBox(height: 40,),
            Text("Overview: ${b.overview}",style: TextStyle(fontSize: 20),),
            SizedBox(height: 40,),

            OutlineButton(child: Text("watch trailer"),
                onPressed:() =>Navigator.push(context, MaterialPageRoute(builder:(context)=> Playvedio(id: widget.id,))),
            textColor: Colors.grey,
            highlightedBorderColor: Colors.purple,)
          ],
        ),
      )
    );
  }
}






