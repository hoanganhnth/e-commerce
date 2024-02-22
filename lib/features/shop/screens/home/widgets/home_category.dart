
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/commom/widgets/sub_category/sub_categories.dart';

import '../../../../../commom/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return TVerticalImageText(image: TImages.shoeIcon, title: 'Shoes', onTap: () => Get.to(() => const TSubCategoriesScreen()),);
        },
      ),
    );
  }
}
