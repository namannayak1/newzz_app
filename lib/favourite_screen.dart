import 'package:flutter/material.dart';
import 'package:newzz_app/services/favourite.dart';// Import the FavoritesService
import 'article_details_screen.dart'; // Import the ArticleDetailsScreen

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesService().getFavorites();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites', style: TextStyle(fontFamily: 'Orbitron')),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: favorites.isEmpty
          ? Center(child: Text('No favorites added yet', style: TextStyle(color: Colors.white, fontSize: 18)))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final article = favorites[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Card(
                    color: Color(0xFF1D1E33),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        article.imageUrl.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.network(
                                  article.imageUrl,
                                  width: double.infinity,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                ),
                                child: Center(
                                  child: Icon(Icons.image, size: 80, color: Colors.white),
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              Text(
                                article.summary,
                                style: TextStyle(color: Colors.white70),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Read More',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleDetailsScreen(article: article),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      backgroundColor: Color(0xFF0A0E21),
    );
  }
}
