import 'package:flutter/material.dart';

class ErrorExamplePage extends StatelessWidget {
  const ErrorExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error Handling Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // زرار SnackBar
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("❌ حدث خطأ، جرب مرة تانية"),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: const Text("Show SnackBar Error"),
            ),

            const SizedBox(height: 20),

            // زرار Dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("خطأ"),
                    content: const Text("كلمة المرور غير صحيحة ❌"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("تمام"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Show Dialog Error"),
            ),
          ],
        ),
      ),
    );
  }
}
