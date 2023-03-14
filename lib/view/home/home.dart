import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_generator/controller/home_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void didChangeDependencies() {
    Provider.of<HomeProvider>(context).apiFetch();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Demo",
          style: TextStyle(color: Colors.deepPurple[200]),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        // physics: const BouncingScrollPhysics(),
        // physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: [
              Container(
                height: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.deepOrange[200],
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Consumer<HomeProvider>(
                    builder: ((context, provider, child) =>
                        provider.word.isNotEmpty
                            ? Text(
                                "${provider.favourite}",
                                // style: TextStyle(color: Colors.deepPurple[200]),
                              )
                            : const CircularProgressIndicator.adaptive()),
                  ),
                ),
              ),
            ],
          ),
          Consumer<HomeProvider>(
            builder: ((context, provider, child) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                // physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                // primary: false,
                itemCount: 100,
                itemBuilder: ((context, index) => ListTile(
                        title: Card(
                      color: Colors.deepPurple[200],
                      child: ListTile(
                        title: Text("${provider.word[index]}"),
                        onTap: () =>
                            Provider.of<HomeProvider>(context, listen: false)
                                .addToFavourite(provider.word[index]),
                      ),
                    ))),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<HomeProvider>(context, listen: false).debug,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
