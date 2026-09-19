
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_cubit.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_state.dart';
import 'package:flutter_application_1/core/cubit/theme/theme_cubit.dart';
import 'package:flutter_application_1/core/cubit/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),

          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return switch (state) {
                ProductIntialState() => Center(
                    child: CircularProgressIndicator(
                      color: colors.primary,
                    ),
                  ),

                ProductFailureState(:final message) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 16,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 50,
                            color: colors.primary,
                          ),

                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.secondary,
                              fontSize: 16,
                            ),
                          ),

                          FilledButton.icon(
                            onPressed: () {
                              context
                                  .read<ProductCubit>()
                                  .fetchProducts();
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text("Try Again"),
                          ),
                        ],
                      ),
                    ),
                  ),

                ProductSuccessState(:final response) => ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: response.items?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = response.items![index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            context.pushNamed(
                              Routes.productDetailsScreen,
                              queryParameters: {
                                "id": product.id ?? "",
                              },
                            );
                          },

                          child: Container(
                            padding: const EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              color: colors.tertiary.withOpacity(0.15),

                              border: Border.all(
                                color: colors.tertiary,
                                width: 1,
                              ),

                              borderRadius: BorderRadius.circular(16),
                            ),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    height: 110,
                                    width: 110,
                                    fit: BoxFit.cover,

                                    imageUrl:
                                        product.coverPictureUrl ?? "",

                                    placeholder: (context, url) {
                                      return Container(
                                        height: 110,
                                        width: 110,
                                        color: colors.tertiary
                                            .withOpacity(0.2),
                                        child: Center(
                                          child:
                                              CircularProgressIndicator(
                                            color: colors.primary,
                                          ),
                                        ),
                                      );
                                    },

                                    errorWidget:
                                        (context, url, error) {
                                      return Container(
                                        height: 110,
                                        width: 110,
                                        color: colors.tertiary
                                            .withOpacity(0.2),
                                        child: Icon(
                                          Icons
                                              .image_not_supported_outlined,
                                          color: colors.secondary,
                                          size: 30,
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                const SizedBox(width: 14),

                                // Product Information
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name ?? "",
                                        maxLines: 2,
                                        overflow:
                                            TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: colors.secondary,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      Text(
                                        product.description ?? "",
                                        maxLines: 3,
                                        overflow:
                                            TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: colors.secondary
                                              .withOpacity(0.7),
                                          fontSize: 13,
                                          height: 1.4,
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      if (product.price != null)
                                        Text(
                                          "${product.price} EGP",
                                          style: TextStyle(
                                            color: colors.primary,
                                            fontSize: 16,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),

                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                  color: colors.secondary
                                      .withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                _ => const SizedBox.expand(),
              };
            },
          ),
        );
      },
    );
  }
}
