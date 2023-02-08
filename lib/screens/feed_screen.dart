import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FeedScreen extends HookWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var images = useState<List>([]);
    loadImages(images);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              itemCount: images.value.length + 1,
              itemBuilder: (context, index) {
                if (index == images.value.length) {
                  return Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ElevatedButton(
                        onPressed: () {
                          loadImages(images);
                        },
                        child: const Text('Load More')),
                  );
                }
                return ListTile(subtitle: images.value[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void loadImages(ValueNotifier images) {
    Random rand = Random();
    for (int i = 0; i < 5; i++) {
      images.value = [
        ...images.value
          ..add(Image.network(
              'https://picsum.photos/id/${rand.nextInt(100)}/300'))
      ];
    }
  }
}
