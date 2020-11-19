import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promovie/data/Gettingdata.dart';
import 'package:promovie/data/View.dart';
import 'package:promovie/module/Mmodel.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Mmodel> movie=new List<Mmodel>();
  bool load=true;
  @override
  void initState(){
    // TODO: implement initState
    print("hello");
  getnews();
    super.initState();
  }
  getnews()async{
    GetData gt= GetData();
    movie=await gt.getmovie();
    print(movie.length);
    setState(() {
      load=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return load? CircularProgressIndicator(): Scaffold(body:
      Center(
        child: GestureDetector(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>View(movie1:movie,))),
          child: Container(
            child: Text("click"),

          ),
        ),
      ),
    );
  }
}
class View extends StatefulWidget {
  List<Mmodel> movie1=new List<Mmodel>();
  View({this.movie1});
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {

  bool load=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: ListView.builder(
            itemCount: widget.movie1.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder:(context,index){
              return Hh(tittle:widget.movie1[index].tittle,path: widget.movie1[index].poster,id: widget.movie1[index].id,popularity: widget.movie1[index].popularity,);
            }
        ),
      ),);
  }
}




class Hh extends StatelessWidget {
  final String tittle,path;
  final double popularity ;
  final int id;
  Hh({@required this.tittle,this.popularity,this.id,this.path,});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=> showdata(id: id,tittle: tittle,))),

      child: ListTile(
        title: Text("$tittle"),
      ),
    );
  }
}