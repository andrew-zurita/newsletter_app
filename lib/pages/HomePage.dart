import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsletter_app/components/articlePost.dart';
// import 'package:newsletter_app/components/navBar.dart';
import 'package:newsletter_app/components/textField.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // current user, move this to the profile page
  final currentUser = FirebaseAuth.instance.currentUser!;

  // text controller for making posts POSSIBLY MOVE THIS TO POST PAGE
  final  textController = TextEditingController();

  // post article method, POSSIBLY MOVE TO POST PAGE
  void postMessage() {
    if (textController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("User Posts").add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
        'Likes': [],
      });
    }

    setState(() {
      textController.clear();
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
        leading: Image.asset('assets/icons/logo.png'),
        actions: [
          IconButton(onPressed: signOut, icon: Icon(Icons.logout))
        ],
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),

            // article posts to display
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                .collection("User Posts")
                .orderBy(
                  "TimeStamp", 
                  descending: false,
                )
                .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          // gets message
                          final post = snapshot.data!.docs[index];
                          return ArticlePost(
                            message: post['Message'], 
                            user: post['UserEmail'],
                            postId: post.id,
                            likes: List<String>.from(post['Likes'] ?? []), 
                          );
                        }
                      ),
                    );
                  }
                  else if (snapshot.hasError) {
                    return Center(child: Text('Error; ' + snapshot.error.toString()),);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),

            Row(
              children: [
                // text field
                Expanded(
                  child: MyTextField(
                    controller: textController, 
                    hintText: 'Write an article...', 
                    obscureText: false),
                ),

                // post button
                IconButton(onPressed: postMessage, icon: const Icon(Icons.arrow_circle_up)),
              ],
            ),

            // user that is logged in MOVE THIS TO PROFILE PAGE
            Text(
              "Logged in as: " + currentUser.email!,
            )
    
          ],
        ),
      ),

      // bottom navigation bar w/ icons
      // bottomNavigationBar: navBar(),
      );
  }
}