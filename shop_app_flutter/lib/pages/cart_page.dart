import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Delete Product',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text("are you Sure you want to delete?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "NO",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .removeProduct(cartItem);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Yes",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)))
                              ],
                            );
                          });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                ),
                title: Text(
                  cartItem['title'].toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text('Size: ${cartItem['sizes']}'),
              );
            }));
  }
}
