class CategoryModel {
  final String title;
  final String imagePath;

  const CategoryModel({
    required this.title,
    required this.imagePath,
  });
}

class LiveDoctorModel {
  final String name;
  final String imagePath;

  const LiveDoctorModel({
    required this.name,
    required this.imagePath,
  });
}  


class PopularDoctorModel {
  final String name;
  final String specialty;
  final String imagePath;
  final double rating;

  const PopularDoctorModel({
    required this.name,
    required this.specialty,
    required this.imagePath,
    required this.rating,
  });
}


class FeatureDoctorModel {
  final String name;
  final String imagePath;
  final double rating;
  final double price;

  const FeatureDoctorModel({
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.price,
  });
}


