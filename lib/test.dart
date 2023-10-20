import 'package:crud_firebase/widgets/chi_appbar.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CHIAppBar(title: 'Test'),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                backgroundColor: Colors.orange.shade200,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 500,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade100,
                                  maximumSize: const Size(double.infinity, 48),
                                  minimumSize: const Size(double.infinity, 48),
                                  fixedSize: const Size(double.infinity, 48),
                                ),
                                onPressed: () {},
                                child: const Text("See Doctor Details")),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text('View Doctor Details'),
          ),
        ],
      ),
    );
  }
}
