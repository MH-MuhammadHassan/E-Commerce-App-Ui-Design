import 'package:flutter/material.dart';
import 'package:smit_ui_figma/constants/colors.dart';
import 'package:smit_ui_figma/custom_widgets/circle_avatar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smit_ui_figma/custom_widgets/product_card.dart';
import 'package:smit_ui_figma/custom_widgets/product_discount_card.dart';
import 'package:smit_ui_figma/custom_widgets/section_heading.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // bottom nav selected index
  int bottomNavSelectedIndex = 0;
  // Keeps track of the current active image in the carousel.
  int currentIndex = 0;

  // SLIDER IMAGES List
  final List<String> imgList = [
    'https://images.pexels.com/photos/2729899/pexels-photo-2729899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/3763869/pexels-photo-3763869.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1456706/pexels-photo-1456706.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBackground,
      // AppBar
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        leading: Icon(
          Icons.menu,
          color: AppColors.appBarIconsText,
        ),
        title: Text(
          "Home",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.appBarIconsText),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                Icon(Icons.notification_add, color: AppColors.appBarIconsText),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.store, color: AppColors.appBarIconsText),
              ],
            ),
          ),
        ],
      ),
      // body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              // Text Field
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff1F2937),
                    ),
                    hintText: 'Search Anything...',
                    hintStyle:
                        TextStyle(color: Color(0xff9CA3AF), fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            // Categories and View All ->
            SectionHeading(
              title: "Categories",
              onPressed: () {},
            ),

            // fashion, electronics appliances, etcc
            Padding(
              padding: EdgeInsets.only(top: 17, left: 16.05),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 23.95, // Adjust space between items
                  children: [
                    CategoryItem(
                      iconPath: 'assets/images/hoodies.svg',
                      label: 'Hoodies',
                      bgColor: Color(0xffECFDF5),
                    ),
                    CategoryItem(
                      iconPath: 'assets/images/shoes.svg',
                      label: 'Shoes',
                      bgColor: Color(0xffECFDF5),
                    ),
                    CategoryItem(
                      iconPath: 'assets/images/bags.svg',
                      label: 'Bags',
                      bgColor: Color(0xffECFDF5),
                    ),
                    CategoryItem(
                        iconPath: 'assets/images/fashion.svg',
                        label: 'Fashion',
                        bgColor: Color(0xffECFDF5)),
                    CategoryItem(
                        iconPath: 'assets/images/Electronics.svg',
                        label: 'Electronics',
                        bgColor: Color(0xffECFDF5)),
                    CategoryItem(
                        iconPath: 'assets/images/Appliances.svg',
                        label: 'Appliances',
                        bgColor: Color(0xffECFDF5)),
                    CategoryItem(
                        iconPath: 'assets/images/Beauty.svg',
                        label: 'Beauty',
                        bgColor: Color(0xffECFDF5)),
                    // duplicates to check horizontal scroll
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 22.9,
            ),
            // Banner scroll
            CarouselSlider(
              // . map => list har element transform (modify)
              items: imgList.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(item,
                      fit: BoxFit.cover, height: 154, width: double.infinity),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true, // Auto-slide enabled
                autoPlayInterval: Duration(seconds: 2), // Slide every 2 sec
                enlargeCenterPage:
                    true, // Slightly enlarges the current image for better focus.
                aspectRatio: 16 / 9, // Defines the width-to-height ratio.
                // context,index
                onPageChanged: (index, reason) {
                  // statefful
                  setState(() {
                    currentIndex =
                        index; // Updates _currentIndex whenever the slide changes.
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // 57,58,59 used to generate dot indicators below the carousel and make them clickable
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => setState(() => currentIndex = entry.key),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          currentIndex == entry.key ? Colors.blue : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
            // Deal of the day
            const SizedBox(height: 24),
            SectionHeading(
              title: "Deal of the day",
              onPressed: () {},
            ),
            // timer
            Padding(
              padding: EdgeInsets.only(top: 8, left: 16),
              child: Container(
                width: 158,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xffEF4444),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "11",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    Text(
                      "HRS",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    Text(
                      "15",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    Text(
                      "MIN",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    Text(
                      "04",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    Text(
                      "SEC",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 💨 ProductDiscountCard (Running Shoes, Wirst Watch, Sneakers, Bluetooth Speakers)
            Padding(
              padding: EdgeInsets.only(
                top: 32,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      spacing: 16,
                      children: [
                        SizedBox(
                          width: 32,
                        ),
                        // 💨 1st card (running shoes)
                        ProductDiscountCard(
                          imageUrl:
                              'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=600',
                          title: "Running Shoes",
                          discountMessage: "Upto 40% OFF",
                        ),
                        // 💨 2nd card (sneakers)
                        ProductDiscountCard(
                          imageUrl:
                              'https://images.pexels.com/photos/27911168/pexels-photo-27911168/free-photo-of-bag.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          title: "Bags",
                          discountMessage: "40-60% OFF",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      spacing: 16,
                      children: [
                        SizedBox(
                          width: 32,
                        ),
                        // 💨 3rd card ( Wrist Watches)
                        ProductDiscountCard(
                          imageUrl:
                              'https://images.pexels.com/photos/5081914/pexels-photo-5081914.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          title: "Wrist Watches",
                          discountMessage: "Upto 40% OFF",
                        ),
                        // 💨 4th card (Bluetooth Speakers)
                        ProductDiscountCard(
                          imageUrl:
                              'https://images.pexels.com/photos/9767551/pexels-photo-9767551.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          title: "Bluetooth Speakers",
                          discountMessage: "40-60% OFF",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // 💨 Hot Selling Footwear and View All ->
            SectionHeading(
              title: "Hot Selling Footwear",
              onPressed: () {},
            ),
            // 💨 addidas white seakers cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/1858404/pexels-photo-1858404.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Adidas white sneakers",
                    price: 68,
                    cutoffPrice: 136,
                    discount: "50%",
                    rating: 4.8,
                    orderCount: 692,
                    isTopSeller: true,
                    isFavorite: true,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/1522381/pexels-photo-1522381.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Nike Running Shoes",
                    price: 75,
                    cutoffPrice: 90,
                    discount: "16.67%",
                    rating: 4.2,
                    orderCount: 450,
                    isTopSeller: false,
                    isFavorite: false,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Nike Air Max",
                    price: 120,
                    cutoffPrice: 150,
                    discount: "20%",
                    rating: 4.2,
                    orderCount: 450,
                    isTopSeller: true,
                    isFavorite: false,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Blue Lace-up Sneakers",
                    price: 88,
                    cutoffPrice: 126,
                    discount: "30.16%",
                    rating: 3.8,
                    orderCount: 292,
                    isTopSeller: false,
                    isFavorite: true,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/1598508/pexels-photo-1598508.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Vans Sneakers",
                    price: 55,
                    cutoffPrice: 80,
                    discount: "31.25%",
                    rating: 3.0,
                    orderCount: 550,
                    isTopSeller: true,
                    isFavorite: false,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/1240892/pexels-photo-1240892.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Red Low-top Sneakers",
                    price: 100,
                    cutoffPrice: 140,
                    discount: "28.57%",
                    rating: 4.5,
                    orderCount: 450,
                    isTopSeller: true,
                    isFavorite: false,
                  ),
                ],
              ),
            ),
            // 💨 Recommended for you and View All ->
            SectionHeading(
              title: "Recommended for you",
              onPressed: () {},
            ),
            // 💨 ProductCard Allen Solly Regular fit cotton shirt
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/8532616/pexels-photo-8532616.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Allen Solly Regular fit",
                    price: 35,
                    cutoffPrice: 40,
                    discount: "12.5%",
                    rating: 4.4,
                    orderCount: 412,
                    isTopSeller: true,
                    isFavorite: true,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/7648278/pexels-photo-7648278.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Armor Regular Fit ",
                    price: 52,
                    cutoffPrice: 62,
                    discount: "16.13%",
                    rating: 3.2,
                    orderCount: 410,
                    isTopSeller: false,
                    isFavorite: false,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/7129355/pexels-photo-7129355.jpeg?auto=compress&cs=tinysrgb&w=600',
                    title: "Calvin Clein Regular fit",
                    price: 40,
                    cutoffPrice: 55,
                    discount: "27.27%",
                    rating: 4.9,
                    orderCount: 550,
                    isTopSeller: true,
                    isFavorite: false,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/9558592/pexels-photo-9558592.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Long Sleeve Shirt",
                    price: 25,
                    cutoffPrice: 30,
                    discount: "16.67%",
                    rating: 4.4,
                    orderCount: 212,
                    isTopSeller: true,
                    isFavorite: true,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://images.pexels.com/photos/9594952/pexels-photo-9594952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: "Green Dress Shirt",
                    price: 63,
                    cutoffPrice: 82,
                    discount: "23.17%",
                    rating: 3.2,
                    orderCount: 231,
                    isTopSeller: false,
                    isFavorite: true,
                  ),
                  ProductCard(
                    imageUrl:
                        'https://content-management-files.canva.com/cdn-cgi/image/f=auto,q=70/2fdbd7ab-f378-4c63-8b21-c944ad2633fd/header_t-shirts2.jpg',
                    title: "Custom Clein fit",
                    price: 20,
                    cutoffPrice: 45,
                    discount: "55.56%",
                    rating: 5.9,
                    orderCount: 550,
                    isTopSeller: true,
                    isFavorite: false,
                  ),
                ],
              ),
            ),
            // END
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),

      // 💨💨 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffFFFFFF),
        selectedItemColor: Color(0xff1D4ED8), // Blue color when selected
        unselectedItemColor: Color(0xff6B7280), // Gray when unselected
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavSelectedIndex,
        onTap: (index) {
          setState(() {
            bottomNavSelectedIndex = index; // Update selected index
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view, size: 30),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time, size: 30),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
