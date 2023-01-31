part of 'payment_page_cubit.dart';

enum PaymentPageStatus {
  idle,
  loading,
  error,
  completed,
}

class PaymentPageState extends Equatable {
  final PaymentPageStatus status;
  final String errorMessage;

  const PaymentPageState({
    required this.status,
    this.errorMessage = '',
  });

  PaymentPageState copyWith({
    PaymentPageStatus? status,
    String? errorMessage,
  }) {
    return PaymentPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, errorMessage];
}
