import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/helper/news.dart';
import 'package:untitled2/models/article_model.dart';
import 'package:untitled2/view/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, this.category});

  final String? category ;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  List<ArticleModel> article = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category!);
    article = newsClass.news;
    setState(() {
      _loading  =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "FlutterNews",
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: CircularProgressIndicator(),
      ) : Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: article.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ArticleTile(
              imageUrl: article[index].urlToImage,
              title: article[index].title,
              description: article[index].description,
            );
          },
        ),
      ),







    );
  }
}
