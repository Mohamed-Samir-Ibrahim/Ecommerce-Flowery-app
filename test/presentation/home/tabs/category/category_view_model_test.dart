import 'package:flowery/domain/use_case/category_use_case/category_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/category_product_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/get_all_product_use_case.dart';
import 'package:flowery/domain/use_case/home_use_case/home_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowery/presentation/home/tabs/category/category_view_model.dart';
import 'package:flowery/presentation/home/tabs/category/category_states.dart';
import 'package:flowery/data/model/home_model/product_by_occasion.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockHomeUseCase extends Mock implements HomeUseCase {}
class MockCategoryUseCase extends Mock implements CategoryUseCase {}
class MockCategoryProductUseCase extends Mock implements CategoryProductUseCase {}
class MockGetAllProductUseCase extends Mock implements GetAllProductUseCase {}

void main() {
  late CategoryViewModel viewModel;
  late MockHomeUseCase mockHomeUseCase;
  late MockCategoryUseCase mockCategoryUseCase;
  late MockCategoryProductUseCase mockCategoryProductUseCase;
  late MockGetAllProductUseCase mockGetAllProductUseCase;

  // Mock products
  final mockProducts = ProductByOccasion(products: [
    ProductsBean(id: "1", title: "Rose", price: 100, priceAfterDiscount: 80, discount: 20, createdAt: "2024-01-01"),
    ProductsBean(id: "2", title: "Lily", price: 150, priceAfterDiscount: 150, discount: 0, createdAt: "2023-01-01"),
    ProductsBean(id: "3", title: "Tulip", price: 200, priceAfterDiscount: 300, discount: 10, createdAt: "2022-01-01"),
  ]);

  setUp(() {
    mockHomeUseCase = MockHomeUseCase();
    mockCategoryUseCase = MockCategoryUseCase();
    mockCategoryProductUseCase = MockCategoryProductUseCase();
    mockGetAllProductUseCase = MockGetAllProductUseCase();

    viewModel = CategoryViewModel(
      mockHomeUseCase,
      mockCategoryUseCase,
      mockCategoryProductUseCase,
      mockGetAllProductUseCase,
    );

    // Initialize state
    viewModel.emit(
      viewModel.state.copyWith(
        products: mockProducts,
        filteredProducts: mockProducts.products, // Initialize filteredProducts
        status: CategoryStatus.success,
      ),
    );
  });

  test('search filters products by title correctly', () async {
    viewModel.doIntent(SearchIntent(query: 'Rose'));

    final result = viewModel.state.filteredProducts;
    expect(result?.length, 1);
    expect(result?.first.title, 'Rose');
  });

  test('filter by price range includes correct products', () async {
    viewModel.doIntent(FilterProductsIntent(minPrice: 100, maxPrice: 200));

    final result = viewModel.state.filteredProducts ?? [];
    print(result);
    expect(result.length, 1); // Only Lily (150) is in range
    expect(result.any((p) => p.title == 'Rose'), false);
    expect(result.any((p) => p.title == 'Lily'), true);
    expect(result.any((p) => p.title == 'Tulip'), false);
  });

  test('filter by discount sorts correctly', () async {
    viewModel.doIntent(FilterProductsIntent(minPrice: 0, maxPrice: 300, sortBy: 'discount'));

    final result = viewModel.state.filteredProducts ?? [];
    expect(result.length, 3); // All products in range (0-300)
    expect(result[0].discount, 20); // Rose (highest discount)
    expect(result[1].discount, 10); // Tulip
    expect(result[2].discount, 0); // Lily (lowest discount)
  });
}