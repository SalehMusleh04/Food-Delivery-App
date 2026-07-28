class CategoryItemModel {
  final int id;
  final String categoryItem;

  CategoryItemModel({required this.id, required this.categoryItem});
}

List<CategoryItemModel> categories = [
  CategoryItemModel(id: 0, categoryItem: 'All'),
  CategoryItemModel(id: 1, categoryItem: 'Burger'),
  CategoryItemModel(id: 2, categoryItem: 'Pizza'),
  CategoryItemModel(id: 3, categoryItem: 'Shawerma'),
];
