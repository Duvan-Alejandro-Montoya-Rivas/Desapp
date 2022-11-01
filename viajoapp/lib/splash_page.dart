import 'package:flutter/material.dart';
import 'package:viajoapp/login_page.dart';
import 'package:viajoapp/register_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initState(){
    pasarPage();
    super.initState();
  }

  Future<void> pasarPage() async{
    Future.delayed(const Duration(seconds: 3), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
          child: const Image(image: AssetImage("assets/Logo.png"),width: 200, height: 200),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          margin: const EdgeInsets.all(40),
        ),
      ]
      ),
    );
  }
}
