import 'package:chatflix/card/feed_card.dart';
import 'package:chatflix/const/const.dart';
import 'package:chatflix/responsive/responsive.dart';
import 'package:chatflix/screens/chat_screen.dart';
import 'package:chatflix/screens/your_profile_screen.dart';
import 'package:chatflix/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/gestures.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreen();
}

class _FeedScreen extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    //İçeriğin ekrana göre genişliği ve yüksekliği
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //sayfa vücudu
    return Scaffold(
      //boyutlandırma kutusu
      body: SizedBox(
        //genişlik yükseklik
        width: screenWidth,
        height: screenHeight,
        //taşma olmamması için ve klavye açıldığında sayfayı hareket ettirebilmemiz için scroll widget'tı
        child: Stack(
          //alt çocukları
          children: [
            //arka plan fotografı için konteynır
            Container(
              //konteynırı özelleştirmek için dekorasyon
              decoration: const BoxDecoration(
                //arkaplan rengi
                color: Colors.black,
                //arkaplan fotografı
                image: DecorationImage(
                  image: AssetImage("assets/images/bg-image.jpg"),
                  //fotografın opasite degeri
                  opacity: 0.7,
                  //tüm cihaz ekranlarına tam olarak sığması için fit özelliği ayarladık
                  fit: BoxFit.cover,
                ),
              ),
              //genişlik ve yükseklik degerleri
              width: screenWidth,
              height: screenHeight,
              //liste görüntüleyici
              child: ListView(
                children: [
                  //yukarıya chat ve profil sayfasına gitmek için butonları oluşturduk
                  Container(
                    //kenarlardan boşluk verdik
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 10,
                      right: 10,
                    ),
                    //satır ekliyoruz
                    child: Row(
                      //eger normal telefondan büyük ekranda açılırsa butonları sağ tarafa yasla
                      //telefonda açılırsa butonların birini sağa birini sola yasla, yani ikisini ortadan iter
                      mainAxisAlignment: screenWidth > webScreenSize
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.spaceBetween,
                      //satırın içerisine gelecek butonları veriyoruz
                      children: [
                        //profil sayfasına gidecek buton
                        IconButton(
                          //profil sayfasına yönlendirir
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => YourProfileScreen(),
                            ),
                          ),
                          //kendi ikonumuzu vermek için imageikon kullanıyoruz
                          icon: const ImageIcon(
                            //dosyalarımızdan ikonu ekledik
                            AssetImage(
                              "assets/icons/account.png",
                            ),
                            //rengi beyaz olacak
                            color: Colors.white,
                          ),
                          //boyutu
                          iconSize: 40,
                        ),
                        //arasına bir boşluk eklemek için boyutlandırma kutusu veriyoruz
                        //buradada yine ekran kontrolleri yaptık
                        //büyük ekranda açılırsa genişlik 10,telefon ekranında ise 0 olacak
                        screenWidth > webScreenSize
                            ? const SizedBox(
                                width: 10,
                              )
                            : const SizedBox(),
                        //burada chat sayfası için butonunmuzu verdik
                        IconButton(
                          //chat sayfasına yönlendirir
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(),
                            ),
                          ), //kendi ikonumuzu kullanacağız
                          icon: const ImageIcon(
                            //dosyalarımızdan ikonunmuzu ekledik
                            AssetImage(
                              "assets/icons/chat.png",
                            ),
                            //rengi beyaz olacak
                            color: Colors.white,
                          ),
                          //boyut
                          iconSize: 40,
                        )
                      ],
                    ),
                  ),
                  //üst ikonlar kısmı bitti
                  //
                  //şimdi ortadaki kartı oluşturuyoruz
                  Container(
                    //ortaya hizaladık
                    alignment: Alignment.center,
                    //kenarlardan boşluk bıraktık
                    //boşluk bırakırken ekran boyutu kontrolu yaptık, eger ekran çok büyükse , giriş ekranını ona göre ayarladık
                    //web uyumlu
                    padding: screenWidth > webScreenSize
                        ? EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 3,
                            vertical: 50)
                        : const EdgeInsets.only(
                            left: 25, right: 25, bottom: 25, top: 5),
                    //card klasöründen kartımızı çagırıyoruz
                    child: FeedCard(),
                  ),
                  //Bir satır ekledik, çünkü yan yana iki icon butonu gelecek
                  Row(
                    //satırın içerisindekileri ortaya hizaladık
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Çarpı butonu
                      Image.asset(
                        "assets/icons/multiply.png",
                        width: 55,
                        height: 55,
                      ),
                      //arasına boşluk vermek için boyutlandırma kutusu ekledik
                      const SizedBox(
                        width: 30,
                      ),
                      //Check mark ikonu
                      Image.asset(
                        "assets/icons/check.png",
                        width: 55,
                        height: 55,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
