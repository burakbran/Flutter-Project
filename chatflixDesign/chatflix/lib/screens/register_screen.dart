import 'package:chatflix/const/const.dart';
import 'package:chatflix/responsive/responsive.dart';
import 'package:chatflix/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/gestures.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  //Netflix kullanıcı adı ve şifresi, kontroller
  final TextEditingController _netflixUsernameController = TextEditingController();
  final TextEditingController _netflixPasswordController = TextEditingController();

  //Chatflix kullanıcı adı şifre ve şifre tekrar, kontroller
  final TextEditingController _username = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordControllerAgain = TextEditingController();
  bool _isVisible = true; //şifre gizle göster işlemi için bool değişken

  @override
  Widget build(BuildContext context) {
    //İçeriğin ekrana göre genişliği ve yüksekliği
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //sayfa vücudu
    return Scaffold(
      extendBody: true,
      //Boyutlandırma kutusu
      body: SizedBox(
        //genişlik ve yükseklik
        width: screenWidth,
        height: screenHeight,
        child: SingleChildScrollView(
          child: Stack(
            //Alt çocuk widgetler
            children: [
              //Arka plan fotografımız için konteynır
              Container(
                //konteynırı özelleştirmek için dekorasyon
                decoration: const BoxDecoration(
                  //arka plan rengi siyah
                  color: Colors.black,
                  //arka plan fotografı
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    //opasite degeri
                    opacity: 0.7,
                    //tüm cihazlardaki ekran boyutlarına göre fotoğrafı ekrana sığdırır
                    fit: BoxFit.cover,
                  ),
                ),
                //Kenarlardan boşluk degerleri
                //boşluk bırakırken ekran boyutu kontrolu yaptık, eger ekran çok büyükse , giriş ekranını ona göre ayarladık
                //web uyumlu
                padding: screenWidth > webScreenSize
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 3,
                        vertical: 50)
                    : EdgeInsets.only(left: 18, right: 18, bottom: 8, top: 60),

                //genişlik ve yükseklik
                width: screenWidth,
                height: screenHeight,
                //opasity ve blur özellikli konteynır
                child: GlassmorphicContainer(
                  //içindeki herşeyi ortala
                  alignment: Alignment.center,
                  //genişlik ve yükseklik - zorunlu degerler
                  width: 350,
                  height: 600,
                  //kenar yuvarlaklık degeri
                  borderRadius: 20,
                  //bulanıklık degeri sıfır, bulanıklık yok
                  blur: 0,
                  //border kenarlık kalınlıgı
                  border: 5,
                  //maximum ve minimum boyut degerleri
                  constraints: BoxConstraints(
                    maxHeight: screenHeight * 1.2,
                    maxWidth: screenWidth,
                    minHeight: 200,
                    minWidth: 200,
                  ),
                  //konteynır arka plan rengi, hafif kırmızılık ve opasite
                  linearGradient: LinearGradient(
                      //renklerin başlangıç yerleri
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //renkler - her iki renk aynı
                        KRedOpacity.withOpacity(0.4),
                        KRedOpacity2.withOpacity(0.4),
                      ],
                      //renklerin bitiş degerleri
                      stops: [
                        0.1,
                        1,
                      ]),
                  //kenarlık renkleri
                  borderGradient: LinearGradient(
                    //renklerin başlangıç yerleri
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    //renkler - her ikisi de aynı
                    colors: [
                      KWhiteOpacity.withOpacity(0.5),
                      KWhiteOpacity2.withOpacity(0.5),
                    ],
                  ),
                  //Sayfa taşmaması ve klavye açıldığında yukarı ve aşağı oynatmak için scroll widget'tı
                  child: SingleChildScrollView(
                    //alt alta widget eklememizi sağlayan kolon widget'ı
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, //içindeki herşeyi ortala
                      children: [
                        //otomatik boyutlandırma
                        Container(
                          //Kaydol ekranı hoş geldiniz yazısı
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Hoş Geldiniz",
                                //yazı stili ve rengi
                                style: TextStyle(
                                  color: KWhite, //renk
                                  fontSize: 30, //boyut
                                  fontFamily: 'Roboto', //font
                                  fontWeight: FontWeight.bold, //kalınlık
                                  letterSpacing: 3, //harfler arası mesafe
                                ),
                                //yazıyı ortala
                                textAlign: TextAlign.center,
                              ),
                              //boşluk
                              const SizedBox(
                                height: 10,
                              ),
                              //Netflix ile kaydol yazısı
                              const Text(
                                "Netflix ile Kaydol",
                                //yazı stili ve rengi
                                style: TextStyle(
                                  color: KWhite, //renk
                                  fontSize: 28, //boyut
                                  fontFamily: 'Roboto', //font
                                  fontWeight: FontWeight.normal, //kalınlık
                                  letterSpacing: 3, //harfler arası mesafe
                                ),
                                //yazıyı ortala
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        //KULLANICI ADI , ŞİFRE GİRİŞ ALANLARI
                        //boşluk widget'ı içerisine aldık
                        //Netflix kullanıcı adı
                        Padding(
                          //sağ ve soldan boşluk degerleri
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 20.0),
                          //Çocuk widget konteynır
                          child: Container(
                            //yükseklik
                            height: 40,
                            //konteynır özelleştirme
                            decoration: BoxDecoration(
                              //arka plan rengi buton ile aynı renk
                              color: KLoginButtonPrimary,
                              //kenar yuvarlaklık degeri
                              borderRadius: BorderRadius.circular(16),
                            ),
                            //içerisindeki yazılar için sol taraftan boşluk
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              //ortaya hizala
                              child: Center(
                                //Netflix kullanıcı adı alanı
                                child: TextField(
                                  //yukarda oluşturduğumuz kontrolleri verdik
                                  controller: _netflixUsernameController,
                                  //giriş alanı özelleştirmek için dekorasyon
                                  decoration: const InputDecoration(
                                    //border yok
                                    border: InputBorder.none,
                                    //içerisindeki yazı
                                    hintText: 'Netflix Kullanıcı Adı',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //arasına boşluk bıraktık
                        const SizedBox(
                          height: 20,
                        ),
                        //Şifre giriş alanı için iç boşluk
                        Padding(
                          //sağ ve sol taraftan boşluk
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                          ),
                          //Şifre giriş alanı konteynırı
                          child: Container(
                            //yüksekliği
                            height: 40,
                            //Özelleştirmek için dekorasyon
                            decoration: BoxDecoration(
                                //rengi
                                color: KLoginButtonPrimary,
                                //kenar yuvarlaklık degeri
                                borderRadius: BorderRadius.circular(16)),
                            //placeholder Netflix şifre yazısının soldan boşluğu
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Center(
                                //ortaya hizala
                                //Şifre giriş alanımız
                                child: TextField(
                                  controller:
                                      _netflixPasswordController, //Şifreyi alabilmek için kontroller - yukarda oluşturduk
                                  obscureText: _isVisible
                                      ? false
                                      : true, //şifre göster gizle kontrolu
                                  decoration: InputDecoration(
                                      //özelleştirmek için dekorasyon
                                      //yandaki göz ikonu
                                      suffixIcon: IconButton(
                                        //ikona tıklayınca eger şifre gizliyse göster değilse gizle
                                        onPressed: () {
                                          //ekranı tekrar çizmek için günceller ve değişiklikleri uygular
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        //eğer şifre gizliyse göz ikonunu çarpı olarak göster, değilse göz olarak değiştir
                                        icon: Icon(
                                          _isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                      //border yok
                                      border: InputBorder.none,
                                      //içindeki place holder yazısı
                                      hintText: 'Netflix Şifre'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //boşluk widget'ı içerisine aldık
                        //Chatflix kullanıcı adı
                        Padding(
                          //sağ ve soldan boşluk degerleri
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                          ),
                          //Çocuk widget konteynır
                          child: Container(
                            //yükseklik
                            height: 40,
                            //konteynır özelleştirme
                            decoration: BoxDecoration(
                              //arka plan rengi buton ile aynı renk
                              color: KLoginButtonPrimary,
                              //kenar yuvarlaklık degeri
                              borderRadius: BorderRadius.circular(16),
                            ),
                            //içerisindeki yazılar için sol taraftan boşluk
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              //ortaya hizala
                              child: Center(
                                //Chatflix kullanıcı adı alanı
                                child: TextField(
                                  //yukarda oluşturduğumuz kontrolleri verdik
                                  controller: _username,
                                  //giriş alanı özelleştirmek için dekorasyon
                                  decoration: const InputDecoration(
                                    //border yok
                                    border: InputBorder.none,
                                    //içerisindeki yazı
                                    hintText: 'Chatflix E-Posta',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //arasına boşluk bıraktık
                        const SizedBox(
                          height: 20,
                        ),
                        //Şifre giriş alanı için iç boşluk
                        Padding(
                          //sağ ve sol taraftan boşluk
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                          ),
                          //Şifre giriş alanı konteynırı
                          child: Container(
                            //yüksekliği
                            height: 40,
                            //Özelleştirmek için dekorasyon
                            decoration: BoxDecoration(
                                //rengi
                                color: KLoginButtonPrimary,
                                //kenar yuvarlaklık degeri
                                borderRadius: BorderRadius.circular(16)),
                            //placeholder Chatflix şifre yazısının soldan boşluğu
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Center(
                                //ortaya hizala
                                //Şifre giriş alanımız
                                child: TextField(
                                  controller:
                                      _passwordController, //Şifreyi alabilmek için kontroller - yukarda oluşturduk
                                  obscureText: _isVisible
                                      ? false
                                      : true, //şifre göster gizle kontrolu
                                  decoration: InputDecoration(
                                      //özelleştirmek için dekorasyon
                                      //yandaki göz ikonu
                                      suffixIcon: IconButton(
                                        //ikona tıklayınca eger şifre gizliyse göster değilse gizle
                                        onPressed: () {
                                          //ekranı tekrar çizmek için günceller ve değişiklikleri uygular
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        //eğer şifre gizliyse göz ikonunu çarpı olarak göster, değilse göz olarak değiştir
                                        icon: Icon(
                                          _isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                      //border yok
                                      border: InputBorder.none,
                                      //içindeki place holder yazısı
                                      hintText: 'Chatflix Şifre'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //Şifre giriş alanı için iç boşluk
                        Padding(
                          //sağ ve sol taraftan boşluk
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                          ),
                          //Şifre tekrarı giriş alanı konteynırı
                          child: Container(
                            //yüksekliği
                            height: 40,
                            //Özelleştirmek için dekorasyon
                            decoration: BoxDecoration(
                                //rengi
                                color: KLoginButtonPrimary,
                                //kenar yuvarlaklık degeri
                                borderRadius: BorderRadius.circular(16)),
                            //placeholder Chatflix şifre tekrar yazısının soldan boşluğu
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Center(
                                //ortaya hizala
                                //Şifre tekrarı giriş alanımız
                                child: TextField(
                                  controller:
                                      _passwordControllerAgain, //Şifreyi alabilmek için kontroller - yukarda oluşturduk
                                  obscureText: _isVisible
                                      ? false
                                      : true, //şifre göster gizle kontrolu
                                  decoration: InputDecoration(
                                    //özelleştirmek için dekorasyon
                                    //yandaki göz ikonu
                                    suffixIcon: IconButton(
                                      //ikona tıklayınca eger şifre gizliyse göster değilse gizle
                                      onPressed: () {
                                        //ekranı tekrar çizmek için günceller ve değişiklikleri uygular
                                        setState(() {
                                          _isVisible = !_isVisible;
                                        });
                                      },
                                      //eğer şifre gizliyse göz ikonunu çarpı olarak göster, değilse göz olarak değiştir
                                      icon: Icon(
                                        _isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                    //border yok
                                    border: InputBorder.none,
                                    //içindeki place holder yazısı
                                    hintText: 'Chatflix Şifre tekrar',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //altına boşluk ekledik
                        const SizedBox(
                          height: 20,
                        ),
                        //hizalama widget'tı ekledik
                        Align(
                          //içindeki öğeleri sağ ortaya hizaladık
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.only(right: 20.0),
                            height: 40,
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            //Giriş yap - Elevated button
                            child: ElevatedButton(
                              onPressed:
                                  () {}, //Bu butona tıklandığında çalışacak fonksiyon
                              //Butonun yazısı - Kayıt Ol
                              child: const Text(
                                'Kayıt Ol',
                                //yazı stili
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, //kalın font
                                    fontFamily: 'Roboto', //font tipi roboto
                                    fontSize: 20, //boyutu
                                    color: KLoginButtonColor),
                              ),
                              //buton stili
                              style: ElevatedButton.styleFrom(
                                  onPrimary: KLoginButtonOnPrimary,
                                  primary:
                                      KLoginButtonPrimary, //butonun arka plan rengi
                                  //butonun radius degeri
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28))),
                            ),
                          ),
                        ),
                        //hizalama widget'tı ekledik
                        Align(
                          //içindeki öğeleri sağ ortaya hizaladık
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              child: TextButton(
                                //giriş sayfasına yönlendir
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => const LoginScreen())),
                                child: const Text(
                                  "Giriş Yap",
                                  style: TextStyle(
                                    color: KRegisterTextButton,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //En üst'deki geri butonu
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        //geldiginiz sayfaya gider
        onPressed: () => Navigator.of(context).pop(),
        backgroundColor: Colors.transparent,
        child: const Icon(Icons.arrow_back),
        elevation: 0,
        mini: true,
      ),
    );
  }
}
