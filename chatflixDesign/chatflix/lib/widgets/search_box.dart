import 'package:chatflix/const/const.dart';
import 'package:flutter/material.dart';

//chat sayfasındaki arama kutusu widget'ı

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key, required this.padding}) : super(key: key);
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Color.fromARGB(110, 158, 158, 158),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(Icons.search,color: Colors.white38,),
            SizedBox(width: 8,),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: KSearchboxWhite,
                  fontSize: 17,
                  letterSpacing: -0.41
                ),
                decoration: InputDecoration(
                  hintText: 'Ara',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color.fromARGB(174, 255, 255, 255),
                    fontSize: 17,
                    letterSpacing: -0.41
                  )
                ),
              ),
            ),
            SizedBox(width: 8,),
            Icon(Icons.mic,color: Colors.white38,),
            SizedBox(width: 8,),
          ],
        ),
      ),
    );
  }
}
