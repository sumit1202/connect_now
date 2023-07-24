import 'package:connect_now/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton({super.key, required this.onPressed,
    required this.icon, required this.text,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0.0, 4.0),
                  )
                ]),
            child: Icon(icon, color: Colors.white, size: 30.0,),
          ),
          const SizedBox(height: 10.0,),
          Text(text, style: const TextStyle(color: Colors.grey, fontSize: 14.0),)
        ],
      ),
    );
  }
}
