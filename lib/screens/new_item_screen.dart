import 'package:flutter/material.dart';
import '../models/item.dart';

class NewItemScreen extends StatefulWidget {
  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  String? imagePath;

  void browseImage() {
    // Simulate selecting image (No real file picker since we're skipping `flutter pub add`)
    setState(() {
      imagePath = 'assets/placeholder.png'; // Simulate placeholder path
    });
  }

  void saveItem() {
    final newItem = Item(
      title: titleController.text,
      description: descriptionController.text,
      imagePath: imagePath ?? '',
      price: priceController.text,
    );
    Navigator.pop(context, newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.grey,
              child: imagePath == null
                  ? Center(child: Icon(Icons.image, size: 50))
                  : Center(child: Text('Image Selected')), // Mock image
            ),
            TextButton(onPressed: browseImage, child: Text('Browse')),
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Description')),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                prefixText: '₱ ',
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: saveItem, child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
