import 'package:flutter/material.dart';

class SteperItemSection extends StatefulWidget {
  final List<Map<String, String>> stepsData;
  final List<Widget> stepContents;
  final Function(int)? onStepChanged;

  SteperItemSection({
    required this.stepsData,
    required this.stepContents,
    this.onStepChanged,
  });

  @override
  State<SteperItemSection> createState() => _SteperItemSectionState();
}

class _SteperItemSectionState extends State<SteperItemSection> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * 0.9, // Constrain the height
                ),
                child: Stepper(
                  physics: const NeverScrollableScrollPhysics(),
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
                                widget.onStepChanged?.call(currentStep);
                              });
                            },
                            child: Text('Previous'),
                          ),
                        ElevatedButton(
                          onPressed: () {
                            bool isLastStep = (currentStep == widget.stepsData.length - 1);
                            if (isLastStep) {
                              // Do something if it's the last step
                            } else {
                              setState(() {
                                currentStep += 1;
                                widget.onStepChanged?.call(currentStep);
                              });
                            }
                          },
                          child: Text(currentStep == widget.stepsData.length - 1 ? 'Finish' : 'Next'),
                        ),
                      ],
                    );
                  },
                  onStepTapped: (step) => setState(() {
                    currentStep = step;
                    widget.onStepChanged?.call(currentStep);
                  }),
                  steps: _getSteps(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Step> _getSteps() {
    return widget.stepsData.asMap().entries.map<Step>((e) {
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
            color: currentStep >= i ? Colors.blue : Color(0xFF959595), // Non-active step color
          ),
        ),
        content: SizedBox(
          width: double.infinity, // Constrain width to avoid infinite size issues
          child: widget.stepContents[i],
        ),
      );
    }).toList();
  }
}
