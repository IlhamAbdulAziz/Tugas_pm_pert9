import 'package:flutter/material.dart';
import 'package:tugas_pm/layout/home/apiPage/Detailnewspage.dart';
import 'package:tugas_pm/layout/model/Getnews.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'apiPage/NewsCard.dart';

class Newspage extends StatefulWidget {
  const Newspage({Key? key}) : super(key: key);

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  Future<List<Getnews>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      return getPostsData.map((i) => Getnews.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  late Future<List<Getnews>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  void refreshPosts() {
    setState(() {
      futurePosts = fetchPosts(); // Refresh the posts
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: refreshPosts,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<Getnews>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${snapshot.error}',
                          style: TextStyle(color: Colors.red)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: refreshPosts, // Retry fetching posts
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var post = snapshot.data![index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.body),
                          trailing: IconButton(
                            icon: const Icon(Icons.share),
                            tooltip: 'Share',
                            onPressed: () {
                              // Implement sharing functionality here
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Sharing ${post.title}')),
                              );
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Detailnewspage(getnews: post),
                              ),
                            );
                          }),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: snapshot.data!.length,
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
      ),
    );
  }
}
