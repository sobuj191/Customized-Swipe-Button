import 'package:custom_swipe_button/welcomPade.dart';
import 'package:flutter/material.dart';

class Switch3DButton extends StatefulWidget {
  @override
  _Switch3DButtonState createState() => _Switch3DButtonState();
}

class _Switch3DButtonState extends State<Switch3DButton> {
  bool _isSwitched = true;
  double positionX = 0;

  @override
  Widget build(BuildContext context) {
    int flag=0;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Swipe button"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx < 0) {
                    // Swiping right
                    setState(() {
                      _isSwitched = true;
                    });
                  } else if (details.delta.dx > 0) {
                    if (flag==0){
                      Future.delayed(const Duration(milliseconds: 700), () {
                       Navigator.push(context, MaterialPageRoute(builder: (_)=>WellcomePage()));
                      });
                      flag=flag+1;
                    }
                    _isSwitched=false;
                    // Swiping left
                    setState(() {
                      _isSwitched = false;
                    });
                  }
                },
                onHorizontalDragEnd: (details) {
                  // Perform any necessary cleanup after the drag ends
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 320.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 0.15,
                        spreadRadius: -2.0,
                        offset: const Offset(0, -3.5),
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 3.0, // Adjust blur radius for left shadow
                        spreadRadius: -1.0,
                        offset: const Offset(-4, 0), // Offset for left shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        left: _isSwitched ? 10.0 : 250.0, // Updated initial left position
                        top: 10.0,
                        bottom: 10.0,
                        right: _isSwitched ? 250.0 : 10.0,
                        child: Container(
                          width: 80.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.redAccent
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 0),
                        left: _isSwitched ? 20.0 : 0.0,
                        right: _isSwitched ? 0.0 : 270.0,
                        top: 0.0,
                        bottom: 0.0,
                        child: Container(
                          width: 300.0,
                          height: 10.0,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerRight,
                          child: Text(
                            _isSwitched ? 'Swipe to Go Online' : '',
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        GestureDetector(
          // Detect horizontal drag gestures
          onHorizontalDragUpdate: (details) {
            setState(() {
              positionX += details.delta.dx;
            });
          },
          onHorizontalDragEnd: (details) {
            // Reset positionX after dragging ends
            setState(() {
              if (positionX < -10) {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>WellcomePage()));
              }
              positionX = 0;
            });
          },
          child: Transform.translate(
            offset: Offset(positionX, 0) ,
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100)
                  ),
                  color: Colors.redAccent.withOpacity(0.4)
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 200, // Set width according to your UI requirement
                  height: 60,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100)
                      ),
                      color: Colors.red
                  ),// Set height according to your UI requirement
                  alignment: Alignment.center,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Go online", // Use title2 here instead of 'Start Now'
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 10,),
                      Icon(Icons.arrow_forward_outlined,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
            ],
          ),
        ),
      ),
    );
  }
}
// new update