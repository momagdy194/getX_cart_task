class AddressModel {
  String title, address, streets;

  AddressModel(this.title, this.address, this.streets);

  AddressModel.fromJson(Map<dynamic, dynamic> data)
      : title = data['title'],
        address = data['address'],
        streets = data['streets'];
}
