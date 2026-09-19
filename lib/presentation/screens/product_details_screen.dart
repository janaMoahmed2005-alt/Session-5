import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_cubit.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProcductDetailsScreen extends StatefulWidget {
  const ProcductDetailsScreen({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProcductDetailsScreen> createState() =>
      _ProcductDetailsScreenState();
}

class _ProcductDetailsScreenState
    extends State<ProcductDetailsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProductCubit>().productDetails(
          productId: widget.productId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return switch (state) {
            // ---------------- LOADING ----------------
            ProductDetailsLoadingstate() => Center(
                child: CircularProgressIndicator(
                  color: colors.primary,
                ),
              ),

            // ---------------- FAILURE ----------------
            ProductsDetailsFailureState(:final message) =>
              Center(
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
                    ],
                  ),
                ),
              ),

            // ---------------- SUCCESS ----------------
            ProductsDetailsSuccessState(:final details) =>
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    CachedNetworkImage(
                      width: double.infinity,
                      height: 320,
                      fit: BoxFit.cover,

                      imageUrl:
                          details.coverPictureUrl ?? "",

                      placeholder: (context, url) {
                        return SizedBox(
                          height: 320,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: colors.primary,
                            ),
                          ),
                        );
                      },

                      errorWidget: (context, url, error) {
                        return Container(
                          height: 320,
                          color: colors.tertiary.withOpacity(0.2),
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 60,
                            color: colors.secondary,
                          ),
                        );
                      },
                    ),

                    // Product Information
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          // Product Name
                          Text(
                            details.name ?? "",
                            style: TextStyle(
                              color: colors.secondary,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Price
                          Text(
                            "${details.price ?? 0} EGP",
                            style: TextStyle(
                              color: colors.primary,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Divider
                          Divider(
                            color: colors.tertiary,
                            thickness: 1,
                          ),

                          const SizedBox(height: 20),

                          // Description title
                          Text(
                            "Description",
                            style: TextStyle(
                              color: colors.secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Description
                          Text(
                            details.description ?? "",
                            style: TextStyle(
                              color: colors.secondary
                                  .withOpacity(0.7),
                              fontSize: 15,
                              height: 1.6,
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Add To Cart
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(
                                backgroundColor: colors.primary,

                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(14),
                                ),
                              ),

                              onPressed: () {},

                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                              ),

                              label: const Text(
                                "Add To Cart",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            _ => const SizedBox.expand(),
          };
        },
      ),
    );
  }
}