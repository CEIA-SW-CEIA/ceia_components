import 'package:ceia_components/widgets/ceia_button.dart';
import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CEIAPageLayout extends StatelessWidget {
  final String pageTitle;
  final Widget? child;
  final bool pageIsLoading;
  final bool canBack;
  final String? goBackTo;
  final CEIAButton? rightButton;

  const CEIAPageLayout({
    super.key,
    required this.pageTitle,
    this.child,
    this.pageIsLoading = false,
    this.canBack = true,
    this.goBackTo,
    this.rightButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xffF7F8FA),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Builder(
                      builder: (context) {
                        if (canBack) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => goBackTo != null ? context.go(goBackTo!) : context.pop(),
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Color(0xff0E407B),
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  CEIAText.titleLarge(
                                    text: pageTitle,
                                    color: const Color(0xff0E407B),
                                  ),
                                  const SizedBox(width: 24),
                                ],
                              ),
                              if (rightButton != null) rightButton as Widget,
                            ],
                          );
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CEIAText.titleLarge(
                              text: pageTitle,
                              color: const Color(0xff0E407B),
                            ),
                            const SizedBox(width: 24),
                            if (rightButton != null) rightButton as Widget,
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    const Divider(
                      color: Color(0xff0651A5),
                    ),
                  ],
                ),
              ),
              if (child != null) child!,
            ],
          ),
        ),
        if (pageIsLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
