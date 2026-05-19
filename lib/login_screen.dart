import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobil_proje/widgets/mytext_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();
  final pwdController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPwdController = TextEditingController();

  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("lib/images/resim.jpg", fit: BoxFit.cover),
          ),

          Center(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ), // resimi bulanık yapıyor
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white, width: 2),
                  ),

                  width: 350,
                  height: 500,

                  child: Column(
                    children: [
                      Container(
                        color: Colors.white12,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLogin = true;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  color: isLogin
                                      ? Colors.white24
                                      : Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      //Giriş Yap Başlığı
                                      "Giriş Yap",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLogin = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  color: !isLogin
                                      ? Colors.white24
                                      : Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      //Giriş Yap Başlığı
                                      "Kayıt Ol",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15),

                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          // Kullanıcı ADI ŞİFRE YAZISI
                          isLogin
                              ? "Kullanıcı Adı ve Şifrenizi Giriniz"
                              : "Yeni Hesap Oluştur",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      if (!isLogin) ...[
                        MytextField(
                          hintText: "Ad Soyad Giriniz",
                          prefixIcon: Icon(Icons.person),
                          controller: nameController,
                        ),
                      ],
                      SizedBox(height: 15),

                      MytextField(
                        controller: userController,
                        hintText: "Kullanıcı Adınızı Giriniz",
                        prefixIcon: Icon(Icons.person),
                      ),
                      SizedBox(height: 15),
                      MytextField(
                        controller: pwdController,
                        hintText: "Şifrenizi Giriniz",
                        prefixIcon: Icon(Icons.lock),
                        obscureText: true,
                      ),

                      // Şifremi Unuttum Kısmı
                      if (isLogin) ...[
                        SizedBox(height: 15),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Şifremi Unuttum",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],

                      if (!isLogin) ...[
                        SizedBox(height: 15),
                        MytextField(
                          obscureText: true,
                          hintText: "Şifre Oluştur",
                          prefixIcon: Icon(Icons.lock),
                          controller: confirmPwdController,
                        ),
                      ],
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            isLogin ? "Giriş Yap" : "Kayıt Ol",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
