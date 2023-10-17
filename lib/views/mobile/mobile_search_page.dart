import 'package:flutter/material.dart';

class MobileSearchPage extends StatefulWidget {
  const MobileSearchPage({Key? key}) : super(key: key);

  @override
  State<MobileSearchPage> createState() => _MobileSearchPageState();
}

class _MobileSearchPageState extends State<MobileSearchPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                onSubmitted: (value) {
                  print("Submitted: $value");
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  // contentPadding: EdgeInsets.symmetric(vertical: 4),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            titleSpacing: 8,
            centerTitle: true,
            pinned: true,
            surfaceTintColor: Colors.grey.shade200,
          ),
          SliverList.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.history),
                title: Text("Test, $index"),
                trailing: Icon(
                  Icons.north_west,
                  color: Colors.grey.shade600,
                  size: 24.0,
                ),
              );
            },
            itemCount: 50,
          ),
        ],
      ),
    );
  }
}
