import 'package:flutter/material.dart';
import 'package:instagram_copy/models/story.dart';
import 'package:instagram_copy/models/user_base.dart';
import 'package:uuid/uuid.dart';

import '../models/comment.dart';
import '../models/post.dart';

List<User> USERS = [
  User(
      Uuid().toString(),
      'Zac Efron',
      '_lilZack',
      'https://upload.wikimedia.org/wikipedia/commons/b/ba/Zac_Efron_on_the_red_carpet_of_the_Baywatch_in_Miami_02.png',
      'I am Zac'),
  User(
      Uuid().toString(),
      'Zed',
      'zed',
      'https://images.contentstack.io/v3/assets/blt93c07aad6c2c008a/blt871d9b6c6d8f1b79/63ea71072d874242f8bf3f40/Zed_0.jpg',
      'To the shadows you return'),
  User(
      Uuid().toString(),
      'Goku',
      'kakarott',
      'https://criticalhits.com.br/wp-content/uploads/2022/03/goku_an6e.h720-910x665.webp',
      'Hi, I am goku'),
  User(
    Uuid().toString(),
    'John Wick',
    'babayaga',
    'https://www.otempo.com.br/image/contentid/policy:1.2837016:1679680082/image-Diretor-chocou-estudio-com-final-de-John-Wick-4-Voce-e-insano.jpg',
    'Who killed my fucking dog?',
    stories: [
      Story([
        Image.network(
            'https://s26162.pcdn.co/wp-content/uploads/2022/07/John-Wicks-dog.jpg')
      ])
    ],
  ),
  User(
      Uuid().toString(),
      'Gekko',
      '_dontkillwingman',
      'https://pbs.twimg.com/ext_tw_video_thumb/1632070306113224704/pu/img/ovQexbGld3DyPabj.jpg:large',
      'I let wingman write my bio',
      posts: [
        Post('https://pbs.twimg.com/media/FqZsSxraUAAfgzl.jpg',
            DateTime.parse('2009-11-11'), '_dontkillwingman',
            comments: [
              Comment(
                'openUpTheSkye',
                false,
                commentText: 'That is so cute!',
              ),
            ],
            likes: 200,
            subtitle: 'Teachin my boy lil\' wingman how I work, LOL'),
      ]),
];
