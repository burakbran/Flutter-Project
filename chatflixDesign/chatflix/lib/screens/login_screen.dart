import 'package:chatflix/const/const.dart';
import 'package:chatflix/responsive/responsive.dart';
import 'package:chatflix/screens/feed_screen.dart';
import 'package:chatflix/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //kullanıcı adı ve şifre için kontroller
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isVisible = true; //şifre gizleme ve gösterme işlemi için bool degişken

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }
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
        child: SingleChildScrollView(
          //widgetlar için yığın oluşturucu widget
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
                    image: AssetImage("assets/images/background.jpg"),
                    //fotografın opasite degeri
                    opacity: 0.7,
                    //tüm cihaz ekranlarına tam olarak sığması için fit özelliği ayarladık
                    fit: BoxFit.cover,
                  ),
                ),
                //kenarlardan boşluk bıraktık
                //boşluk bırakırken ekran boyutu kontrolu yaptık, eger ekran çok büyükse , giriş ekranını ona göre ayarladık
                //web uyumlu
                padding: screenWidth > webScreenSize
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 3,
                        vertical: 50)
                    : const EdgeInsets.only(left: 18, right: 18, bottom: 45, top: 75),
                //genişlik ve yükseklik degerleri
                width: screenWidth,
                height: screenHeight,
                //opasite değeri ve blur özelliği olan konteynır
                child: GlassmorphicContainer(
                  //içindeki her şeyi ortalar
                  alignment: Alignment.center,
                  //zorunlu olarak istenilen genişlik ve yükseklik degerleri
                  width: 350,
                  height: screenHeight,
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
                  //arkaplan hafif kırmızı ve opasite degeri veriyoruz
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
                  //taşma olmaması için ve klavye açıldığında hareket edebilmesi için scroll sayfası
                  child: SingleChildScrollView(
                    //alt alta widget sıralayan kolon
                    child: Column(
                      //her şeyi ortala
                      mainAxisAlignment: MainAxisAlignment.center,
                      //çocukları
                      children: [
                        Container(
                          //Giriş ekranı hoş geldiniz yazısı
                          child: Column(
                            children: [
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
                                textAlign: TextAlign.center,
                              ),
                              //boşluk oluşturmak için boyutlandırma kutusu
                              const SizedBox(
                                height: 10,
                              ),
                              //giriş yap başlıgı
                               const Text(
                                "Giriş Yap",
                                //yazı stili ve rengi
                                style: TextStyle(
                                  color: KWhite, //renk
                                  fontSize: 28, //boyut
                                  fontFamily: 'Roboto', //font
                                  fontWeight: FontWeight.normal, //kalınlık
                                  letterSpacing: 3, //harfler arası mesafe
                                ),
                                textAlign: TextAlign.center, //yazıyı ortala
                              ),
                            ],
                          ),
                        ),
                        //kenarlardan boşluk vermemize yarayan bir widget
                        Padding(
                          //sol ve sağ kenarlardan boşluk degerleri veriyoruz
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                            top: 40,
                          ),
                          //çocuk widget'ı konteynır olarak ekledik
                          child: Container(
                            //yükseklik degeri verdik
                            height: 40,
                            //konteynırı özelleştirmek için dekorasyon ekliyoruz
                            decoration: BoxDecoration(
                              //arka plan rengi - giriş butonu ile aynı
                              color: KLoginButtonPrimary,
                              //kenarlarının yuvarlaklık degeri
                              borderRadius: BorderRadius.circular(16),
                            ),
                            //içerisindeki yazı için soldan boşluk veriyoruz
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              //boşluk widget'tı alt Çocugu Center olarak verdik
                              child: Center(
                                //bu widget herşeyi ortalar
                                //kullanıcı adı girmek için bir alan
                                child: TextField(
                                  controller:
                                      _usernameController, //en yukarıdaki kontrolleri buraya atadık
                                  //giriş alanını özelleştirmek için dekorasyon
                                  decoration: const InputDecoration(
                                    //kenarlıklar olmayacak dedik
                                    border: InputBorder.none,
                                    //içerisindeki place holder E-Posta adı yazısı
                                    hintText: 'Kullanıcı Adı',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //giriş alanından çıktık boşluk bıraktık
                        const SizedBox(
                          height: 20,
                        ),
                        //Şifre giriş alanı için kenarlardan boşluk bıraktık
                        Padding(
                          //sağ ve sol taraftan boşluk degerleri
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                          ),
                          //Şifre giriş alanı konteynırı
                          child: Container(
                            //yüksekliği
                            height: 40,
                            //Özelleştirmek için dekorasyon veriyoruz
                            decoration: BoxDecoration(
                                //renk veriyoruz
                                color: KLoginButtonPrimary,
                                //kenar yuvarlaklık degeri ekliyoruz
                                borderRadius: BorderRadius.circular(16)),
                            //placeholder password yazısının ve yazıların soldan boşluğu
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
                                              ? Icons.visibility //şifre gizli
                                              : Icons
                                                  .visibility_off, //şifre gizli değil
                                        ),
                                      ),
                                      //border eklemiyoruz
                                      border: InputBorder.none,
                                      //içindeki place holder yazısı
                                      hintText: 'Şifre'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //istediğimiz bir yere hizalamak için widget
                        Align(
                          //sağ ortaya hizalar
                          alignment: Alignment.centerRight,
                          //Çocuk widget
                          child: Container(
                            //sağ tarafdan boşluk verdik
                            padding: const EdgeInsets.only(right: 20.0),
                            //yükseklik
                            height: 40,
                            //dış boşluk degeri sadece üst taraftan
                            margin: const EdgeInsets.only(
                              top: 20,
                            ),
                            //Giriş yap - Elevated button
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(                   //veritabanı eklemedik, kontrol yapmıyoruz şimdilik
                                  builder: (context) => FeedScreen(),//anasayfaya yönlendirme yapıyoruz
                                ),
                              ),
                              //Butonun yazısı - Giriş yap
                              child: const Text(
                                'Giriş Yap',
                                //yazı stili
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, //kalın font
                                    fontFamily: 'Roboto', //font tipi roboto
                                    fontSize: 20, //boyutu
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
                        ),
                        //butonun altındaki kayıt ol yazısını hizalamak için widget içine aldık
                        Align(
                          //hizalama widget'tı
                          //sağ ortaya hizala
                          alignment: Alignment.centerRight,
                          //sağ taraftan boşluk verdik
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            //çocuk widget konteynır
                            child: Container(
                              //kayıt ol butonu
                              child: TextButton(
                                //tıklandıgında kayıt ol sayfasına geçiş yap
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen())),
                                //buton yazısı
                                child: const Text(
                                  "Kayıt Ol",
                                  //buton yazı stili
                                  style: TextStyle(
                                    //renk
                                    color: KRegisterTextButton,
                                    //altını çiz
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
        onPressed: () => Navigator.of(context).pop(),
        backgroundColor: Colors.transparent,
        child: const Icon(Icons.arrow_back),
        elevation: 0,
        mini: true,
      ),
    );
  }
}
