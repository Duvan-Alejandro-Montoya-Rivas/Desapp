import 'package:flutter/material.dart';
import 'package:viajoapp/home_page.dart';
import 'package:viajoapp/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email=TextEditingController();
  final password=TextEditingController();

  void validarUsuario(){

    if(email.text.isNotEmpty && password.text.isNotEmpty){

      if(email.text=="andres"){

        if(password.text=="123456"){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()));
        }else{
          mostrarMensaje("Contraseña Incorrecta");
        }
      }else {
        mostrarMensaje("Usuario NO registrado");
      }
    }else{
      mostrarMensaje("Datos Obligatorios");
    }
  }

  void mostrarMensaje(String mensaje){
    final pantalla=ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
      SnackBar(
        content: Text(mensaje, style: const TextStyle(fontSize: 20)  ),
        backgroundColor: const Color(0xFF00BCD4),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Aceptar',
          onPressed: pantalla.hideCurrentSnackBar,
          textColor: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  margin: const EdgeInsets.all(30),
                  child: const Image(
                      image: AssetImage("assets/Logo.png"),width: 120, height: 120),
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      labelText: "Usuario",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.perm_identity, color: Colors.black, size: 20)
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.black, size: 20)
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black)
                    ),
                    onPressed: (){
                      Navigator.push( context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                    },
                    child: const Text("Registrarse")
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        shadowColor: Colors.black26,
                        textStyle: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        )
                    ),
                    onPressed: (){
                      validarUsuario();
                    },
                    child: const Text("Ingresar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
