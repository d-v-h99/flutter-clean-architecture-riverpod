import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/product_detail_provider.dart';

@RoutePage()
class ProductDetailScreen extends ConsumerStatefulWidget {
  final int id;

  const ProductDetailScreen(this.id, {Key? key}) : super(key: key);
  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      ref.read(productDetailProvider.notifier).getDetailProduct(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productDetailProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: state.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Center(child: CircularProgressIndicator()),
        failure: (exception) => Center(
          child: Text('Error: ${exception.message}'),
        ),
        success: (product) => buildListView(context, product),
      ),
    );
  }

  ListView buildListView(BuildContext context, Product product) {
    final discountPrice =
        (product.price * (1 - product.discountPercentage / 100))
            .toStringAsFixed(2);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Image.network(
            product.thumbnail,
            width: 180,
            height: 180,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          product.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          product.brand,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 8),
        // Giá, giảm giá
        Row(
          children: [
            Text(
              '\$$discountPrice',
              style: const TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            if (product.discountPercentage > 0)
              Text(
                '\$${product.price}',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              ),
            const SizedBox(width: 8),
            if (product.discountPercentage > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(8)),
                child: Text('-${product.discountPercentage}%',
                    style: const TextStyle(color: Colors.green)),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            Text(product.rating.toString()),
            const SizedBox(width: 12),
            const Icon(Icons.inventory_2, size: 20, color: Colors.blueGrey),
            Text(' ${product.stock} in stock'),
          ],
        ),
        const SizedBox(height: 12),
        // Tags
        Wrap(
          spacing: 6,
          children: [
            for (var tag in product.tags)
              Chip(
                label: Text(tag),
                backgroundColor: Colors.blueGrey.shade50,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
              ),
          ],
        ),
        const SizedBox(height: 12),
        // Mô tả sản phẩm
        Text(
          product.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        // Thông tin chi tiết
        _infoRow(Icons.qr_code, 'Barcode', product.meta.barcode),
        _infoRow(Icons.verified_user, 'Warranty', product.warrantyInformation),
        _infoRow(Icons.local_shipping, 'Shipping', product.shippingInformation),
        _infoRow(Icons.policy, 'Return Policy', product.returnPolicy),
        _infoRow(
            Icons.check_circle, 'Availability', product.availabilityStatus),
        _infoRow(Icons.numbers, 'SKU', product.sku),
        _infoRow(
            Icons.list_alt, 'Min Order Qty', '${product.minimumOrderQuantity}'),
        _infoRow(Icons.aspect_ratio, 'Dimensions',
            '${product.dimensions.width} x ${product.dimensions.height} x ${product.dimensions.depth}'),
        _infoRow(Icons.monitor_weight, 'Weight', '${product.weight}g'),
        const SizedBox(height: 18),

        // Reviews
        Text('Reviews', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 6),
        ..._buildReviews(product.reviews),
        const SizedBox(height: 24),
        // QR code (nếu có)
        Center(
          child: Image.network(product.meta.qrCode, width: 80, height: 80),
        ),
        const SizedBox(height: 16),
        // Button mua hàng (ví dụ)
        ElevatedButton(
          onPressed: () {},
          style:
              ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }

  _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  List<Widget> _buildReviews(List<Review> reviews) {
    if (reviews.isEmpty) {
      return [
        Text('No reviews yet', style: TextStyle(color: Colors.grey[600]))
      ];
    }
    return reviews.map<Widget>((review) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: CircleAvatar(child: Text(review.reviewerName.isNotEmpty ? review.reviewerName[0] : '?')),
          title: Row(
            children: [
              for (int i = 0; i < 5; i++)
                Icon(Icons.star,
                    size: 16,
                    color: i < review.rating ? Colors.amber : Colors.grey[300]),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(review.comment),
              Text(
                review.reviewerName,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                review.date.length >= 10 ? review.date.substring(0, 10) : review.date,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

}

/* class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Chỉ khi ấn mới gọi API
                ref.read(productDetailProvider.notifier).getDetailProduct(widget.id);
              },
              child: const Text('Load Product Detail'),
            ),
            const SizedBox(height: 20),
            // Chỉ widget này rebuild khi state đổi
            Consumer(
              builder: (context, ref, _) {
                final state = ref.watch(productDetailProvider);
                return state.when(
                  initial: () => const Text('Ấn nút để load sản phẩm'),
                  loading: () => const CircularProgressIndicator(),
                  failure: (exception) => Text('Error: ${exception.message}'),
                  success: (product) => buildListView(context, product),
                );
              },
            ),
            // Các widget khác bên dưới không bị ảnh hưởng
            // ...
          ],
        ),
      ),
    );
  }*/