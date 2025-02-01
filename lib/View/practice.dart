import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Color(0xff00324D),
         automaticallyImplyLeading: false,
         centerTitle: true,
         title: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Text('Hello Tocky!',style: TextStyle(
                   color: Colors.white,
                   fontSize: 24,
                   fontWeight: FontWeight.w500
                 ),),
                 SizedBox(width: 10,),
                 Icon(Icons.back_hand_sharp,color: Colors.yellow,)
               ],
             ),
             SizedBox(height: 10,),
             Text('Lets ‘s Start the learning',style: TextStyle(
                 color: Colors.white,
                 fontSize: 14,
                 fontWeight: FontWeight.w300
             ),),
           ],
         ),

         toolbarHeight: 181,
       ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //     SizedBox(width: 20,),
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //     SizedBox(width: 20,),
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20,),
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text('Hi How Are You',style: TextStyle(
                      color: Colors.black
                  ),),
                  Icon(Icons.handshake)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(

              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text('Hi'),
                  //     Icon(Icons.handshake)
                  //   ],
                  // ),
                ),

                // SizedBox(width: 20,),
                // Container(
                //   height: 40,
                //   width: 40,
                //   color: Colors.red,
                // ),
              ],
            ),
            // Container(
            //   height: 200,
            //   width: 200,
            //   color: Colors.red,
            //   child: Column(
            //     children: [
            //       Text('Hi How Are You',style: TextStyle(
            //           color: Colors.black
            //       ),)
            //     ],
            //   ),
            // ),
            // SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //     SizedBox(width: 20,),
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //     SizedBox(width: 20,),
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //   ],
            // ),
            // Container(
            //   height: 200,
            //   width: 200,
            //   color: Colors.red,
            //   child: Column(
            //     children: [
            //       Text('Hi How Are You',style: TextStyle(
            //         color: Colors.black
            //       ),)
            //     ],
            //   ),
            // ),
            // Row(
            //   children: [
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //     SizedBox(width: 20,),
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //     SizedBox(width: 20,),
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //     SizedBox(width: 20,),
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //     SizedBox(width: 20,),
            //     Container(
            //       height: 40,
            //       width: 40,
            //       color: Colors.red,
            //     ),
            //   ],
            // ),
        
          ],
        ),
      ),
    );
  }
}
