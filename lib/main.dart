import 'package:flutter/material.dart';
import './dialogs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ABC',
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
        home: Something());
  }
}

class Something extends StatefulWidget {
  Something({Key key}) : super(key: key);

  @override
  _SomethingState createState() => _SomethingState();
}

class _SomethingState extends State<Something> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController num1 = new TextEditingController(),
      num2 = TextEditingController(),
      num3 = TextEditingController();
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: Stack(
          children: <Widget>[
            Container(
            // color: Colors.red,
                 decoration: BoxDecoration(
                  image: DecorationImage(
                     image: AssetImage("assets/bg.jpg"),
                      fit: BoxFit.cover))
                      ),
            Positioned(
              top: 90,
              left: 80,
              child: Container(
                width: 350,
                height: 400,
              
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Center(child: Text('Enter Values',style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.bold
                            ),),),
                            buildForm(num1, 'Number 1'),
                            buildForm(num2, 'Number 2'),
                            buildForm(num3, 'Number 3 '),
                            SizedBox(
                              height: 25,
                            ),
                            MaterialButton(
                              color: Colors.red,
                              child: Text('CLICK TO SEE AVERAGE'),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Checking(num1, num2, num3, context);
                                } else {
                                  setState(() => _autoValidate = true);
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                
              ),
            ),
          ],
        ));
  }
}

TextFormField buildForm(TextEditingController controller, String label) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(

      icon: Icon(Icons.account_circle),
      labelText: label,
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter some Value';
      }
      return null;
    },
    // onSaved: (value) => name = value,
  );
}

void Checking(n1, n2, n3, context) {
  Dialogs dialog = new Dialogs();
  double number1 = double.parse(n1.text);
  double number2 = double.parse(n2.text);
  double number3 = double.parse(n3.text);

  double average = (number1 + number2 + number3) / 3;

  if (average >= 75 && average <= 100) {
    dialog.success(context, 'Congratulation Pasado');
  } else {
    dialog.fail(context, 'Failed');
  }
}
