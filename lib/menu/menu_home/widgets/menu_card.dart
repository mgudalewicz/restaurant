import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.name,
    required this.prize,
    required this.onTap,
  });

  final String name;
  final double prize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Colors.yellow.shade400,
          elevation: 1.0,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow.shade50,
                  border: Border.all(color: Colors.yellow.shade400),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                name,
                                style: const TextStyle(fontSize: 16.0),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'cena: ${prize.toStringAsFixed(2)}zł',
                              style: const TextStyle(fontSize: 12.0),
                              maxLines: 1,
                            ),
                          ],
                        )
                      ]),
                    ),
                    const Icon(Icons.add),
                    const SizedBox(width: 10)
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
