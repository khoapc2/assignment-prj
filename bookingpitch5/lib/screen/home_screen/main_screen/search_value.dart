import 'package:flutter/material.dart';

class SearchValue extends StatefulWidget{
  final double _marginVertical;
  final double _marginHorizontal;
  SearchValue(this._marginVertical , this._marginHorizontal);
  @override
  SearchValueState createState() {
    // TODO: implement createState
    return SearchValueState(this._marginVertical , this._marginHorizontal);
  }
}

class SearchValueState extends State<SearchValue>{
  final searchValueController = TextEditingController();
  final double _marginVertical;
  final double _marginHorizontal;
  SearchValueState(this._marginVertical , this._marginHorizontal);

  @override
  void dispose() {
    searchValueController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints: BoxConstraints.expand(
        height: 35.0
      ),
      margin: EdgeInsets.symmetric(
        vertical: _marginVertical,
        horizontal: _marginHorizontal
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),

      child: TextField(
        controller: searchValueController,
        decoration: InputDecoration(
          hintText: 'Bạn muốn tìm sân bóng nào',
          prefixIcon: GestureDetector(
            onTap: () => {
            Navigator.of(context).pushNamed('/listPitchBySearch',
            arguments: searchValueController.text)
            },
            child: Icon(Icons.search),
          ),
          suffixIcon: Icon(Icons.sports_soccer),
          hoverColor: Colors.black,
        ),

      ),
    );
  }
}