import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/grid_diveces.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double sizeHeight=20;
  final double sizeWidth=20;
  final SizedBox sizedBox=const SizedBox(height: 20,);

   List mySmart=[
     ["light","lib/icons/light-bulb.png",true],
     ["smart","lib/icons/smart-tv.png",false],
     ["fan","lib/icons/fan.png",false],
     ["air","lib/icons/air-conditioner.png",false],
   ];
  powerOn(value,index){
    setState(() {
          mySmart[index][2]=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "lib/icons/menu.png",
                      height: 42,
                      color: Colors.grey[800],
                    ),
                    Icon(
                      Icons.person,
                      size: 42,
                      color: Colors.grey[800],
                    )
                  ],
                ),
              ),
              sizedBox,
              Column(
                children: [
                  Text(
                    "welcome home",
                    style: GoogleFonts.lato(
                        fontStyle: FontStyle.italic, fontSize: 20),
                  ),
                  sizedBox,
                  Text(
                    "Ali Shekfeh",
                    style: GoogleFonts.abel(
                        fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              sizedBox,
              const Divider(
                height: 3,
                color: Colors.blue,
              ),
              const Text("devices :",style: TextStyle(fontSize: 18),),
              Expanded(
                child: GridView.builder(
                  itemCount: mySmart.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(

                            crossAxisCount: 2,childAspectRatio: 1/1.5),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridBox(
                          deviceName: mySmart[index][0],
                          devicePath: mySmart[index][1],
                          onOff: mySmart[index][2],
                          onChange: (value) => powerOn(value,index),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
