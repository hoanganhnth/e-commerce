import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_category_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../routes/routes.dart';

class TDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sport', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelery', image: TImages.jeweleryIcon, isFeatured: true),

    CategoryModel(id: '8', name: 'Sport shoes', parentId:'1',image: TImages.sportIcon, isFeatured: false),
    CategoryModel(id: '9', name: 'Track suits', parentId:'3', image: TImages.sportIcon, isFeatured: false),
    CategoryModel(id: '10', name: 'Sports Equipment', parentId:'1', image: TImages.jeweleryIcon, isFeatured: false),
    CategoryModel(id: '11', name: 'Bedroom Furniture', parentId:'5', image: TImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '12', name: 'Kitchen Furniture', parentId:'5', image: TImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '13', name: 'Office Furniture', parentId:'5', image: TImages.furnitureIcon, isFeatured: false),

    CategoryModel(id: '14', name: 'Laptop', parentId:'2', image: TImages.electronicsIcon, isFeatured: false),
    CategoryModel(id: '15', name: 'Mobile', parentId:'2', image: TImages.electronicsIcon, isFeatured: false),

    CategoryModel(id: '16', name: 'Shirts', parentId:'3', image: TImages.clothIcon, isFeatured: false),
  ];

  static final List<BannerModel> banners = [
    BannerModel(active: false, imageUrl: TImages.banner1, targetScreen: TRoutes.order),
    BannerModel(active: true, imageUrl: TImages.banner2, targetScreen: TRoutes.cart),
    BannerModel(active: true, imageUrl: TImages.banner3, targetScreen: TRoutes.favorites),
    BannerModel(active: true, imageUrl: TImages.banner4, targetScreen: TRoutes.search),
    BannerModel(active: true, imageUrl: TImages.banner5, targetScreen: TRoutes.setting),
    BannerModel(active: true, imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress),
    BannerModel(active: false, imageUrl: TImages.banner8, targetScreen: TRoutes.checkout),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike sports shoe',
        stock: 15,
        price: 135,
        thumbnail: TImages.productImage1,
        description: 'Green Nike sport shoe',
        brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
        images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '10',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage1,
              description: 'This is a Product description for Green Nike sports shoes',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 123,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage1,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),

        ],
        productType: 'ProductType.variable'),

    ProductModel(
        id: '002',
        title: 'Blue T-Shirt for all ages',
        stock: 15,
        price: 35,
        thumbnail: TImages.productImage69,
        description: 'This is description for Blue Nike Sleeve less vest.',
        brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
        images: [TImages.productImage68, TImages.productImage69, TImages.productImage5],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
        ],
        productType: 'ProductType.single'),

    ProductModel(
        id: '004',
        title: '4 Color collar t-shirt dry fit',
        stock: 15,
        price: 135,
        isFeatured: false,
        thumbnail: TImages.productImage60,
        description: 'Description for 4 color collar t-shirt dry hit',
        brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
        images: [TImages.productImage60, TImages.productImage61, TImages.productImage62, TImages.productImage63],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '10',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green','Black','Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage1,
              description: 'This is a Product description for Green Nike sports shoes',
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 123,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage1,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),

        ],
        productType: 'ProductType.variable'),

    ProductModel(
        id: '005',
        title: 'Nike Air Jordan Shoes',
        stock: 15,
        price: 135,
        isFeatured: false,
        thumbnail: TImages.productImage10,
        description: 'Description for Nike Air Jordan Shoes',
        brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
        images: [TImages.productImage7, TImages.productImage8, TImages.productImage9, TImages.productImage10],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Orange','Black' ,'Brown']),
          ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage1,
              description: 'This is a Product description for Green Nike sports shoes',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 123,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage1,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),

        ],
        productType: 'ProductType.variable'),
  ];

  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA', productsCount: 12, isFeatured: true),
    BrandModel(id: '2', name: 'Jordan', image: TImages.jordanLogo, productsCount: 12, isFeatured: true),
    BrandModel(id: '3', name: 'Puma', image: TImages.pumaLogo, productsCount: 12, isFeatured: true),
    BrandModel(id: '4', name: 'Adidas', image: TImages.adidasLogo, productsCount: 12, isFeatured: false),
    BrandModel(id: '5', name: 'Apple', image: TImages.appleLogo, productsCount: 12, isFeatured: false),
    BrandModel(id: '7', name: 'Kenwood', image: TImages.kenwoodLogo, productsCount: 12, isFeatured: false),
    BrandModel(id: '8', name: 'HermanMiller', image: TImages.hermanMillerLogo, productsCount: 12, isFeatured: false),
    BrandModel(id: '9', name: 'Ikea', image: TImages.ikeaLogo, productsCount: 12, isFeatured: false),
    BrandModel(id: '10', name: 'Acer', image: TImages.acerlogo, productsCount: 12, isFeatured: false),

  ];

  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '6', categoryId: '1'),
    BrandCategoryModel(brandId: '6', categoryId: '2'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '1', categoryId: '4'),
    BrandCategoryModel(brandId: '6', categoryId: '5'),
    BrandCategoryModel(brandId: '1', categoryId: '6'),
    BrandCategoryModel(brandId: '6', categoryId: '7'),
  ];


}