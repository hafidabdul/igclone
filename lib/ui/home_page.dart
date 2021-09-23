import 'package:flutter/material.dart';
import 'package:instagram/model_saya/post.dart';
import 'package:instagram/model_saya/story_json.dart';
import 'package:instagram/ui/story.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget bottomAppBar() {
    return Container(
      color: Colors.white,
      height: 50.0,
      alignment: Alignment.center,
      child: new BottomAppBar(
        child: new Row(
          // alignment: MainAxisAlignment.spaceAround,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () {},
            ),
            new IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: null,
            ),
            new IconButton(
              icon: Icon(
                Icons.add_box,
              ),
              onPressed: null,
            ),
            new IconButton(
              icon: Icon(
                Icons.favorite,
              ),
              onPressed: null,
            ),
            new IconButton(
              icon: Icon(
                Icons.account_box,
              ),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }

  // Widget storyView() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(right: 20, left: 15, bottom: 10),
  //           child: Column(
  //             children: <Widget>[
  //               Container(
  //                 width: 65,
  //                 height: 65,
  //                 child: Stack(
  //                   children: <Widget>[
  //                     Container(
  //                       width: 65,
  //                       height: 65,
  //                       decoration: BoxDecoration(
  //                           shape: BoxShape.circle,
  //                           image: DecorationImage(
  //                               image: NetworkImage(profile),
  //                               fit: BoxFit.cover)),
  //                     ),
  //                     Positioned(
  //                         bottom: 0,
  //                         right: 0,
  //                         child: Container(
  //                           width: 19,
  //                           height: 19,
  //                           decoration: BoxDecoration(
  //                               shape: BoxShape.circle, color: Colors.white),
  //                           child: Icon(
  //                             Icons.add_circle,
  //                             color: Colors.red,
  //                             size: 19,
  //                           ),
  //                         ))
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 8,
  //               ),
  //               SizedBox(
  //                 width: 70,
  //                 child: Text(
  //                   "hafid",
  //                   overflow: TextOverflow.ellipsis,
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Row(
  //             children: List.generate(stories.length, (index) {
  //           return StoryItem(
  //             img: stories[index]['img'],
  //             name: stories[index]['name'],
  //           );
  //         })),
  //       ],
  //     ),
  //   );
  // }

  Widget postView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Post post = posts[index];
        return Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: AssetImage(post.userImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            post.username,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Hafid",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(post.userImage))),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new IconButton(
                          icon: new Icon(Icons.favorite),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                        new SizedBox(
                          width: 16.0,
                        ),
                        new Icon(
                          Icons.comment,
                        ),
                        new SizedBox(
                          width: 16.0,
                        ),
                        new Icon(Icons.share),
                      ],
                    ),
                    new Icon(Icons.bookmark)
                  ],
                ),
              ),
              Row(
                children: [Container(margin: EdgeInsets.symmetric(horizontal: 10) ,child: Text(post.username, style: TextStyle(fontWeight: FontWeight.w700),)),
                  Text(post.caption),
                ],
              ),SizedBox(height: 10,)
            ],
          ),
        );
      },
      itemCount: posts.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      bottomNavigationBar: bottomAppBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEEEE),
        brightness: Brightness.light,
        title: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.live_tv,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: postView(),
    );
  }
}
