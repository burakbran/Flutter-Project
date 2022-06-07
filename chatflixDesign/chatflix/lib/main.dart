import 'package:chatflix/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //alttaki sınıfı çalıştırır
}

//stateless widget değişimlere tepki verebilen widget, yazıların değişmesi gibi.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //sağ üstte çıkan debug modu yazısını siliyoruz
      debugShowCheckedModeBanner: false,
      //uygulamamızın geçmiş küçültme ekranındaki başlığı
      title: 'CHATFLIX',
      theme: ThemeData(
        // uygulamamızın genel tema rengi.
        primarySwatch: Colors.red,
      ),
      //ilk başlangıç sayfamızı başlatır
      home: const HomeScreen(),
    );
  }
}
