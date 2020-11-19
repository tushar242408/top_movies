import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/platform_interface.dart';
class Webview extends StatefulWidget {
  final String url;
  Webview({this.url});
  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final Completer<WebViewController> completer=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("TUSHAR",style: TextStyle(color: Colors.blueAccent,fontSize: 18,fontWeight: FontWeight.bold),),
            Text("NEWS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),),
          ],

        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: ((WebViewController controller){
            completer.complete(controller);
          }),
        ),
      ),
    );
  }
}
