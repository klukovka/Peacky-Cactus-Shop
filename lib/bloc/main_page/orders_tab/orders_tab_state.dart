part of 'orders_tab_cubit.dart';

enum OrdersTabStatus {
  loading,
  error,
  completed,
}

class OrdersTabState extends Equatable {
  final OrdersTabStatus status;
  final List<Order> orders;
  final String errorMessage;

  const OrdersTabState({
    required this.status,
    this.orders = const [],
    this.errorMessage = '',
  });

  OrdersTabState copyWith({
    OrdersTabStatus? status,
    List<Order>? orders,
    String? errorMessage,
  }) {
    return OrdersTabState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, orders, errorMessage];
}
