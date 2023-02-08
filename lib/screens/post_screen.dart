import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PostScreen extends HookWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();
    var postController = useTextEditingController();
    var posts = useState<List<String>>([]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Form(
                key: key,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: postController,
                        decoration: const InputDecoration(label: Text('Post')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Write what's on your mind";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              posts.value = [
                                ...posts.value..insert(0, postController.text)
                              ];
                              // posts.value.add(postController.text);
                              postController.clear();
                            }
                          },
                          child: const Text('Submit')),
                    )
                  ],
                ),
              ),
            ),
            posts.value.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'No posts have been submitted.',
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: posts.value.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(posts.value[index]));
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
