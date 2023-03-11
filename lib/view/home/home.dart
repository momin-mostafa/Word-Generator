import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_generator/controller/home_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 300,
                  color: Colors.red,
                  child: Center(
                    child: Consumer<HomeProvider>(
                      builder: ((context, provider, child) =>
                          Text("${provider.favourite}")),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: ((context, index) => ListTile(
                    title: Consumer<HomeProvider>(
                      builder: ((context, provider, child) {
                        // String word = Word
                        return Card(
                          child: ListTile(
                            leading: Container(
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                            title: Text("$index"),
                            onTap: () => Provider.of<HomeProvider>(context,
                                    listen: false)
                                .addToFavourite(index),
                          ),
                        );
                      }),
                    ),
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<HomeProvider>(context, listen: false).debug,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
