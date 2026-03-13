import 'package:equatable/equatable.dart';

class LocalException implements Exception{
  final String message;
  const LocalException({required this.message});

}