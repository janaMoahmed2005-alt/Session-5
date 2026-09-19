
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_cubit.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_state.dart';
//import 'package:flutter_application_1/product_state.dart';
import 'package:flutter_application_1/core/cubit/theme/theme_cubit.dart';
import 'package:flutter_application_1/core/cubit/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.title});
  final String title;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return switch (state) {
                ProductIntialState() => Center(
                    child: CircularProgressIndicator(),
                  ),

                ProductFailureState(:final message) => Center(
                  child: Column(
                    spacing: 16,
                    children: [
                      Text(message),
                      FilledButton(onPressed: (){
                        context.read<ProductCubit>().fetchProducts();
                      }, child: Text("Try Again")),
                      //27na 3mln7a 3l4an lw mafi4 network or somthing went wrong 
                      //fa 3malt button fetch 2l products tany
                    ],
                  )),

                ProductSuccessState(:final response) => ListView.builder(
                    itemCount: response.items?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          context.pushNamed(Routes.ProductDetailsScreen,
                          queryParameters: {
                            "id": response.items?[index].id ?? "",
                          },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        
                         
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                height: 100,
                                width: 100,
                                imageUrl:
                                    response.items?[index].coverPictureUrl ?? "",
                                errorWidget: (context, url, error) {
                                  return Icon(Icons.image_not_supported);
                                },
                              ),
                        
                              SizedBox(width: 8),
                        
                              Expanded(
                                child: Column(
                                  spacing: 8,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   
                                    Text(
                                      response.items?[index].name ?? "",
                                      style: TextStyle(
                                        color: Color.fromARGB(170, 248, 247, 249),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                        
                                    Text(
                                      response.items?[index].description ?? "",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                _ => SizedBox.expand(),
              };
            },
          ),
        );
      },
    );
  }
}

