import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'content.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steper Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF537188), // Active step color
          secondaryContainer: const Color(0xFFCBB279), // Active step gradient color
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Steper Example'),
        ),
        body: SteperItemSection(),
      ),
    );
  }
}

class SteperItemSection extends StatefulWidget {
  @override
  State<SteperItemSection> createState() => _SteperItemSectionState();
}

class _SteperItemSectionState extends State<SteperItemSection> {
  int currentStep = 0;

  List<Map<String, String>> steplist = [
    {'task': '1', 'content': "Step 1"},
    {'task': '2', 'content': "Step 2"},
    {'task': '3', 'content': "Step 3"},
    {'task': '4', 'content': "Step 4"},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double stepperHeight = constraints.maxHeight;
        double stepperWidth = constraints.maxWidth;

        return SingleChildScrollView(
          child: SizedBox(
            height: stepperHeight * 0.9, // Adjust as needed
            width: stepperWidth,
            child: Column(
              children: [
                Expanded(
                  child: Stepper(
                    connectorThickness: 1,
                    elevation: 0,
                    type: StepperType.horizontal,
                    currentStep: currentStep,
                    controlsBuilder: (BuildContext context, ControlsDetails controls) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          if (currentStep > 0) // Show "Previous" button if not on the first step
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  currentStep -= 1;
                                });
                              },
                              child: const Text('Previous'),
                            ),
                          ElevatedButton(
                            onPressed: () {
                              bool isLastStep = (currentStep == getSteps().length - 1);
                              if (isLastStep) {
                                // Do something if it's the last step
                              } else {
                                setState(() {
                                  currentStep += 1;
                                });
                              }
                            },
                            child: Text(currentStep == getSteps().length - 1 ? 'Finish' : 'Next'),
                          ),
                        ],
                      );
                    },
                    onStepTapped: (step) => setState(() {
                      currentStep = step;
                    }),
                    steps: getSteps(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Step> getSteps() {
    return steplist.asMap().entries.map<Step>((e) {
      var i = e.key;
      var item = e.value;
      return Step(
        state: currentStep > i ? StepState.complete : StepState.indexed,
        isActive: currentStep >= i,
        title: const SizedBox.shrink(),
        label: Text(
          item['content'] ?? "",
          style: TextStyle(
            fontSize: 8,
            color: currentStep >= i ? Colors.blue : const Color(0xFF959595), // Non-active step color
          ),
        ),
        content: getStepContent(i), // Use unique content for each step
      );
    }).toList();
  }

  // Return unique content for each step
  Widget getStepContent(int stepIndex) {
    switch (stepIndex) {
      case 0:
        return StepContent1();
      case 1:
        return StepContent2();
      case 2:
        return StepContent3();
      case 3:
        return StepContent4();
      default:
        return const SizedBox.shrink();
    }
  }
}

// Define unique content widgets for each step
class StepContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      child: const Center(
        child: Text(
          'Content for Step 1',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class StepContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      child: const Center(
        child: Text(
          'Content for Step 2',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}



class StepContent4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: const Center(
        child: Text(
          'Content for Step 4',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}


class StepContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: const Center(
        child: Text(
          'Content for Step 3',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}