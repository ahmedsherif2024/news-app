import 'package:untitled2/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category=[];

  CategoryModel categoryModel =CategoryModel();

  //1
  categoryModel.title ="Business";
  categoryModel.imageUrl= "https://www.gannett-cdn.com/-mm-/b2b05a4ab25f4fca0316459e1c7404c537a89702/c=0-0-1365-768/local/-/media/2018/08/28/USATODAY/usatsports/business-people-six-figure-jobs.jpg?width=3200&height=1680&fit=crop ";
  category.add(categoryModel);

  //2
  categoryModel =CategoryModel();
  categoryModel.title ="Entertainment";
  categoryModel.imageUrl= "https://th.bing.com/th/id/R.d2a4384c67604397e204a6f8c15b2df4?rik=eSNKnc1uMYxrTw&pid=ImgRaw&r=0";
  category.add(categoryModel);


  //3
  categoryModel =CategoryModel();
  categoryModel.title ="Sport";
  categoryModel.imageUrl= "https://th.bing.com/th/id/R.750257cb481717a13a8fa74938ddc5f6?rik=DC4FKTGIbak%2fPQ&pid=ImgRaw&r=0 ";
  category.add(categoryModel);


  //4
  categoryModel =CategoryModel();
  categoryModel.title ="Healthy";
  categoryModel.imageUrl= "https://th.bing.com/th/id/R.131c15992813c8bb69eacb772c61738e?rik=DzHoTwvPAti%2bCA&riu=http%3a%2f%2fwww.greenshootmedia.com%2fwp-content%2fuploads%2f2017%2f04%2fHealthBeautyPreview-1-copy.png&ehk=j7LYFVEgOavAxyTgZpBZLu%2fUpsqOBMvMEqrLluqqIvA%3d&risl=1&pid=ImgRaw&r=0";
  category.add(categoryModel);


  //5
  categoryModel =CategoryModel();
  categoryModel.title ="General";
  categoryModel.imageUrl= "https://4.bp.blogspot.com/-jYoYYud9yTY/VQaiacevQrI/AAAAAAAAA4M/oDDBj9nnnu0/s1600/facebook-addict.jpg ";
  category.add(categoryModel);


  //6
  categoryModel =CategoryModel();
  categoryModel.title ="Technology";
  categoryModel.imageUrl= "https://qtxasset.com/fiercehealthcare/1587925715/GettyImages-1127069581.jpg/GettyImages-1127069581.jpg?GaTLsO_IPUT18T8SSySuu93cQU7FTgW.  ";
  category.add(categoryModel);



  //7
  categoryModel =CategoryModel();
  categoryModel.title ="science";
  categoryModel.imageUrl= "https://th.bing.com/th/id/OIP.2zrB9wnFgbzw445YR6HkFwHaEc?pid=ImgDet&rs=1 ";
  category.add(categoryModel);

  return category;

}