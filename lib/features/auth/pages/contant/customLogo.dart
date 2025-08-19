import 'package:flutter_application_1/core/imports/imports.dart';

class logo extends StatelessWidget {
  const logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 11, 9, 148),
          borderRadius: BorderRadius.circular(70),
        ),
        child: Image.asset("assets/images/logo.png.jpg", height: 80),
      ),
    );
  }
}
