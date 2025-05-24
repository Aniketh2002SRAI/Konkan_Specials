import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/view/homepage.dart';

class CategoryBlock extends StatelessWidget {
  final ItemCategory itemCategory;
  final VoidCallback onTap;
  const CategoryBlock({
    super.key,
    required this.itemCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _card();
  }

  Widget _card() {
    return InkWell(
      onTap: onTap,
      child: _cardItems(),
    );
  }

  Widget _cardItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _descriptionWidget(),
          SizedBox(height: 15),
        _imageWidget(),
      ],
    );
  }

  Widget _descriptionWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            itemCategory.emoji,
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(width: 10),
          Text(
            itemCategory.name,
            style: GoogleFonts.shantellSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageWidget() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(itemCategory.image),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
    ));
  }
}
