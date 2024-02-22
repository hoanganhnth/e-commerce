import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/order/widgets/orders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('My Order', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: TOrderListItems(),
    );
  }
}
