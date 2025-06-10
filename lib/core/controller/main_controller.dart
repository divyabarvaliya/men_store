import 'package:get/get.dart';
import 'package:men_store/core/model/category_model.dart';
import 'package:men_store/core/model/intro_model.dart';

import '../constants/constants.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  List<IntroModel> intro = [
    IntroModel(
      img: ImagesAsset.intro1,
      title: 'Be unique',
      des: 'With your own style',
    ),
    IntroModel(
      img: ImagesAsset.intro2,
      title: 'Express yourself',
      des: 'through fashion',
    ),
    IntroModel(
      img: ImagesAsset.intro3,
      title: 'Not just fashion',
      des: '—it’s you.',
    ),
  ];
  List<String> newArrival = <String>[
    ImagesAsset.men1,
    ImagesAsset.men2,
    ImagesAsset.men3,
    ImagesAsset.intro2,
    ImagesAsset.intro3,
  ];
  List<CategoryModel> category = [
    CategoryModel(img: ImagesAsset.c1, title: 'Girls'),
    CategoryModel(img: ImagesAsset.c2, title: 'Boys'),
    CategoryModel(img: ImagesAsset.c3, title: 'Kids'),
    CategoryModel(img: ImagesAsset.c4, title: 'Couples'),
  ];
  RxList<String> sizes = ['S', 'M', 'L', 'XL'].obs;

  RxInt selSize = 2.obs;
}
