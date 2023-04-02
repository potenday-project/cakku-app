import 'package:cakku_app/cakku_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CakkuFloatingActionButton extends StatelessWidget {
  final Widget? label;
  final VoidCallback? onPressed;

  const CakkuFloatingActionButton({
    super.key,
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CakkuColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 12),
        child: _getLabel(),
      ),
    );
  }

  Widget _getLabel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('다음',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10,),
        SvgPicture.asset(
          'assets/icon_right.svg',
          height: 24,
          width: 24,
          color: Colors.white,
        ),
      ],
    );
  }
}
