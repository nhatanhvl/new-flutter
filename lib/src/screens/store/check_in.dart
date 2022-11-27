import 'package:flutter/material.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({super.key});

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: screenheight * 0.55,
          width: screenWidth,
          child: Card(
            elevation: 0.8,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://placeimg.com/640/480/any',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: screenWidth * 0.1),
            InkWell(
              onTap: () => {},
              child: const Text(
                'Thoát',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 5, color: Colors.grey.shade300),
              ),
            ),
            InkWell(
              onTap: () => {},
              child: const Text(
                'Chụp lại',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(width: screenWidth * 0.1),
          ],
        )
      ],
    );
  }
}
