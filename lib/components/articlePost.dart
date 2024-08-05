import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsletter_app/components/likeButton.dart';


class ArticlePost extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;

  const ArticlePost({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
  });

  @override
  State<ArticlePost> createState() => _ArticlePostState();
}

class _ArticlePostState extends State<ArticlePost> {
  // user
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    // access the document in firebase
    DocumentReference postRef = FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);

    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
    });
    }
    else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 0),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.user),
              Text(widget.message),
            ],
          ),
          Spacer(),

          Row(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(widget.likes.length.toString()),
              SizedBox(width: 2),
              LikeButton(
                isLiked: isLiked, 
                onTap: toggleLike,
              ),
            ],
          ),
        ],
      ),
    );
  }
}