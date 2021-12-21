import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomDialog extends StatelessWidget {
  const BottomDialog({
    Key? key,
    required this.title,
    required this.child,
    required this.actions,
    this.padding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.disabled = false,
  }) : super(key: key);
  final String title;
  final Widget child;
  final List<Map> actions;
  final bool disabled;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: const Color.fromRGBO(12, 12, 12, 0.3),
          child: DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.8,
            builder: (context, scrollController) => Container(
                padding: EdgeInsets.fromLTRB(
                    24, 24, 24, MediaQuery.of(context).padding.bottom),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: 48,
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // color: _themeService.onBackground.withOpacity(0.2),
                          ),
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          // color: _themeService.onBackground,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(
                        height: 1,
                      ),
                      const Spacer(),
                      Padding(
                        padding: padding,
                        child: child,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ButtonBar(
                          children: [
                            ...actions
                                .map(
                                  (e) => TextButton(
                                    onPressed: disabled ? null : e["onPressed"],
                                    child: Text(
                                      e["text"].toString().toUpperCase(),
                                    ),
                                  ),
                                )
                                .toList()
                          ],
                        ),
                      )
                    ])),
          ),
        ),
      ),
    );
  }
}
