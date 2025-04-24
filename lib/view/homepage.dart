import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/api/api.dart';
import 'package:konkanspecials/components/home_page/category_block.dart';
import 'package:konkanspecials/components/home_page/description_widget.dart';
import 'package:konkanspecials/components/uitilty/cart_description_navigation_widget.dart';
import 'package:konkanspecials/components/uitilty/cart_icon_widget.dart';
import 'package:konkanspecials/constants/constants.dart';
import 'package:konkanspecials/model/items/item_data.dart';
import 'package:konkanspecials/model/location_model/location_model.dart';
import 'package:konkanspecials/model/location_model/location_service.dart';
import 'package:konkanspecials/utility/app_utility.dart';
import 'package:konkanspecials/view/menu.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: appBackgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [_locationWidget(), Spacer(), CartIconWidget()],
          ),
        ),
        body: Stack(children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(5.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _categoryBlockWidget(),
                  DescriptionWidget(),
                ],
              ),
            ),
          ),
          CartDescriptionNavigationWidget()
        ]));
  }

  Widget _locationWidget() {
    return Consumer<LocationService>(
      builder: (context, locationService, child) {
        final locationModel = locationService.locationModel;
        return InkWell(
          onTap: () => locationService.refreshLocation(),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                size: 20,
                color: Colors.black,
              ),
              SizedBox(width: 4),
              Text(
                _getLocationText(locationModel),
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getLocationText(LocationModel? locationModel) {
    if (locationModel == null) return 'Loading...';

    switch (locationModel.status) {
      case LocationStatus.granted:
        return locationModel.locationString ?? 'Getting location...';
      case LocationStatus.disabled:
        return 'Enable location';
      case LocationStatus.denied:
      case LocationStatus.deniedForever:
        return 'Location access needed';
      case LocationStatus.error:
        return 'Location error';
      case LocationStatus.initial:
        return 'Getting location...';
    }
  }

  Widget _categoryBlockWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 0.85,
        ),
        itemCount: ItemCategory.values.length,
        itemBuilder: (context, index) => CategoryBlock(
          itemCategory: ItemCategory.values[index],
          onTap: () async {
            showCircularProgressIndicator(context: context);
            final List<ItemData>? items = await Api.instance
                .getItems(itemCategory: ItemCategory.values[index]);
            if (items != null) {
              hideProgressIndicator(context: context);
              ItemCategory.values[index]
                  .navigateToMenu(context: context, items: items);
            } else {
              hideProgressIndicator(context: context);
              showErrorSnackBar(
                  context: context, message: Api.instance.errorMessage);
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
          builder: (context) => Menu(
              itemCategory: this,
              items: items,
              isVeg: this == ItemCategory.kulukki)),
    );
  }
}
