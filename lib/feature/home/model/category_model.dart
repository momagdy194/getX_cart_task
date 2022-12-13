class CategoryModel{
  String title,image;

  CategoryModel(this.title, this.image);

  CategoryModel.fromJson(Map<dynamic, dynamic> data)
      : title = data['title'],
        image = data['image'];




}