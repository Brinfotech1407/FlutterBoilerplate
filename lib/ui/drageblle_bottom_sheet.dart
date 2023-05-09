import 'package:flutter/material.dart';

class DraggableBottomSheet extends StatefulWidget {
  const DraggableBottomSheet({Key? key}) : super(key: key);

  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Center(child: Text('Show Modal')),
      onPressed: () {
        _showModal(context, 50);
      },
    );
  }

  _showModal(context, count) {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: .5,
          maxChildSize: 1,
          minChildSize: 0.40,
          builder: (context, scrollController) {
            return Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('HEADER'),
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List<Text>.generate(count, (x) => Text("CHILD")),
                    ),
                  ),
                  Text('FOOTER'),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
