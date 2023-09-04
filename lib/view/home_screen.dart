// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/helper/category_data.dart';
import 'package:untitled2/helper/news.dart';
import 'package:untitled2/models/article_model.dart';
import 'package:untitled2/models/category_model.dart';
import 'package:untitled2/view/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<ArticleModel> article = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    article = newsClass.news;
    setState(() {
      _loading = false;
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
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      categoryName: categories[index].title,
                      imageUrl: categories[index].imageUrl,
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
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
                      url : article[index].url,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, this.categoryName, this.imageUrl,this.url});

  final String? categoryName, imageUrl,url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => CategoriesScreen(
          category: categoryName!.toLowerCase(),
        ),
        ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 80,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  const ArticleTile({super.key, this.title, this.description, this.imageUrl, String? url});

  final String? title, description, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl!),
          ),
          Text(
            title!,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black87,
            ),
          ),
          Text(
            description!,
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
