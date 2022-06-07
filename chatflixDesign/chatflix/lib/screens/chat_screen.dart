import 'package:chatflix/chatlist/chat_message_list.dart';
import 'package:chatflix/chatlist/chat_users_list.dart';
import 'package:chatflix/responsive/responsive.dart';
import 'package:chatflix/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../const/const.dart';

//Chat sayfası
//tasarımsal olarak kalacağı için stateles widget kullandım
//ampule tıklayıp stateful widget'a çevirebilirsiniz
class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    //İçeriğin ekrana göre genişliği ve yüksekliği
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //sayfa vücudu
    return Scaffold(
      extendBody: true,
      //vücut olarak boyutlandırma kutusu
      body: SizedBox(
        //genişlik ve yükseklik
        width: screenWidth,
        height: screenHeight,
        //taşma olmaması için scroll sayfa görüntüleyici
        child: SingleChildScrollView(
          //çocuk widget olarak konteynır verdik
          child: Container(
            //telefon ekranından çok büyükse küçültmek için padding kontrolu yaptık
            //horizontal yatay
            //vertical dikey olarak boşluk verdik
            padding: screenWidth > padScreenSize
                ? EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width /4,
                    vertical: 50)
                : EdgeInsets.all(0),//eger telefon ekranından büyük değilse hiç bir deger almasın
                //genişlik ve yükseklik degerleini verdik
            width: screenWidth,
            height: screenHeight,
            //konteynırı özelleştirmek için dekorasyon ekledik
            decoration: const BoxDecoration(
              //renk verdik
              color: Colors.black,
              //arka plan resmi ekledik, cover özelliği ile ekrana göre ayarladık
              image: DecorationImage(
                  image: AssetImage("assets/images/bg-image.jpg"),
                  fit: BoxFit.cover),
            ),
            //çocuk widget olarak padding boşluk widget'tı ekledik
            child: Padding(
              //kenarlardan farklı degerlerde boşluklar verdik
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 65.0, bottom: 15.0),
                  //cam ve blur efektli bir konteynır kullandık
              child: GlassmorphicContainer(
                //içindeki her şeyi ortalar
                alignment: Alignment.center,
                //zorunlu olarak istenilen genişlik ve yükseklik degerleri
                width: 350,
                height: 520,
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
                //arkaplan hafif kırmızı ve opasitesi düşük olarak ayarladık
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
                //cam özellikli konteynırın içerisine gelecek çocuk widget'tı verdik
                //kenarlardan boşluk vemek için padding
                child: Padding(
                  //sadece alt kısımdan boşluk verdik
                  padding: const EdgeInsets.only(bottom: 8.0),
                  //liste görüntüleyici oluşturduk
                  child: ListView(
                    //scroll kontroller ekledik
                    controller: _controller,
                    //burada chat kısımları başlıyor
                    //chat sayfasındaki arama kutusunu ekledik (widgets klasöründen çagırdık)
                    children: [
                      const SearchFieldWidget(
                        //buraya istenilen boşluk degerlerini verdik-yatay ve dikey 
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                      ),
                      //boşluk widget'tı oluşturduk , içerisine yazı ekledik
                      const Padding(
                        //sol ve alt boşluk degerleri
                        padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
                        //yazı
                        child: Text(
                          "Favoriler",
                          //yazı stili
                          style: TextStyle(
                            //yazı rengi ve font kalınlığı
                              color: KGeneralWhiteLight,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      //Buraya size box ekledik
                      SizedBox(
                        //yükseklik degerini ayarladık
                        height: 110,
                        //daha sonra içerisine boşluk widget'tı ekledik
                        child: Padding(
                          //sol ve sağ boşluk degerlerini verdik
                          padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                          //Bir liste inşaa edici ekledik
                          child: ListView.builder(
                            //ihtiyaç duyduğu alanı kaplaması için true degeri verdik
                              shrinkWrap: true,
                              //içindeki ögeleri yatay olarak sıralaması için scroll özelliğini yatay olarak ayarladık
                              scrollDirection: Axis.horizontal,
                              //oluşturacağı item sayısı olarak chat list klasöründeki listemizin uzunluğunu verdik
                              itemCount: fullName.length,//listede kaç öğe varsa oluştur
                              itemBuilder: (context, index) {
                                //oluşturacagı item olarak flat buton verdim
                                return FlatButton(
                                  //fonksiyonu boş olarak verdik, boş olsada vermek zorundayız
                                  onPressed: () {},
                                  //flat buton içerisine konteynır ekledik
                                  child: Container(
                                    //tüm heryerden boşluk verdik
                                    padding: const EdgeInsets.all(10.0),
                                    //alt alta item eklemek için kolon oluşturduk
                                    child: Column(
                                      //kolonun içerdiği widgetlar'ı verdik
                                      children: [
                                        //profil resmi görüntüsü için yuvarlak avatar 
                                        CircleAvatar(
                                          //profil resimlerini index degerine göre listeden alacak
                                          backgroundImage:
                                              AssetImage(profilePicture[index]),
                                              //boyutu için yuvarlaklık degeri verdik
                                          radius: 30,
                                        ),
                                        //arasına boşluk eklemek için bir boyut kutusu kullandık
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        //İsim soyisim degerlerini listeden çektik, index degerine göre oluşturduk
                                        Text(
                                          fullName[index],
                                          style: const TextStyle(
                                              color: KGeneralWhite,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      //Favoriler kısmı bitti şimdi normal chat kısmına geçecegiz
                      //
                      //boşluk widget'ı verdik
                      const Padding(
                        //boşluk degerlerini verdik
                        padding: EdgeInsets.only(left: 15.0, bottom: 2.0),
                        //chat yazısını yazdık
                        child: Text(
                          "Chat",
                          //yazı stilini verdik
                          style: TextStyle(
                            //renk ve font kalınlıgını ayarladık
                              color: KGeneralWhiteLight,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      //başlık kısmı bitti chat yazısının altına bir çizgi çektik
                      const Divider(
                        //çizginin rengini daha hafif tonlarda ve az görünür olarak verdik
                        color: KDividerLightWhite,
                      ),
                      //şimdi listemiz için bir boyut kutusu verdik
                      SizedBox(
                        //yükseklik degeri ekran degerinin /1.20 si olarak verdik
                        height: screenHeight / 1.20,
                        //boşluk widget'ı ekliyoruz
                        child: Padding(
                          //sadece sağ ve sol taraftan boşlukları ayarladık
                          padding: const EdgeInsets.only(
                            left: 7.0,
                            right: 7.0,
                          ),
                          //şimdi chat listemiz için liste inşaa edici ekledik
                          child: ListView.builder(
                            //ihtiyaç duyduğu alan kadar kaplasın
                            shrinkWrap: true,
                            //scroll kontrolleri verdik
                            controller: _controller,
                            //içerisindeki öğeleri dikey olarak sıralayacak
                            scrollDirection: Axis.vertical,
                            //oluşturacağı item sayısı olarak chatlist klasöründen listemizi çağırdık
                            //ve liste uzunlugu kadar oluşturmasını söyledik
                            itemCount: chatFullName.length,
                            //şimdi oluşturacağı item'ı söylüyoruz
                            itemBuilder: (context, index) {
                              //flatbutton oluşturmasını söyledik
                              return FlatButton(
                                //fonksiyonu boş olarak verdik
                                onPressed: () {},
                                //içerisine konteynır ekliyoruz
                                child: Container(
                                  //içerisindeki itemları sol ortaya hizala dedik
                                  alignment: Alignment.centerLeft,
                                  //her taraftan boşluk veriyoruz
                                  padding: EdgeInsets.all(10.0),
                                  //şimdi konteynıra satır ekledik
                                  child: Row(
                                    //satır içerisindekileri satır başına hizaladık
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    //bu satırın içindeki öğeleri veriyoruz
                                    children: [
                                      //profil resmi veriyoruz ve index degerine göre listemizden çekiyoruz
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            chatProfilePicture[index]),
                                            //boyutlandırmak için radius degerini verdik
                                        radius: 30,
                                      ),
                                      //arasında boşluk bırakmak için boyut kutusu ekledik
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      //profil resminin yanına konteynır oluşturduk
                                      Container(
                                        //max genişlik yükseklik verdik
                                        constraints: BoxConstraints(
                                          maxHeight: double.infinity,
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width/3,
                                        ),
                                        //konteynırın içerisine kolon ekliyoruz çünkü bir kullanıcı ismi olacak birde
                                        //gönderdiği mesaj olacak
                                        child: Column(
                                          children: [
                                            //kullanıcı adını sol tarafa hizalıyoruz
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              //kullanıcı adı
                                              child: Text(
                                                //index degerine göre listeden çektik
                                                chatFullName[index],
                                                //yazı stilini verdik
                                                style: const TextStyle(
                                                  //renk ve font tipi, font kalınlığı
                                                    color: KGeneralWhite,
                                                    fontFamily: 'Roboto',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            //şimdi gelen mesajları sol tarafa hizalıyoruz
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              //mesajlar
                                              child: Text(
                                                //index degerine göre listeden çektik
                                                messages[index],
                                                //yazı stili verdik
                                                style: TextStyle(
                                                  //renk ve font tipi verdik
                                                  color: KGeneralWhiteLight,
                                                  fontFamily: 'Roboto',
                                                ),
                                                overflow: TextOverflow.ellipsis,//yazılar taşarsa ... şeklinde gösterecek
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
        onPressed: () => Navigator.of(context).pop(),//geldiginiz sayfaya döner
        backgroundColor: Colors.transparent,
        child: const Icon(Icons.arrow_back),
        elevation: 0,
        mini: true,
        tooltip: "Geri dön",
      ),
    );
  }
}
