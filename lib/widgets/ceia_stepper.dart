import 'package:ceia_components/widgets/ceia_button.dart';
import 'package:flutter/material.dart';

typedef OnStepChange = Function(int currentStepIndex, bool isLastStep);

class CEIAStepper extends StatefulWidget {
  // Stepper disposto na vertical por padrão.
  const CEIAStepper.vertical({
    super.key,
    required this.steps,
    required this.finalMessage,
    this.onStepChange,
  }) : orientation = StepperType.vertical;

  /// Stepper disposto na horizontal por padrão.
  const CEIAStepper.horizontal({
    super.key,
    required this.steps,
    required this.finalMessage,
    this.onStepChange,
  }) : orientation = StepperType.horizontal;

  final String finalMessage;
  final List<Step> steps;
  final OnStepChange? onStepChange;
  final StepperType orientation;

  @override
  State<CEIAStepper> createState() => _CEIAStepperState();
}

class _CEIAStepperState extends State<CEIAStepper> {
  int currentStep = 0;

  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == widget.steps.length - 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Stepper(
        type: widget.orientation,
        connectorColor: const WidgetStatePropertyAll(Color(0xFF035E72)),
        steps: widget.steps,
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                CEIAButton(
                  text: currentStep >= widget.steps.length - 1 ? widget.finalMessage : 'Continuar',
                  height: 45,
                  onPressed: details.onStepContinue,
                ),
                const SizedBox(width: 16),
                if (currentStep != 0)
                  CEIAButton(
                    text: 'Voltar',
                    height: 45,
                    onPressed: details.onStepCancel,
                  ),
              ],
            ),
          );
        },
        currentStep: currentStep,
        onStepContinue: () {
          if (isLastStep) {
            widget.onStepChange?.call(currentStep, true);
          } else {
            setState(() => currentStep += 1);
            widget.onStepChange?.call(currentStep, false);
          }
        },
        onStepCancel: isFirstStep ? null : () => setState(() => currentStep -= 1),
        onStepTapped: (step) => setState(() => currentStep = step),
      ),
    );
  }
}
