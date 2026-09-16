import 'package:doctorhunt_app/apps/features/home/data/models/doctor_models.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_horizontal_list.dart';


class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: CustomHorizontalList<CategoryModel>(
        items: categories,
        spacing: 12,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        itemBuilder: (context, category, index) {
          return _CategoryCard(
            category: category,
            index: index,
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final int index;

  const _CategoryCard({
    required this.category,
    required this.index,
  });

  Color get backgroundColor {
    switch (index % 4) {
      case 0:
        return const Color(0xFF4D5BFF);

      case 1:
        return const Color(0xFF00CFA0);

      case 2:
        return const Color(0xFFFFA43B);

      default:
        return const Color(0xFFFF4B5C);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 90,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: category.imagePath.isEmpty
          ? const Icon(
              Icons.medical_services_outlined,
              color: Colors.white,
              size: 40,
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                category.imagePath,
                fit: BoxFit.contain,
              ),
            ),
    );
  }
}