import 'package:chatflix/const/const.dart';
import 'package:chatflix/responsive/responsive.dart';
import 'package:chatflix/screens/login_screen.dart';
import 'package:chatflix/screens/register_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //İçeriğin ekrana göre genişliği ve yüksekliği
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //sayfa vücudumuz
    return Scaffold(
      //Boyut kutusu
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        //stack widget'ları alt alta dizmemizi sağlayan yığın kontrol widgeti
        child: Stack(
          children: [
            //cihaz ekranlarına göre taşma yapmaması için  güvenli bölge
            Container(
              alignment: Alignment.center,
              //genişlik ve yükseklik
              width: screenWidth,
              height: screenHeight,
              //konteynırı özelleştirmek için dekorasyon widgetı
              decoration: const BoxDecoration(
                //arkaplan rengi
                color: Colors.black,
                //arkaplan fotoğrafı
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    //opasitesini kısıyoruz
                    opacity: 0.7,
                    //çeşitli cihaz ekranlarına göre fotoğrafın ekrana oturmasını sağlıyoruz
                    fit: BoxFit.cover),
              ),
              //tüm widget ,buton, ve yazıları alt alta sıralamak için widget
              child: SingleChildScrollView(
                primary: true,
                child: Column(
                  //içerisindeki herşey ekrana göre ortalanacak
                  mainAxisAlignment: MainAxisAlignment.center,
                  //içerisinde barındırdığı tüm çocuk widgetlar
                  children: [
                    //büyük chatflix başlıgı
                    Text(
                      "CHATFLIX",
                      //yazı stili ve rengi
                      style: TextStyle(
                        color: Chatflixred, //renk
                        fontSize:
                            screenWidth > webScreenSize ? 110 : 60, //boyut
                        fontFamily: 'Bebas', //font
                        fontWeight: FontWeight.bold, //kalınlık
                        letterSpacing: 2, //harfler arası mesafe
                      ),
                    ),
                    //Boşluk
                    const SizedBox(
                      height: 60,
                    ),
                    //Uygulama motto yazısı
                    Text(
                      "Dizi ve Filmlerin\nSosyal Medyası",
                      //yazı stili ve rengi
                      style: TextStyle(
                        color: KWhite, //renk
                        fontSize: screenWidth > webScreenSize ? 40 : 25, //boyut
                        fontFamily: 'Roboto', //font
                        fontWeight: FontWeight.bold, //kalınlık
                        letterSpacing: 3, //harfler arası mesafe
                      ),
                      textAlign: TextAlign.center,
                    ),

                    //Giriş yap butonu için konteynır oluşturduk
                    Container(
                      //genişlik ve yükseklik veriyoruz
                      width: screenWidth / 2,
                      height: 50,
                      //dış boşluk veriyoruz
                      margin: const EdgeInsets.only(
                        top: 35,
                      ),
                      //giriş butonu - Elevated button
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),//giriş sayfasına gider
                          ),
                        ), //
                        //Butonun yazısı - giriş yap
                        child: const Text(
                          'Giriş Yap',
                          //yazı stili
                          style: TextStyle(
                            fontWeight: FontWeight.bold, //kalın font
                            fontFamily: 'Roboto', //font tipi roboto
                            fontSize: 23, //boyutu
                          ),
                        ),
                        //buton stili
                        style: ElevatedButton.styleFrom(
                          primary: KButtonColor, //butonun arka plan rengi
                          //butonun radius degeri
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                      ),
                    ),
                    //kaydol butonu için konteynır
                    Container(
                      //genişlik ve yükseklik veriyoruz
                      width: screenWidth / 2,
                      height: 50,
                      //sadece üst taraftan dış boşluk veriyoruz
                      margin: const EdgeInsets.only(
                        top: 35,
                      ),
                      //Kayıt Ol butonu - Elevated button
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegisterScreen())), //Kayıt ol sayfasına geçiş yap
                        //Butonun yazısı - Kayıt Ol
                        child: const Text(
                          'Kayıt Ol',
                          //yazı stili
                          style: TextStyle(
                            fontWeight: FontWeight.bold, //kalın font
                            fontFamily: 'Roboto', //font tipi roboto
                            fontSize: 23, //boyutu
                          ),
                        ),
                        //buton stili
                        style: ElevatedButton.styleFrom(
                            primary: KButtonColor, //butonun arka plan rengi
                            //butonun radius degeri
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
