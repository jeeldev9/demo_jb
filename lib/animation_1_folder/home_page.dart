import 'package:flutter/material.dart';
import 'package:ripple_effect/ripple_effect.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageKey = RipplePage.createGlobalKey();
  final effectKey = RippleEffect.createGlobalKey();

  @override
  Widget build(BuildContext context) {
    return RipplePage(
      pageKey: pageKey,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Home')),
        ),
        body: Center(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: RippleEffect(
          pageKey: pageKey,
          effectKey: effectKey,
          color: Colors.purple,
          child: FloatingActionButton(
            onPressed: () => RippleEffect.start(effectKey, toNextPage),
            child: Icon(Icons.cake),
          ),
        ),
      ),
    );
  }

  Future<void> toNextPage() => Navigator.of(context).push(
        FadeRouteBuilder(
          page: SecondPage(),
        ),
      );
}

class SecondPage extends StatelessWidget {
  final pageKey = RipplePage.createGlobalKey();
  final effectKey = RippleEffect.createGlobalKey();

  @override
  Widget build(BuildContext context) {
    return RipplePage(
      pageKey: pageKey,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Center(child: Text('Ripple Effect')),
          ),
          body: Center(),
          floatingActionButton: RippleEffect(
            pageKey: pageKey,
            effectKey: effectKey,
            color: Colors.blue,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () =>
                  RippleEffect.start(effectKey, () => toNextPage(context)),
              child: Icon(Icons.arrow_back),
            ),
          )),
    );
  }

  Future<void> toNextPage(BuildContext context) => Navigator.of(context).push(
        FadeRouteBuilder(
          page: HomePage(),
        ),
      );
}
