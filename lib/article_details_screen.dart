import 'package:flutter/material.dart';
import 'package:newzz_app/services/favourite.dart';
import '../models/article_model.dart';
// You need to implement this service

class ArticleDetailsScreen extends StatefulWidget {
  final Article article;

  ArticleDetailsScreen({required this.article});

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    // Check if the article is already favorited
    isFavorite = FavoritesService().isFavorite(widget.article);
  }

  void _toggleFavorite() {
    setState(() {
      if (isFavorite) {
        FavoritesService().removeFavorite(widget.article);
      } else {
        FavoritesService().addFavorite(widget.article);
      }
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Details', style: TextStyle(fontFamily: 'Orbitron')),
        backgroundColor: Color(0xFF0A0E21),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Article image
              widget.article.imageUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.article.imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 200,
                      color: Colors.grey[800],
                      child: Center(
                        child: Icon(Icons.image, size: 100, color: Colors.white),
                      ),
                    ),
              SizedBox(height: 16),
              // Article title
              Text(
                widget.article.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Article published date
              Text(
                widget.article.publishedDate,
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              SizedBox(height: 16),
              // Article summary
              Text(
                widget.article.summary,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF0A0E21),
    );
  }
}
