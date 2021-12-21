import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final String? title;
  const ListHeader({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
          child: Text(
            title!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Theme.of(context).errorColor),
          ),
        )
      ],
    );
  }
}
