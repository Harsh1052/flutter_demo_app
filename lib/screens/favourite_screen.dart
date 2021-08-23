import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/cubit/myCubit.dart';
import 'package:flutter_demo_app/custom_widgets/cart_list_item.dart';

class FavouriteScreen extends StatefulWidget {
  final bool? isEdit;
  FavouriteScreen({this.isEdit});

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<int> qty = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCubit, bool>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: ListView.builder(
            itemBuilder: (context, index) {
              return CartItem(
                isEdit: state,
                qty: qty[index],
                onAdd: () {
                  qty[index]++;
                  setState(() {});
                },
                onRemove: () {
                  qty[index]--;
                  setState(() {});
                },
              );
            },
            itemCount: qty.length,
          ),
          bottomNavigationBar: state
              ? Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(10),
                  child: Text("Delete Item"),
                )
              : Container(
                  width: 0,
                  height: 0,
                ),
        );
      },
    );
  }
}
