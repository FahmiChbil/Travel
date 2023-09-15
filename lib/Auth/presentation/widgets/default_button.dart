import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.onPress,
    required this.data,
  });
  final void Function()? onPress;
  final String data;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: Text(data));
  }
}
