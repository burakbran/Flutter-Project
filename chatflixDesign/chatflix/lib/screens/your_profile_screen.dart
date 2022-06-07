import 'package:chatflix/responsive/responsive.dart';
import 'package:chatflix/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../const/const.dart';

//Sizin Profil sayfanız
//tasarımsal olarak kalacağı için stateles widget kullandım
//ampule tıklayıp stateful widget'a çevirebilirsiniz
class YourProfileScreen extends StatelessWidget {
  const YourProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //İçeriğin ekrana göre genişliği ve yüksekliği
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //sayfa vücudu
    return Scaffold(
      extendBody: true,
      //Vücut olarak boyut kutusunu veriyoruz
      body: SizedBox(
        //genişlik ve yükseklik degerlerini verdik
        width: screenWidth,
        height: screenHeight,
        //taşma olmaması için scroll sayfa görüntüleyici oluşturduk
        child: SingleChildScrollView(
          //içine konteynır ekliyoruz
          child: Container(
            //genişlik ve yükseklik degerlerini verdik
            width: screenWidth,
            height: screenHeight,
            //ekran boyutu kontrolu yapıyoruz, ekran büyükse yatay ve dikey boşluk veriyoruz, değilse boşluk vermiyoruz
            padding: screenWidth > webScreenSize
                ? EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4,
                    vertical: 50)
                : EdgeInsets.all(0),
            //konteynırı özelleştirmek için dekorasyon ekliyoruz
            decoration: const BoxDecoration(
              //renk verdik
              color: Colors.black,
              //arka plan uzay resmini ekledik
              image: DecorationImage(
                image: AssetImage("assets/images/bg-image.jpg"),
                fit: BoxFit.cover, //tüm ekranlara göre sığdırdık
              ),
            ),
            //boşluk widget'tı ekliyoruz
            child: Padding(
              //sol sağ ve üst, alt boşluk değerlerini girdik
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 70.0, bottom: 40.0),
              //cam ve blur efekti olan konteynır ekliyoruz
              child: GlassmorphicContainer(
                //içindeki her şeyi ortalar
                alignment: Alignment.center,
                //zorunlu olarak istenilen genişlik ve yükseklik degerleri
                width: 350,
                height: 490,
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
                //arkaplana hafif kırmızı renk ve opasite degerini verdik
                linearGradient: LinearGradient(
                    //renklerin başlangıç yeri
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    //renkler
                    colors: [
                      //her iki renk aynı
                      KRedOpacity.withOpacity(0.4),
                      KRedOpacity2.withOpacity(0.4),
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
                    KWhiteOpacity.withOpacity(0.5),
                    KWhiteOpacity2.withOpacity(0.5),
                  ],
                ),
                //cam efektli konteynırın alt çocuk widgetı'nı veriyoruz
                //taşma olmaması için scroll sayfa görüntüleyici ekledik
                child: SingleChildScrollView(
                  //scroll sayfasına kolon ekliyoruz
                  child: Column(
                    //içindeki öğeleri ortaya hizaladık
                    mainAxisAlignment: MainAxisAlignment.center,
                    //şimdi içindeki öğelerini veriyoruz
                    children: [
                      //hizalamak için bir widget
                      Align(
                        //sağ ortaya hizaladık
                        alignment: Alignment.centerRight,
                        //çıkış yap butonunu ekliyoruz
                        child: IconButton(
                          //ve başlangıç sayfasına yönlendirdik
                          onPressed: () =>
                              Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
                          //çıkış yap ikonu
                          icon: const Icon(
                            Icons.logout_rounded,
                            color: KGeneralWhite,
                          ),
                          //üzerine gelince veya basılı tutlunca gösterilecek yazıyı ayarladık
                          tooltip: "Çıkış Yap",
                        ),
                      ),
                      //profil resmini ekledik
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/yourProfile.jpg",
                        ),
                        //boyutunu ayarladık
                        radius: 80,
                      ),
                      //altta boşluk bıraktık
                      const SizedBox(
                        height: 10,
                      ),
                      //kullanıcı bilgileri için konteynır ekliyoruz
                      Container(
                        //konteynırın içine kolon ekledik
                        child: Column(
                          //kolonun içindekileri ortaya hizaladık
                          mainAxisAlignment: MainAxisAlignment.center,
                          //kolonun içine öğeleri ekliyoruz
                          children: [
                            //kullanıcının adı soyadı
                            const Text(
                              "Burak Baran",
                              //yazı stili
                              style: TextStyle(
                                  //renk ,font boyutu,font tipi ve font kalınlığı verdik
                                  color: KGeneralWhite,
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),
                            ),
                            //altta boşluk ekliyoruz
                            const SizedBox(
                              height: 15,
                            ),
                            //bilgiler için satır ekliyoruz
                            Row(
                              //tüm öğelerin etrafından eşit şekilde iter
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //eşleşme sayısı bilgisi
                                const Text(
                                  "Eşleşme",
                                  style: TextStyle(
                                      color: KGeneralWhite,
                                      fontSize: 17,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold),
                                ),
                                //filmlerin sayısı bilgisi
                                const Text(
                                  "Filmler",
                                  style: TextStyle(
                                      color: KGeneralWhite,
                                      fontSize: 17,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold),
                                ),
                                //sıralama puanı bilgisi
                                const Text(
                                  "Sıralama",
                                  style: TextStyle(
                                      color: KGeneralWhite,
                                      fontSize: 17,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //şimdi bir satır daha ekledik, yukardaki bilgilerin karşılıklarını ekliyoruz
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //eşleşme sayısının karşılığı
                                const Text(
                                  "29",
                                  style: TextStyle(
                                    color: KGeneralWhite,
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //film sayısının karşılığı
                                const Text(
                                  "75",
                                  style: TextStyle(
                                    color: KGeneralWhite,
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //sıralama puanının karşılığı
                                const Text(
                                  "300+",
                                  style: TextStyle(
                                    color: KGeneralWhite,
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            //altta boşluk ekledik
                            const SizedBox(
                              height: 15,
                            ),
                            //Biyografi için konteynır oluşturduk
                            Container(
                              //konteynırın dış boşluk değerlerini girdik
                              margin: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              //konteynırın iç boşluk değerlerini girdik
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              //konteynırı özelleştirmek için dekorasyon ekliyoruz
                              decoration: BoxDecoration(
                                //kenarlık rengini ve genişliğini verdik
                                border: Border.all(
                                  color: KBioPanel.withOpacity(0.2),
                                  width: 5,
                                ),
                                //kenarlık yuvarlaklık değerini veriyoruz
                                borderRadius: BorderRadius.circular(20),
                                //arkaplan rengi için gradient oluşturduk
                                gradient: LinearGradient(
                                  colors: [
                                    KWhite.withOpacity(0.1),
                                    KWhiteOpacity.withOpacity(0.1)
                                  ],
                                ),
                              ),
                              //alt alta öğe dizmek için kolon ekliyoruz
                              child: Column(
                                //kolon içine öğelerimizi ekleyeceğiz
                                children: [
                                  //Bio başlığı
                                  const Text(
                                    "Bio",
                                    //yazı stili
                                    style: TextStyle(
                                        //renk, font boyutu, font tipi, font kalınlığı
                                        color: KGeneralWhite,
                                        fontSize: 17,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  //altta boşluk bıraktık
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  //kullanıcının biyografi bilgisini giriyoruz
                                  const Padding(
                                    //sol ve sağ kenarlardan boşluk verdik
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    //kullanıcının biyofrafi bilgisi
                                    child: const Text(
                                      "Film izlemeyi çok seviyorum, genel de polisiye filmleri izlerim, chatflix olunca bir başka oluyor",
                                      //yazı stili , renk , font boyutu, font tipi ve font kalınlığını verdik
                                      style: TextStyle(
                                        color: KGeneralWhiteLight,
                                        fontSize: 14,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.normal,
                                      ),
                                      //yazıları ortaladık
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Düzenle butonu için konteynır
                      Container(
                        //yükseklik
                        height: 35,
                        //dış boşluk degeri sadece üst taraftan
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        //Profili düzenle butonu - Elevated button
                        child: ElevatedButton(
                          onPressed: () {},
                          //Butonun yazısı - Giriş yap
                          child: const Text(
                            'Düzenle',
                            //yazı stili
                            style: TextStyle(
                                fontWeight: FontWeight.bold, //kalın font
                                fontFamily: 'Roboto', //font tipi roboto
                                fontSize: 17, //boyutu
                                color: KLoginButtonColor),
                          ),
                          //buton stili
                          style: ElevatedButton.styleFrom(
                              onPrimary:
                                  KLoginButtonOnPrimary, //tıklandığındaki animasyon rengi
                              primary:
                                  KLoginButtonPrimary, //butonun arka plan rengi
                              //butonun kenar yuvarlaklık degeri
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      //En üst'deki geri butonu
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        backgroundColor: Colors.transparent,
        child: const Icon(Icons.arrow_back),
        elevation: 0,
        mini: true,
        tooltip: "Geri dön",
      ),
    );
  }
}
