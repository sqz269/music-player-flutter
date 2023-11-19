import 'package:flutter/material.dart';
import 'package:tlmc_player_flutter/states/queue_controller.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Radio card
          GestureDetector(
            onTap: () {
              QueueController.to.setQueueMode(QueueMode.radio);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Radio mode activated"),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.radio,
                        size: 48,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Radio",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Discover new music, randomly.",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
