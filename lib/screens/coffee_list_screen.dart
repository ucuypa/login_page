import 'package:flutter/material.dart';
import '../data/coffee_data.dart';
import '../widgets/coffee_card.dart';
import '../widgets/category_filter.dart';

class CoffeeListScreen extends StatefulWidget {
  const CoffeeListScreen({super.key});

  @override
  State<CoffeeListScreen> createState() => _CoffeeListScreenState();
}

class _CoffeeListScreenState extends State<CoffeeListScreen> {
  String selectedCategory = "All Coffee";
  final categories = ["All Coffee", "Macchiato", "Latte", "Americano"];

  @override
  Widget build(BuildContext context) {
    final filteredCoffees = selectedCategory == "All Coffee"
        ? coffees
        : coffees.where((c) => c.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Coffee"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Filter kategori di atas
            CategoryFilter(
              categories: categories,
              selectedCategory: selectedCategory,
              onSelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            const SizedBox(height: 16),
            // Grid daftar coffee
            Expanded(
              child: GridView.builder(
                itemCount: filteredCoffees.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return CoffeeCard(coffee: filteredCoffees[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
