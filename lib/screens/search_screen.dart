// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  static List<String> _allNames = [
    "leen",
    'layan',
    'bana',
    "bayan",
    "jude",
    "juman",
    "jawad",
    "sara",
    "sawsan",
    'laith',
    "amjad",
    "ahmad",
    "leena",
    "sumaya",
    "tahani",
    "fatma",
    'farah',
    'fadi',
    'faisal',
    "mahmoud",
    'menna',
    'muna',
    "jumana"
  ];

  TextEditingController _textController = TextEditingController();
  List<String> newNamesList = List.from(_allNames);

  onItemChanged(String value) {
    setState(() {
      newNamesList = _allNames
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  // List<String> _foundNames = [];

  // @override
  // initState() {
  //   // at the beginning, all users are shown
  //   _foundNames = _allNames;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            onChanged: onItemChanged,
            controller: _textController,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
                hintText: 'Serach',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 1.0),
                )),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(12.0),
            children: newNamesList.map((data) {
              return ListTile(
                title: Text(data),
                onTap: () => print(data),
              );
            }).toList(),
          ),
        )
      ],
    ));
  }
}

class DataSearch extends SearchDelegate<String> {
  final names = [
    "leen",
    'layan',
    'bana',
    "bayan",
    "jude",
    "juman",
    "jawad",
    "sara",
    "sawsan",
    'laith',
    "amjad",
    "ahmad",
    "leena",
    "sumaya",
    "tahani",
    "fatma",
    'farah',
    'fadi',
    'faisal',
    "mahmoud",
    'menna',
    'muna',
    "jumana"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ' null');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Card();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList =
        names.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.person),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}

// class searchScreen extends StatefulWidget {
//   const searchScreen({Key? key}) : super(key: key);

//   @override
//   _searchScreenState createState() => _searchScreenState();
// }

// class _searchScreenState extends State<searchScreen> {
//   final List<String> _allNames = [
//     "leen",
//     'layan',
//     'bana',
//     "bayan",
//     "jude",
//     "juman",
//     "jawad",
//     "sara",
//     "sawsan",
//     'laith',
//     "amjad",
//     "ahmad",
//     "leena",
//     "sumaya",
//     "tahani",
//     "fatma",
//     'farah',
//     'fadi',
//     'faisal',
//     "mahmoud",
//     'menna',
//     'muna',
//     "jumana"
//   ];

//   // This list holds the data for the list view
//   List<String> _foundNames = [];
//   @override
//   initState() {
//     // at the beginning, all users are shown
//     _foundNames = _allNames;
//     super.initState();
//   }

//   // This function is called whenever the text field changes
//   void _runFilter(String enteredKeyword) {
//     List<String> results = [];
//     if (enteredKeyword.isEmpty) {
//       // if the search field is empty or only contains white-space, we'll display all users
//       results = _allNames;
//     } else {
//       results = _allNames
//           .where((user) =>
//               user.toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//       // we use the toLowerCase() method to make it case-insensitive
//     }

//     // Refresh the UI
//     setState(() {
//       _foundNames = results;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               onChanged: (value) => _runFilter(value),
//               decoration: const InputDecoration(
//                   labelText: 'Search', suffixIcon: Icon(Icons.search)),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: _foundNames.isNotEmpty
//                   ? ListView.builder(
//                       itemCount: _foundNames.length,
//                       itemBuilder: (context, index) => Card(
//                         key: ValueKey(_foundNames[index]),
//                         color: Colors.grey[350],
//                         elevation: 4,
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                         child: ListTile(
//                           leading: Text(
//                             _foundNames[index].toString(),
//                             style: const TextStyle(fontSize: 24),
//                           ),
//                           title: Text(_foundNames[index]),
//                           subtitle: Text(
//                               '${_foundNames[index].toString()} years old'),
//                         ),
//                       ),
//                     )
//                   : const Text(
//                       'No results found',
//                       style: TextStyle(fontSize: 24),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
