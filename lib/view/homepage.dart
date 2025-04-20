import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/api/api.dart';
import 'package:konkanspecials/components/home_page/category_block.dart';
import 'package:konkanspecials/model/items/item_data.dart';
import 'package:konkanspecials/utility/app_utility.dart';
import 'package:konkanspecials/view/menu.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Spacer(),
              Icon(
                Icons.person_2_rounded,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Column(
          children: [
            _categoryBlockWidget(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 4,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Konkan❤️',
                        style: GoogleFonts.nunito(
                          fontSize: 50,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Inspired by coastal\nkonkan!',
                        style: GoogleFonts.nunito(
                          fontSize: 25,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _categoryBlockWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(10)),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        itemCount: ItemCategory.values.length,
        itemBuilder: (context, index) => CategoryBlock(
          itemCategory: ItemCategory.values[index],
          onTap: () async {
            showCircularProgressIndicator(context: context);
            final List<ItemData> items = await Api.instance
                .getItems(itemCategory: ItemCategory.values[index]);
            print('items: ${items}');

            if (items != null) {
              hideProgressIndicator(context: context);
              ItemCategory.values[index]
                  .navigateToMenu(context: context, items: items);
            } else {
              hideProgressIndicator(context: context);
            }
          },
        ),
      ),
    );
  }
}

enum ItemCategory {
  fishFry(
      name: 'Fish Fry',
      image: 'images/category_images/fries.jpeg',
      emoji: '♨️'),
  chilli(
      name: 'Chilli',
      image: 'images/category_images/chilli.jpeg',
      emoji: '🌶️'),
  dietSalad(
      name: 'Diet Salad',
      image: 'images/category_images/dietsalad.jpeg',
      emoji: '🥗'),
  kulukki(
      name: 'Kulukki',
      image: 'images/category_images/kulukki.jpeg',
      emoji: '🥤');

  final String name;
  final String image;
  final String emoji;

  const ItemCategory(
      {required this.name, required this.image, required this.emoji});

  void navigateToMenu(
      {required BuildContext context, required List<ItemData> items}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Menu(itemCategory: this, items: items)),
    );
  }
}
