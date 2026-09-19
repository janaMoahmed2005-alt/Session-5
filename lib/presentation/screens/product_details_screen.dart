import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget{
  const ProductDetailsScreen({super.key, required this.productId});
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState(){
    context.read<ProductCubit>().productDetails(productId: widget.productId);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(appBar: AppBar(title: Text("")),);
  }
}