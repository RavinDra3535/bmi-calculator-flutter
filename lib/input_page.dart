import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF1D1E40);
const bottomCardColor = Colors.orange;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  void updateColour(int gender){
    if(gender==1){
      if(maleCardColour==inactiveCardColor){
        maleCardColour=activeCardColor;
        femaleCardColour=inactiveCardColor;
      }else{
        maleCardColour= inactiveCardColor;
      }
    }
    if(gender==2){
      if(femaleCardColour==inactiveCardColor){
        femaleCardColour=activeCardColor;
        maleCardColour=inactiveCardColor;
      }else{
        femaleCardColour= inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap : (){
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReusableCode(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableCode(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCode(
                colour: activeCardColor,
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCode(
                    colour: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCode(
                    colour: activeCardColor,
                  ),
                ),
              ],
            )),
            Container(
              color: bottomCardColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ));
  }
}


