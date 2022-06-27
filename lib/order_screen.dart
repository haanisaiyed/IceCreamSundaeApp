import 'package:flutter/material.dart';
import 'order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key, required this.orders}) : super(key: key);
  final List<Order> orders;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(orders[index].toString(),
                style: TextStyle(
                  fontSize: 20,
                ),),
              );
          }),
        ),
      ),
    );
  }
}
