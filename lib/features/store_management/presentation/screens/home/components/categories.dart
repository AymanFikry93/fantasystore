import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fantasy_store/core/injection_container.dart' as di;

import '../../../../../base/presentation/widgets/app_cached_network_image.dart';
import '../../../../data/entities/home_store_state.dart';
import '../../../../data/model/category.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all( (20)),
      child: Consumer(builder: (_, ref, __) {
        HomeStoreState homeStoreState = ref.watch(di.homeProviderViewModel).data;
        List<CategoryModel> categories = homeStoreState.categoryList??[];
        print(categories);
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categories.length,
                (index) => CategoryCard(
                  icon: categories[index].imageUrl,
                  text: categories[index].title,
                  press: () {},
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width:  (120),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all( (3)),
              height:  (80),
              width:  (120),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AppCachedNetworkImage(
                  url: icon ?? "",
                  // placeholder: AppAssets.userFrame.imagePath,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
