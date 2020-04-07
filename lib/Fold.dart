import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class Fold extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              child: SimpleFoldingCell(
                key: _foldingCellKey,
                onOpen: () => print('opened'),
                onClose: () => print('closed'),
                frontWidget: FrontWidget(),
                innerTopWidget: InnerTop(),
                innerBottomWidget: InnerBottom(),
                cellSize: Size(MediaQuery.of(context).size.width, 175),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container FrontWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                height: 175,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15)),
                child: FlatButton(
                  onPressed: () {
                    _foldingCellKey?.currentState?.toggleFold();
                  },
                ),
              )),
          SizedBox(
            width: 2,
          ),
          Expanded(
              flex: 1,
              child: Container(
                height: 175,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15)),
                child: FlatButton(
//                      child: Text('Click'),
                  onPressed: () {
                    _foldingCellKey?.currentState?.toggleFold();
                  },
                ),
              )),
          SizedBox(
            width: 2,
          ),
          Expanded(
              flex: 1,
              child: Container(
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.pink,
                ),
                child: FlatButton(
                  onPressed: () {
                    _foldingCellKey?.currentState?.toggleFold();
                  },
                ),
              ))
        ],
      ),
    );
  }

  Container InnerTop() {
    return Container(color: Colors.purple);
  }

  Container InnerBottom() {
    return Container(
      color: Colors.red,
      child: FlatButton(
        onPressed: () {
          _foldingCellKey?.currentState?.toggleFold();
        },
      ),
    );
  }
}
