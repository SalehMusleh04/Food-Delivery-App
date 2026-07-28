class FoodItemModel {
  final String imgPath;
  final String name;
  final String subTitle;
  final String rating;
  final bool isFavorite;
  final int categoryId;
  final int id;
  final String description;
  final double price;
  final String prepTime;

  FoodItemModel({
    required this.imgPath,
    required this.name,
    required this.subTitle,
    required this.rating,
    required this.categoryId,
    this.isFavorite = false,
    required this.id,
    required this.description,
    required this.price,
    required this.prepTime,
  });

  FoodItemModel copyWith({
    String? imgPath,
    String? name,
    String? subTitle,
    String? rating,
    bool? isFavorite,
    int? categoryId,
    int? id,
    String? description,
    double? price,
    String? prepTime,
  }) {
    return FoodItemModel(
      imgPath: imgPath ?? this.imgPath,
      name: name ?? this.name,
      subTitle: subTitle ?? this.subTitle,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
      categoryId: categoryId ?? this.categoryId,
      id: id ?? this.id,
      description: description ?? this.description,
      price: price ?? this.price,
      prepTime: prepTime ?? this.prepTime,
    );
  }
}

List<FoodItemModel> foods = [
  FoodItemModel(
    id: 0,
    categoryId: 1,
    imgPath: 'assets/imgs/cheeseburger.png',
    name: 'Cheeseburger',
    subTitle: 'Wendy\'s Burger',
    rating: '4.9',
    price: 8.99,
    prepTime: '15',
    description:
        "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
  ),
  FoodItemModel(
    id: 2,
    categoryId: 1,
    imgPath: 'assets/imgs/hamburger_chicken.png',
    name: 'Hamburger',
    subTitle: 'Chicken Burger',
    rating: '4.6',
    price: 7.50,
    prepTime: '20',
    description:
        "Enjoy our delicious Chicken Burger, featuring a tender, marinated grilled chicken breast. Served on a toasted bun with fresh lettuce, tomatoes, and our signature creamy mayo sauce.",
  ),
  FoodItemModel(
    id: 1,
    categoryId: 1,
    imgPath: 'assets/imgs/hamburger_veggie.png',
    name: 'Hamburger',
    subTitle: 'Veggie Burger',
    rating: '4.8',
    price: 6.99,
    prepTime: '18',
    description:
        "A healthy and tasty option! Our Veggie Burger is made with a premium plant-based patty, topped with fresh avocado, crunchy onions, and vegan cheese, all in a soft whole-wheat bun.",
  ),
  FoodItemModel(
    id: 4,
    categoryId: 2,
    imgPath: 'assets/imgs/pizza_chicken.png',
    name: 'Pizza',
    subTitle: 'Grilled Chicken & Cheese',
    rating: '4.2',
    price: 12.99,
    prepTime: '26',
    description:
        "Freshly baked pizza loaded with grilled chicken chunks, a blend of mozzarella and cheddar cheese, sweet bell peppers, and a rich tomato sauce on a crispy crust.",
  ),
  FoodItemModel(
    id: 5,
    categoryId: 2,
    imgPath: 'assets/imgs/pizza_pepperoni.png',
    name: 'Pizza',
    subTitle: 'Classic Pepperoni',
    rating: '4.4',
    price: 11.99,
    prepTime: '22',
    description:
        "The all-time favorite Classic Pepperoni Pizza. Covered edge-to-edge with spicy premium pepperoni slices, melted mozzarella, and our secret Italian herb tomato sauce.",
  ),
  FoodItemModel(
    id: 6,
    categoryId: 2,
    imgPath: 'assets/imgs/pizza_tomato.png',
    name: 'Pizza',
    subTitle: 'Fresh Tomato & Basil',
    rating: '4.0',
    price: 10.50,
    prepTime: '20',
    description:
        "Experience the authentic taste of Italy with our Fresh Tomato & Basil Pizza. A light Margherita style pizza with fresh mozzarella, ripe tomatoes, and aromatic basil leaves.",
  ),
  FoodItemModel(
    id: 3,
    categoryId: 1,
    imgPath: 'assets/imgs/hamburger_fried_chicken.png',
    name: 'Hamburger',
    subTitle: 'Fried Chicken Burger',
    rating: '4.5',
    price: 8.50,
    prepTime: '19',
    description:
        "Craving that extra crunch? Our Fried Chicken Burger features a perfectly golden, crispy fried chicken breast, topped with spicy mayo and tangy pickles on a brioche bun.",
  ),
  FoodItemModel(
    id: 7,
    categoryId: 3,
    imgPath: 'assets/imgs/shawerma.png',
    name: 'Shawerma',
    subTitle: 'Arabic Shawerma',
    rating: '4.1',
    price: 5.99,
    prepTime: '12',
    description:
        "Authentic Arabic Shawerma wrapped in thin, warm flatbread. Packed with slow-roasted spiced meat, crunchy pickles, and generously drizzled with our special garlic sauce.",
  ),
];
