import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 80,
            ),
            Image.network(
              "https://static-00.iconduck.com/assets.00/android-plain-wordmark-icon-256x256-ppoejbtc.png",
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cEmail,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: controller.cPass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                cAuth.login(controller.cEmail.text, controller.cPass.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 105, 150, 34),
                foregroundColor: Colors.white,
              ),
              child: Text("Login"),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text("Reset Password"),
                onPressed: () {
                  Get.offAllNamed(Routes.RESET_PASSWORD);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya Akun ?"),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.SIGNUP);
                  },
                  child: Text("Daftar Disini"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => cAuth.LoginGoogle(),
              child: Text("Login with google"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
