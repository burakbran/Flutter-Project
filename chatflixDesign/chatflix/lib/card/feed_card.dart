import 'package:chatflix/const/const.dart';
import 'package:chatflix/screens/your_profile_screen.dart';
import 'package:chatflix/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({Key? key}) : super(key: key);

  @override
  State<FeedCard> createState() => _FeedCardState();
}

//Anasayfa kısmındaki eşleşmeler kartı
class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    //İçeriğin ekrana göre genişliği ve yüksekliği
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            //Anasayfa eşleşmeler yazısı
            child: const Text(
              "Eşleşmeler",
              //yazı stili ve rengi
              style: TextStyle(
                color: KWhite, //renk
                fontSize: 28, //boyut
                fontFamily: 'Roboto', //font
                fontWeight: FontWeight.bold, //kalınlık
                letterSpacing: 3, //harfler arası mesafe
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GlassmorphicContainer(
            //içindeki her şeyi ortalar
            alignment: Alignment.center,
            //zorunlu olarak istenilen genişlik ve yükseklik degerleri
            width: 270,
            height: 340,
            //kenar yuvarlaklık degeri
            borderRadius: 20,
            //bulanıklık degeri sıfır - yok
            blur: 0,
            //kenar border kalınlıgı
            border: 5,
            //maximum ve minimum boyutları
            constraints: BoxConstraints(
              maxHeight: screenHeight,
              maxWidth: screenWidth,
              minHeight: 200,
              minWidth: 200,
            ),
            //arkaplan hafif kırmızı ve opasite
            linearGradient: LinearGradient(
                //renklerin başlangıç yeri
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                //renkler
                colors: [
                  //her iki renk aynı
                  KWhiteOpacity.withOpacity(0.4),
                  KWhiteOpacity2.withOpacity(0.4),
                ],
                //bitiş degerleri
                stops: [
                  0.1,
                  1,
                ]),
            //kenarlık renkleri
            borderGradient: LinearGradient(
              //renklerin başlangıç yeri
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                //her iki renk aynı
                KRedOpacity.withOpacity(0.4),
                KRedOpacity2.withOpacity(0.4),
              ],
            ),
            //taşma olmaması için  scroll sayfası
            child: SingleChildScrollView(
              primary: true,
              //alt alta widget sıralayan kolon
              child: Column(
                //her şeyi ortala
                mainAxisAlignment: MainAxisAlignment.center,
                //çocukları
                children: [
                  //fotogrfın etrafına kırmızı border vermek için konteynır
                  InkWell(
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen())),
                    child: Container(
                      //konteynırı özelleştirmek için dekorasyon
                      decoration: BoxDecoration(
                        //Her taraftan 7 px kırmızı border verdik
                        border: Border.all(
                          color: Color.fromARGB(255, 190, 13, 0),
                          width: 7,
                        ),
                        //border kenarlarının yuvarlaklık degeri
                        borderRadius: BorderRadius.circular(35),
                      ),//fotografın kenarlarını yuvarlatmak için cliprrect widget'ı
                      child: ClipRRect(
                        //fotografın kenarlarının yuvarlaklık degeri
                        borderRadius: BorderRadius.circular(27),
                        //kullanacagımız fotografı belirtiyoruz
                        child: Image.asset(
                          "assets/images/burak.png",
                          //genişlik yükseklik
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                  //Boşluk vermek için padding widget'tı
                  const Padding(
                    //sadece üst taraftan boşluk verdik
                    padding: EdgeInsets.only(top: 20.0),
                    //daha sonra çocuk widget olarak yazımızı ekledik
                    child: Text(
                      //Tek yazı widget'tı ekledik ve alt alta yazdırdık
                      "Dark 1.Sezon\n3.bölüm\nUyum %80",
                      //yazı stilimizi verdik
                      style: TextStyle(
                        //renk
                        color: KGeneralWhite,
                        //font tipi
                        fontFamily: "Roboto",
                        //font boyutu
                        fontSize: 24,
                        //font kalınlığı
                        fontWeight: FontWeight.bold,
                      ),
                      //yazıyı ortaladık
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
