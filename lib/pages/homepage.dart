import 'package:flutter/material.dart';
import 'package:newsmain/model/model.dart';
import 'package:newsmain/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   Future<News> ?_newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder<News>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('-----------------');
              return ListView.builder(
                  itemCount: snapshot.data!.articles.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data!.articles[index];
                    print('=---------------');
                    return Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  article.urlToImage,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text(formattedTime),
                                Text(
                                  article.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  article.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News App'),
      ),
      body: Container(
        child: futureBuilder,
      ),
    );
  }
}
