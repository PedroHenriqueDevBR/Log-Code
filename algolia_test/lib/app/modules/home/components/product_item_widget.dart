import 'package:angolia_test/app/shared/models/ProductCommerce.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final genericImage =
      'https://media.istockphoto.com/photos/white-generic-box-studio-shot-picture-id1137310634?k=20&m=1137310634&s=612x612&w=0&h=LKSl2YFdCLuQYzJTXF6U18zQYDXcWDJws55t3VwYDcw=';
  final ProductCommerce product;
  const ListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image ?? genericImage, width: 60.0,),
      title: Text(product.name ?? 'Nome não registrado'),
      subtitle: Text(product.description ?? '', maxLines: 3),
      trailing: Text(
        'R\$ ${product.price ?? 0}',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}