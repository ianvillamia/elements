import 'package:flutter/material.dart';

class Build extends StatefulWidget {
  Build({Key key}) : super(key: key);

  @override
  _BuildState createState() => _BuildState();
}

class _BuildState extends State<Build> {
  String caughtValue;
  @override
  Widget build(BuildContext context) {
    return Stack(
     children: <Widget>[
       DragItem(Offset(0.0,0.0),'label',Colors.teal),

      Positioned(
        bottom: 0,
              child: DragTarget(
               
                onWillAccept: (data){
                  print(data);
                  return true;
                },

              onAccept: (String value) {
                print('jdqdqwdqw'+value);
              
                    //HERE IS THE THING I WANT TO BUILD
                  
                    setState(() {
                      caughtValue=value;
                      @override
                      Widget build(BuildContext context) {
                        return Positioned(
                            child: Container(
                              width: 100,
                              height: 50,
                              color: Colors.red,
                              child: Center(
                                child: Text('data'),
                              ),
                            ),
                          );
                      }
                    });
                         

                

              },
  
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: accepted.isEmpty ? Colors.green : Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Text("Drag Here!"),
                  ),
                );
              },
            ),
      ),
     ],
    );
  }
}

 

class DragItem extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  DragItem(this.initPos, this.label, this.itemColor);

  @override
  _DragItem createState() => _DragItem();
}

class _DragItem extends State<DragItem> {
  Offset position = Offset(0.0, 0.0); //hold position of item ~changing

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override 
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        //item that can be dragged to dragtarget

        data:widget.label, //DATA

        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle,color: widget.itemColor),
          width: 50,
          height: 50,

        //  color: widget.itemColor,

          child: Center(
            child: Text(widget.label,
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 20.0)),
          ),
        ),

      
        onDraggableCanceled: (velocity, offset) {
          //OLD POSITION
          setState(() {
            position = offset;
          });
        },
        
        //FEEDBACK WHILE DRAGGING 
        feedback: Container(
          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.deepOrange),
          width: 100,
          height: 100,
          child: Center(
            child: Text(widget.label,
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 20.0)),
          ),
        ),
      childWhenDragging: Container(),
      
      ),
    );
  }
}


