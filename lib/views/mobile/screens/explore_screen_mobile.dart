import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreScreenMobile extends StatelessWidget {
  const ExploreScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {
                      GoRouter.of(context).goNamed('explore_radio');
                    },
                    leading: const Icon(Icons.radio),
                    title: const Text('Radio'),
                    subtitle:
                        const Text('Explore tracks you might like, randomly'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Artist/Circle'),
                    subtitle: Text('Explore all artists and circles'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
