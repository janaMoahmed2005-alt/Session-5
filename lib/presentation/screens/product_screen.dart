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
  int selectedIndex = 0;

  final TextEditingController searchController = TextEditingController();

  final List<String> categories = [
    "Rings",
    "Necklaces",
    "Charms",
    "Bracelets",
    "Anklets",
  ];
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProducts();
  }
  @override
    void dispose() {
      searchController.dispose();
      super.dispose();
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

                ProductSuccessState(:final response) => ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      // Search Bar
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search products...",
                          prefixIcon: Icon(
                            Icons.search,
                            color: colors.secondary.withOpacity(0.6),
                          ),
                          filled: true,
                          fillColor: colors.tertiary.withOpacity(0.15),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: colors.tertiary,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: colors.tertiary,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(
                              color: colors.primary,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Categories Section
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final isSelected = selectedIndex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? colors.primary
                                      : colors.tertiary.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? colors.primary
                                        : colors.tertiary,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? colors.onPrimary
                                          : colors.secondary,
                                      fontSize: 14,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Promotional Banner
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: colors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: colors.primary.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Special Collection",
                              style: TextStyle(
                                color: colors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Discover our new arrivals",
                              style: TextStyle(
                                color: colors.secondary.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 14),
                            FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                backgroundColor: colors.primary,
                                foregroundColor: colors.onPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                              child: const Text(
                                "Explore Now",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // All Products Section Header
                      Text(
                        "All Products",
                        style: TextStyle(
                          color: colors.secondary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Product List
                      ...List.generate(
                        response.items?.length ?? 0,
                        (index) {
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    // Product Image
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(12),
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
                                              fontWeight:
                                                  FontWeight.bold,
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
                    ],
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