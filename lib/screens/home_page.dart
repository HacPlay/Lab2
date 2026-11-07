import 'package:flutter/material.dart';

import '../data/products.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),

        title: const Text(
          'GemStore',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CATEGORII
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItem(
                    icon: Icons.female,
                    text: 'Women',
                    selected: true,
                  ),
                  CategoryItem(icon: Icons.male, text: 'Men'),
                  CategoryItem(icon: Icons.watch, text: 'Accessories'),
                  CategoryItem(icon: Icons.spa_outlined, text: 'Beauty'),
                ],
              ),
            ),

            // AUTUMN COLLECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/autumn.jpg',
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withValues(alpha: 0.35),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  const Positioned(
                    right: 20,
                    top: 35,
                    child: Text(
                      'Autumn\nCollection\n2021',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // FEATURE PRODUCTS TITLE
            const SectionTitle(title: 'Feature Products'),

            const SizedBox(height: 15),

            // FEATURE PRODUCTS
            SizedBox(
              height: 200,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, _) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),

            const SizedBox(height: 20),

            // NEW COLLECTION
            Container(
              height: 145,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xfff5f1ed),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NEW COLLECTION',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'HANG OUT\n& PARTY',
                            style: TextStyle(
                              fontSize: 20,
                              height: 1.3,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: Image.asset(
                        'assets/images/collection.jpg',
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // RECOMMENDED
            const SectionTitle(title: 'Recommended'),

            const SizedBox(height: 15),

            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 2,
                separatorBuilder: (_, _) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  final product = products[index + 3];

                  return Container(
                    width: 240,
                    decoration: BoxDecoration(
                      color: const Color(0xfffafafa),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.asset(
                            product.image,
                            width: 80,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  '\$ ${product.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // TOP COLLECTION
            const SectionTitle(title: 'Top Collection'),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // FOR SLIM & BEAUTY
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: const Color(0xfff8f7f8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '|  Sale up to 40%',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'FOR SLIM\n& BEAUTY',
                                  style: TextStyle(
                                    fontSize: 20,
                                    height: 1.25,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Image.asset(
                            'assets/images/model.jpg',
                            height: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // MOST SEXY & FABULOUS DESIGN
                  Container(
                    height: 230,
                    decoration: BoxDecoration(
                      color: const Color(0xfff8f7f8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 25,
                          top: 30,
                          child: Text(
                            '|  Summer Collection 2021',
                            style: TextStyle(
                              color: Color(0xff8c8c9c),
                              fontSize: 12,
                            ),
                          ),
                        ),

                        const Positioned(
                          left: 25,
                          top: 80,
                          child: Text(
                            'Most sexy\n& fabulous\ndesign',
                            style: TextStyle(
                              color: Color(0xff343442),
                              fontSize: 24,
                              height: 1.35,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Positioned(
                          right: 0,
                          bottom: 0,
                          width: 190,
                          height: 220,
                          child: Image.asset(
                            'assets/images/top_sexy.jpg',
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // T-SHIRTS + DRESSES
                  Row(
                    children: [
                      // T-SHIRTS
                      Expanded(
                        child: Container(
                          height: 220,
                          decoration: BoxDecoration(
                            color: const Color(0xfff8f7f8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                bottom: 0,
                                width: 95,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    'assets/images/top_tshirt.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const Positioned(
                                left: 105,
                                top: 45,
                                child: Text(
                                  'T-Shirts',
                                  style: TextStyle(
                                    color: Color(0xff777785),
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              const Positioned(
                                left: 105,
                                top: 85,
                                child: Text(
                                  'The\nOffice\nLife',
                                  style: TextStyle(
                                    fontSize: 20,
                                    height: 1.25,
                                    color: Color(0xff34343c),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // DRESSES
                      Expanded(
                        child: Container(
                          height: 220,
                          decoration: BoxDecoration(
                            color: const Color(0xfff8f7f8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 12,
                                top: 45,
                                child: Text(
                                  'Dresses',
                                  style: TextStyle(
                                    color: Color(0xff777785),
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              const Positioned(
                                left: 12,
                                top: 85,
                                child: Text(
                                  'Elegant\nDesign',
                                  style: TextStyle(
                                    fontSize: 20,
                                    height: 1.25,
                                    color: Color(0xff34343c),
                                  ),
                                ),
                              ),

                              Positioned(
                                right: 0,
                                bottom: 0,
                                width: 100,
                                height: 210,
                                child: Image.asset(
                                  'assets/images/top_dress.jpg',
                                  fit: BoxFit.contain,
                                  alignment: Alignment.bottomRight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),

            // închide Column principal
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// CATEGORY ITEM
// =====================================================

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.text,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: selected ? const Color(0xff333333) : const Color(0xfff3f3f3),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: selected ? Colors.white : Colors.grey),
        ),

        const SizedBox(height: 7),

        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            color: selected ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}

// =====================================================
// SECTION TITLE
// =====================================================

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Show all',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
