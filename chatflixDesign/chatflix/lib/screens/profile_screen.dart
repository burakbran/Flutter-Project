import 'package:chatflix/responsive/responsive.dart';
import 'package:chatflix/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../const/const.dart';

//Profil sayfası
//tasarımsal olarak kalacağı için stateles widget kullandım
//ampule tıklayıp stateful widget'a çevirebilirsiniz
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //İçeriğin ekrana göre genişliği ve yüksekliği
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //sayfa vücudu
    return Scaffold(
      extendBody: true,
      //Vücut olarak boyutlandırma kutusunu ayarlıyoruz
      body: SizedBox(
        //genişlik ve yükseklik degerleri verdik
        width: screenWidth,
        height: screenHeight,
        //taşma olmaması için scroll sayfa görüntüleyicinin içerisine aldık
        child: SingleChildScrollView(
          //arka plan resmi için konteynır ekledik
          child: Container(
            //burada ekran kontroleri yapıyoruz
            //telefon ekranından büyükse yatay ve dikey boşlukları veriyoruz
            //telefonda açılmışsa boşluk vermiyoruz
            padding: screenWidth > webScreenSize
                ? EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4,
                    vertical: 50)
                : EdgeInsets.all(0),
            //genişlik ve yükseklik degeri verdik
            width: screenWidth,
            height: screenHeight,
            //konteynırı özelleştirmek için dekorasyon ekledik
            decoration: const BoxDecoration(
              //renk
              color: Colors.black,
              //arkaplan uzay resmi
              image: DecorationImage(
                image: AssetImage("assets/images/bg-image.jpg"),
                fit: BoxFit.cover, //tüm ekranlara sığdırır
              ),
            ),
            //konteynırın içine padding ekledik
            child: Padding(
              //kenarlardan boşluk degerlerini veriyoruz
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 70.0,
                bottom: 40.0,
              ),
              //cam ve blur efekti olan konteynır kullanacağız
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
                //arkaplan hafif kırmızı ve opasite
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
                //şimdi cam efektli konteynırın içerisinede scroll sayfa görüntüleyici ekledik
                child: SingleChildScrollView(
                  //Scroll sayfasının içine kolon ekledik
                  child: Column(
                    //herşeyi ortaya hizaladık
                    mainAxisAlignment: MainAxisAlignment.center,
                    //kolonun içerisine gelecek widget öğelerini ekliyoruz
                    children: [
                      //hizalamak için widget ekledik
                      Align(
                        //seçenekler ikonunu sağ tarafa ekledik
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_rounded,
                            color: KGeneralWhite,
                          ), //üzerine gelince veya basılı tutulursa gösterilecek yazı
                          tooltip: "seçenekler",
                        ),
                      ),
                      //profil resmi ekledik
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/burak.png"),
                        radius: 80, //boyut verdik
                      ),
                      //altına boşluk eklemek için boyutlandırma kutusu ekliyoruz
                      const SizedBox(
                        height: 10,
                      ),
                      //konteynır oluşturduk
                      Container(
                        //konteynırın içerisine kolon ekliyoruz
                        child: Column(
                          //kolonun içindeki herşeyi ortalıyoruz
                          mainAxisAlignment: MainAxisAlignment.center,
                          //kolonun içine öğelerimizi ekliyoruz
                          children: [
                            //Kullanıcı adı ve soy adı
                            const Text(
                              "Burak Baran",
                              style: TextStyle(
                                  color: KGeneralWhite,
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),
                            ),
                            //altına boşluk ekliyoruz
                            const SizedBox(
                              height: 15,
                            ),
                            //şimdi satır oluşturuyoruz , yan yana bilgileri ekleyeceğiz
                            Row(
                              //satır içerisindeki öğeleri etrafından eşit olarak ayırır
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //satırın içine gelecek öğeleri ekleyeceğiz
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
                                //izlenilen filmlerin sayısı bilgisi
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            //altına bir satır daha ekledik ve aynı şekilde karşılık gelen bilgileri ekliyoruz
                            Row(
                              //etraflarından eşit bir şekilde ayırır
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //satırın içine gelecek öğeleri ekliyoruz
                              children: [
                                //eşleşme sayısı bilgisine denk gelecek
                                Text(
                                  "44",
                                  style: TextStyle(
                                      color: KGeneralWhite,
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold),
                                ),
                                //film sayısı bilgisine denk gelecek
                                Text(
                                  "81",
                                  style: TextStyle(
                                      color: KGeneralWhite,
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold),
                                ),
                                //sıralama puanı bilgisine denk gelecek
                                Text(
                                  "400+",
                                  style: TextStyle(
                                      color: KGeneralWhite,
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            //satırdan çıktık ve altına boşluk bıraktık
                            const SizedBox(
                              height: 15,
                            ),
                            //biyografi için bir konteynır oluşturduk
                            Container(
                              //kenarlardan dış ve iç boşluk ekliyoruz
                              margin:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              //konteynırı özelleştirmek için dekorasyon ekledik
                              decoration: BoxDecoration(
                                //border rengi ve genişliği veriyoruz
                                border: Border.all(
                                  color: KBioPanel.withOpacity(0.2),
                                  width: 5,
                                ),
                                //konteynırın kenarlarının yuvarlaklık değerini ayarladık
                                borderRadius: BorderRadius.circular(20),
                                //konteynırın arka plan rengini gradient olarak verip opasitesini kısıyoruz
                                gradient: LinearGradient(
                                  colors: [
                                    KWhite.withOpacity(0.1),
                                    KWhiteOpacity.withOpacity(0.1)
                                  ],
                                ),
                              ),
                              //şimdi kolon ekledik
                              child: Column(
                                //alt alta gelecek öğeleri veriyoruz
                                children: [
                                  //Bio yazan başlık yazısı
                                  const Text(
                                    "Bio",
                                    //yazı stili
                                    style: TextStyle(
                                        //renk,fon boyutu,font tipi ve font kalınlığı verdik
                                        color: KGeneralWhite,
                                        fontSize: 17,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  //altına boşluk bıraktık
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  //boşluk widgeti içerisine kullanıcının biyografi bilgisini ekleyeceğiz
                                  const Padding(
                                    //kenarlardan boşluk degerlerini verdik
                                    padding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    //şimdi içerisine biyografi bilgisini yazan text kısmını ekledik
                                    child: Text(
                                      "Filmlerle beraber chatflix de olmak iyi hissettiriyor, harika bir deneyim",
                                      //yazı stili veriyoruz
                                      style: TextStyle(
                                        //renk,font boyutu,font tipi, ve font kalınlığı verdik
                                        color: KGeneralWhiteLight,
                                        fontSize: 14,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.normal,
                                      ),
                                      //yazıyı ortaladık
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //şimdi mesaj gönder butonu için konteynır ekledik
                      Container(
                        //yükseklik
                        height: 35,
                        //dış boşluk degeri sadece üst taraftan
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        //Mesaj gönder butonu - Elevated button
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen())),
                          //Butonun yazısı - Mesaj gönder
                          child: const Text(
                            'Mesaj gönder',
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
