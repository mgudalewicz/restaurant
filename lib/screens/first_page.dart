import 'package:flutter/material.dart';
import 'package:restaurant/screens/auth/auth_gate.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.5,
              0.9,
            ],
            colors: [
              Colors.red,
              Colors.white,
              Colors.green,
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('images/restaurant.png'),
                  width: 300,
                ),
                const Text(
                  'Bistro',
                  style: TextStyle(
                    fontSize: 48.0,
                  ),
                ),
                const Text(
                  'Redzianka',
                  style: TextStyle(
                    fontSize: 48.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: kToolbarHeight,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AuthGate(),
                          ),
                        );
                      },
                      child: const Center(
                        child: Text(
                          'Przejdź dalej',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
