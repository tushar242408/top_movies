import 'package:flutter/material.dart';
import 'package:promovie/data/gethome.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Playvedio extends StatefulWidget {
  final int id;
  Playvedio({this.id});

  @override
  _PlayvedioState createState() => _PlayvedioState();
}

class _PlayvedioState extends State<Playvedio> {
  String url;
  var variableName;
   static String key="Ak19g0j10-Q";

  bool load=true;
  @override
  YoutubePlayerController _controller ;
  void initState() {
    print(widget.id);
   getData();
    // TODO: implement initState

    super.initState();
  }
  Homedata hd=Homedata();
  getData() async{
       String b=await hd.getmovie(widget.id);
       setState(() {
         key=b;
       });
       print(key);
    url="https://www.youtube.com/watch?v=$key";
    print(url);
    print("hek$key");
    setState(() {
      load=false;
    });
       _controller = YoutubePlayerController(
         initialVideoId: key,
         flags: YoutubePlayerFlags(
           autoPlay: true,
           mute: true,
         ),
       );

  }

  @override
  Widget build(BuildContext context) {
      return load?CircularProgressIndicator(): Container(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blue,
        )
      );
    }
  }

