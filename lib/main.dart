import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'SuperCalculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";


  botonPresionado(String buttonText){
    if(buttonText == "C"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }else if(buttonText == "+"|| buttonText == "-"|| buttonText == "X" || buttonText == "/"){
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";

    }else if (buttonText == "."){
      if(_output.contains(".")){
        print("ya existe un punto");
        return;
      }else{
        _output = _output + buttonText;
      }
    }else if(buttonText == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }else {
      _output = _output + buttonText;
    }
    print (_output);
    setState((){
      output = double.parse(_output).toStringAsFixed(2);
    });

  }

  Widget constuyedButton(String numero){
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(numero,
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: ()=>    botonPresionado(numero),
        color: Colors.orange[300],
        textColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(children: <Widget>[ new Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0
                ),
                child:
                new Text(output,
                    style: new TextStyle(
                      fontSize: 46.0,
                      fontWeight: FontWeight.bold, ))),
            new Expanded(
              child: new Divider(),
            ),

            new Column(children: <Widget>[
              new Row(children: [
                constuyedButton("7"),
                constuyedButton("8"),
                constuyedButton("9"),
                constuyedButton("/")
              ]),
              new Row(children: [
                constuyedButton("4"),
                constuyedButton("5"),
                constuyedButton("6"),
                constuyedButton("X")
              ]),
              new Row(children: [
                constuyedButton("1"),
                constuyedButton("2"),
                constuyedButton("3"),
                constuyedButton("-")
              ]),
              new Row(children: [
                constuyedButton("."),
                constuyedButton("0"),
                constuyedButton("00"),
                constuyedButton("+")
              ]),
              new Row(children: [
                constuyedButton("C"),
                constuyedButton("=")
              ])
            ]),
            ],
            )));
  }
}
