import 'package:bmi_calcu/reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'icon_content.dart';




enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                      print('male');
                    },
                    color: selectedGender == Gender.male
                        ? kactiveCardColour
                        : kinactiveCardColour,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                      print('female');
                    },
                    color: selectedGender == Gender.female
                        ? kactiveCardColour
                        : kinactiveCardColour,
                    cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  const Text('HEIGHT',
                  style: klabelText,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  <Widget> [
                      Text(height.toString(),
                      style: kNumberTextStyle,
                      ),
                      const Text('cm',
                        style: klabelText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x15EB1555),
                      thumbShape:
                       const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape:
                      const RoundSliderOverlayShape(
                        overlayRadius: 40.0,
                      ),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        //activeColor: Colors.white,
                        //inactiveColor: const Color(0xFF8D8E98),
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                          print(newValue);
                        }),
                  ),
                ],
              ),
              onpress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Weight',
                        style: klabelText),
                        Text(weight.toString(),
                        style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },),
                            // FloatingActionButton(
                            //   backgroundColor: const Color(0xFF4C4F5E),
                            //     onPressed: (){},
                            //     child: const Icon(Icons.add,
                            //     color: Colors.white,
                            //     ),),
                            const SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },),
                            // FloatingActionButton(
                            //   backgroundColor: const Color(0xFF4C4F5E),
                            //   onPressed: (){},
                            //   child: const Icon(Icons.add,
                            //     color: Colors.white,
                            //   ),),
                          ],
                        ),
                      ],
                    ),
                    onpress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text('AGE',
                        style: klabelText,),
                        Text(age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                              icon: FontAwesomeIcons.minus),
                            const SizedBox(width: 10.0,),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    onpress: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kbottomContainerColour,
            // const Color(0xFFEB1555),
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kbottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key,required this.icon, required this.onPressed}) : super(key: key);
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(icon),);
  }
}
