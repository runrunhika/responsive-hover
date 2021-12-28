import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BorderRadius? border;
  Color? color;
  double? height;
  double? width;
  bool? animate;
  bool? textAppear;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animate = false;
    textAppear = false;
    changer(animate!);
  }

  void changer(bool a) {
    setState(() {
      if (a) {
        height = 400;
        width = 700;
        color = Color(0xff004b93);
        border = BorderRadius.circular(40);
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 370;
        width = 370;
        color = Colors.red[700];
        border = BorderRadius.circular(300);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onEnter: (a) {
            setState(() {
              animate = true;
              changer(animate!);
            });
          },
          onExit: (a) {
            setState(() {
              animate = false;
              changer(animate!);
              textAppear = false;
            });
          },
          child: Container(
            height: 700,
            width: 650,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: AnimatedContainer(
                    height: height!,
                    width: width!,
                    duration: Duration(milliseconds: 275),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                    decoration:
                        BoxDecoration(borderRadius: border!, color: color!),
                    child: AnimatedOpacity(
                      opacity: textAppear! ? 1 : 0,
                      duration: Duration(milliseconds: textAppear! ? 400 : 100),
                      curve: Curves.easeOut,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'pepsi',
                            style: GoogleFonts.montserrat(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            width: 270,
                            child: Text(
                              'pepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsipepsi',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: AnimatedContainer(
                    padding: EdgeInsets.only(left: animate! ? 270 : 0),
                    duration: Duration(milliseconds: 270),
                    height: height! + 200,
                    width: 260,
                    child: Image(
                      image: AssetImage('pepsi.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
