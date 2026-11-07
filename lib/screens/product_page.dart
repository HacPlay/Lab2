import 'package:flutter/material.dart';

import '../data/products.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedColor = 0;
  int selectedSize = 2;
  bool favorite = false;

  final List<Color> colors = [
    const Color(0xffe8c5ad),
    Colors.black,
    const Color(0xffef6b6b),
  ];

  final List<String> sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: SafeArea(
        child: Container(
          height: 65,
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          child: ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${widget.product.name} added to cart')),
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2d2d2d),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            icon: const Icon(Icons.shopping_bag_outlined),

            label: const Text('Add To Cart', style: TextStyle(fontSize: 16)),
          ),
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 450,
            backgroundColor: const Color(0xfff8f2ed),
            surfaceTintColor: Colors.transparent,
            pinned: false,

            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                    icon: Icon(
                      favorite ? Icons.favorite : Icons.favorite_border,
                      color: favorite ? Colors.redAccent : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],

            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(widget.product.image, fit: BoxFit.cover),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              transform: Matrix4.translationValues(0, -15, 0),
              child: Material(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAME + PRICE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          Text(
                            '\$ ${widget.product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // RATING
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Color(0xff579484),
                              size: 17,
                            ),
                          ),

                          const SizedBox(width: 8),

                          const Text(
                            '(83)',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      const Divider(),

                      const SizedBox(height: 15),

                      // COLOR SIZE
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Color',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Row(
                                  children: List.generate(colors.length, (
                                    index,
                                  ) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColor = index;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: selectedColor == index
                                                ? Colors.black
                                                : Colors.transparent,
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: colors[index],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Size',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Row(
                                  children: List.generate(sizes.length, (
                                    index,
                                  ) {
                                    final selected = selectedSize == index;

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSize = index;
                                        });
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        margin: const EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                          color: selected
                                              ? const Color(0xff333333)
                                              : const Color(0xfff5f5f5),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          sizes[index],
                                          style: TextStyle(
                                            color: selected
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      const Divider(),

                      // DESCRIPTION
                      ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        initiallyExpanded: true,
                        title: const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              widget.product.description,
                              style: const TextStyle(
                                color: Colors.grey,
                                height: 1.6,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Divider(),

                      // REVIEWS
                      ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        initiallyExpanded: true,
                        title: const Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.product.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 6,
                                      left: 5,
                                    ),
                                    child: Text(
                                      'OUT OF 5',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),

                                  const Spacer(),

                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Color(0xff579484),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Color(0xff579484),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Color(0xff579484),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Color(0xff579484),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Color(0xff579484),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              ratingBar('5', 0.80, '80%'),
                              ratingBar('4', 0.12, '12%'),
                              ratingBar('3', 0.05, '5%'),
                              ratingBar('2', 0.03, '3%'),
                              ratingBar('1', 0.00, '0%'),

                              const SizedBox(height: 30),

                              const ReviewWidget(
                                name: 'Jennifer Rose',
                                text:
                                    'I love it. Awesome customer service helped me out with sizing. '
                                    'The product is comfortable and looks great.',
                              ),

                              const SizedBox(height: 25),

                              const ReviewWidget(
                                name: 'Kelly Rihana',
                                text:
                                    'I am very happy with order. It was delivered quickly and '
                                    'the product looks exactly as expected.',
                              ),

                              const SizedBox(height: 15),
                            ],
                          ),
                        ],
                      ),

                      const Divider(),

                      const SizedBox(height: 20),

                      const Text(
                        'Similar Product',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        height: 220,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: similarProducts.length,
                          separatorBuilder: (_, _) => const SizedBox(width: 15),
                          itemBuilder: (context, index) {
                            return ProductCard(product: similarProducts[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ratingBar(String number, double value, String percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 15,
            child: Text(number, style: const TextStyle(fontSize: 11)),
          ),

          const Icon(Icons.star, size: 12, color: Color(0xff579484)),

          const SizedBox(width: 10),

          Expanded(
            child: LinearProgressIndicator(
              value: value,
              minHeight: 4,
              backgroundColor: const Color(0xffeeeeee),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xff579484),
              ),
            ),
          ),

          const SizedBox(width: 10),

          SizedBox(
            width: 35,
            child: Text(
              percentage,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  final String name;
  final String text;

  const ReviewWidget({super.key, required this.name, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xffeeeeee),
          child: Icon(Icons.person, color: Colors.grey),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 5),

              const Row(
                children: [
                  Icon(Icons.star, color: Color(0xff579484), size: 13),
                  Icon(Icons.star, color: Color(0xff579484), size: 13),
                  Icon(Icons.star, color: Color(0xff579484), size: 13),
                  Icon(Icons.star, color: Color(0xff579484), size: 13),
                  Icon(Icons.star, color: Color(0xff579484), size: 13),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                text,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
