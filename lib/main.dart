import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(

  home: Display(),
));



class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  double num1=0, num2=0;
  String display = "";
  String res, operator;
  bool operation = false;
String line=" ";
int f =0;


void buttonclicked(String btntext)
{f = 0;
  operation = false;
  if(btntext == "<")
    {
      //num1 = 0; num2 = 0; display = ""; res = "";
      res = display.substring(0,display.length-1);
      line = line.substring(0,line.length-1);
    }
  else if(btntext=="+"||btntext=="-"||btntext=="x"||btntext=="÷")
  {
    operation = false;
    num1 = double.parse(display);
    res = "";
    operator = btntext;
    line = line+btntext;
  }
  else if(btntext=='.'){
    operation = false;
    if(res.contains('.'))
      return;
    else{
    res = display + btntext;
    line = line+btntext;}
  }
  else if(btntext=='=')
    {f = 1;
      operation = true;
      num2 = double.parse(display);
      if(operator=="+")
        res = (num1+num2).toString();
      if(operator=="-")
        res = (num1-num2).toString();
      if(operator=="x")
        res = (num1*num2).toString();
      if(operator=="÷")
        res = (num1.toDouble()/num2.toDouble()).toDouble().toStringAsFixed(3);
      line = res;
    }
  else {
    operation = false;
    if(display.contains(".")){
      res = double.parse(display+btntext).toString(); line = line+btntext;}
    else{
    res = int.parse(display+btntext).toString();line = line+btntext;}
  }
  setState(() {
    display = res;
  });

}

void btnlongclicked(String btntext)
{
  operation = false;
  double num1 = 0, num2 = 0;
  display = "";
  res = "";
  line = " ";
  setState(() {
    display = res;
  });
}

  @override
  Widget build(BuildContext context) {


    Widget custombutton(String btnval)
    {
      return RaisedButton(
          onPressed: () => buttonclicked(btnval),
          color: Colors.transparent,
          child: Text(
            '$btnval',
            style: TextStyle(color: Colors.grey[500], fontSize: 30.0),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          )
      );
    }

    return Scaffold(

      backgroundColor: Colors.grey[900],


      appBar: AppBar(


        backgroundColor: Colors.grey[900],
        title: Text(
          'Calci',
          style: TextStyle(
            color: Colors.grey[800],
            letterSpacing: 3.0,
          ),
        ),
      ),

      body: Column(


        children: <Widget>[

          Expanded(

            child: Container(
              alignment: Alignment.topRight,
              child: Text(f==1?
                '$display': '$line',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),



          Container(
            color: Colors.black,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.5),
            child: Row(
              children: <Widget>[



                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          //SizedBox(width: 9.0,),
                          custombutton("7"),

                          //SizedBox(width: 14.0,),
                          custombutton("8"),

                          //SizedBox(width: 14.0,),
                          custombutton("9"),

                          //SizedBox(width: 14.0,),
                          //custombutton("/"),
                        ],
                      ),

                      SizedBox(height: 9.0),


                      Row(
                        children: <Widget>[
                          //SizedBox(width: 9.0,),
                          custombutton("4"),

                          //SizedBox(width: 14.0,),
                          custombutton("5"),

                          //SizedBox(width: 14.0,),
                          custombutton("6"),

                          //SizedBox(width: 14.0,),
                          //custombutton("x"),
                        ],
                      ),
                      SizedBox(height: 9.0),


                      Row(
                        children: <Widget>[
                          //SizedBox(width: 9.0,),
                          custombutton("1"),

                          //SizedBox(width: 14.0,),
                          custombutton("2"),

                          //SizedBox(width: 14.0,),
                          custombutton("3"),

                          //SizedBox(width: 14.0,),
                          //custombutton("-"),
                        ],
                      ),
                      SizedBox(height: 9.0),


                      Row(
                        children: <Widget>[
                          //SizedBox(width: 9.0,),
                          custombutton("."),

                          //SizedBox(width: 14.0,),
                          custombutton("0"),

                          //SizedBox(width: 14.0,),
                          custombutton("="),

                          //SizedBox(width: 14.0,),
                          // custombutton("+"),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,

                  child: Container(

                    margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    padding: EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 13.0),
                    color: Colors.grey[800],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => buttonclicked("<"),
                            onLongPress: () => btnlongclicked("C"),
                            color: Colors.grey[800],
                            child: Text(
                              operation? 'C' : '<',
                              style: TextStyle(color: Colors.grey[500], fontSize: 30.0),
                            ),
                            padding: EdgeInsets.all(12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0),
                            )

                        ),
                        FlatButton(
                            onPressed: () => buttonclicked("÷"),
                            color: Colors.grey[800],
                            child: Text(
                              '÷',
                              style: TextStyle(color: Colors.grey[500], fontSize: 30.0),
                            ),
                            padding: EdgeInsets.all(12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0),
                            )

                        ),
                        FlatButton(
                            onPressed: () => buttonclicked("x"),
                            color: Colors.grey[800],
                            child: Text(
                              'x',
                              style: TextStyle(color: Colors.grey[500], fontSize: 30.0),
                            ),
                            padding: EdgeInsets.all(12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0),
                            )

                        ),
                        FlatButton(
                            onPressed: () => buttonclicked("-"),
                            color: Colors.grey[800],
                            child: Text(
                              '-',
                              style: TextStyle(color: Colors.grey[500], fontSize: 30.0),
                            ),
                            padding: EdgeInsets.all(12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0),
                            )

                        ),
                        FlatButton(
                            onPressed: () => buttonclicked("+"),
                            color: Colors.grey[800],
                            child: Text(
                              '+',
                              style: TextStyle(color: Colors.grey[500], fontSize: 30.0),
                            ),
                            padding: EdgeInsets.all(12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0),
                            )

                        ),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),



            ],
          )




      );

  }
}