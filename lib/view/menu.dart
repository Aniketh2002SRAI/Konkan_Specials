import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konkanspecials/components/appbar/ks_app_bar.dart';
import 'package:konkanspecials/components/menu/ks_item_block.dart';
import 'package:konkanspecials/components/uitilty/cart_description_navigation_widget.dart';
import 'package:konkanspecials/components/uitilty/cart_icon_widget.dart';
import 'package:konkanspecials/constants/constants.dart';
import 'package:konkanspecials/model/items/item_data.dart';
import 'package:konkanspecials/view/homepage.dart';


class Menu extends StatelessWidget {
  final ItemCategory itemCategory;
  final List<ItemData> items;
  final bool isVeg;
  const Menu(
      {super.key,
      required this.itemCategory,
      required this.items,
      required this.isVeg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: ksAppBar(
        leadingIcon: null,
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _backButton(context: context),
            _title(),
            CartIconWidget(),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _categoryImage(),
              _menuItemsSection(isVeg: isVeg),
            ],
          ),
          CartDescriptionNavigationWidget(),
        ],
      ),
    );
  }

  InkWell _backButton({required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.chevron_left,
        color: Colors.black,
      ),
    );
  }

  Text _title() {
    return Text(
      itemCategory.emoji + '  ' + itemCategory.name,
      style: appBarTitleStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget _categoryImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
      child: Container(
        height: ScreenUtil().setHeight(200),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(itemCategory.image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _menuItemsSection({required bool isVeg}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(15),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(65)),
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
            child: KsItemBlock(
              itemData: items[index],
              isVeg: isVeg,
            ),
          ),
        ),
      ),
    );
  }
}
