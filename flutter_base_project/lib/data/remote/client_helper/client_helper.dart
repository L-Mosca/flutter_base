import 'package:flutter_base_project/data/dto/login/login_body_dto.dart';
import 'package:flutter_base_project/data/dto/login/login_response_dto.dart';
import 'package:flutter_base_project/data/dto/product/product_dto.dart';
import 'package:flutter_base_project/data/dto/user/user_dto.dart';

abstract interface class ClientHelper {
  Future<LoginResponseDto> login({required LoginBodyDto loginBody});
  Future<UserDto> getGenericUser();

  // Products
  Future<ProductDto?> getProductById({required int id});
  Future<List<ProductDto>> getAllProducts();
}
