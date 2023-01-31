import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:peacky_cactus_shop/bloc/payment_page/payment_page_cubit.dart';
import 'package:peacky_cactus_shop/config/router/paecky_cactus_shop_router.dart';
import 'package:peacky_cactus_shop/utils/toasts.dart';
import 'package:peacky_cactus_shop/view/payment_button.dart';

import '../../config/di/injection_container.dart';

enum _PaymentPageField {
  card,
  cardExpMonth,
  cardExpYear,
  cardHolderName,
  cardCvv,
  phone,
}

class PaymentPage extends StatefulWidget implements AutoRouteWrapper {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<PaymentPageCubit>(),
      child: this,
    );
  }
}

class _PaymentPageState extends State<PaymentPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  PaymentPageCubit get cubit => context.read();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: BlocConsumer<PaymentPageCubit, PaymentPageState>(
        listener: (context, state) {
          if (state.status == PaymentPageStatus.completed) {
            router.pop();
            Toasts.of(context).showSuccess(message: 'Payment successful');
          }
          if (state.status == PaymentPageStatus.error) {
            Toasts.of(context).showError(
              message: state.errorMessage,
            );
          }
        },
        builder: (context, state) {
          return _buildSuccessBody(state);
        },
      ),
    );
  }

  Widget _buildSuccessBody(PaymentPageState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            children: [
              _buildCreditCard(),
              const SizedBox(height: 16),
              _buildCreditCardField(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildMonthField()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildYearField()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildCvvField())
                ],
              ),
              const SizedBox(height: 16),
              _buildPhoneField(),
              const SizedBox(height: 16),
              _buildCardHolderNameField(),
              const SizedBox(height: 16),
              SafeArea(child: _buildPaymentButton(state)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentButton(PaymentPageState state) {
    return PaymentButton(
      isLoading: state.status == PaymentPageStatus.loading,
      onPressed: () {
        if (_fbState?.saveAndValidate() ?? false) {
          cubit.pay(
            phone: _fbValues[_PaymentPageField.phone.name],
            card: _fbValues[_PaymentPageField.card.name],
            cardExpMonth: _fbValues[_PaymentPageField.cardExpMonth.name],
            cardExpYear: _fbValues[_PaymentPageField.cardExpYear.name],
            cardCvv: _fbValues[_PaymentPageField.cardCvv.name],
            cardHolderName: _fbValues[_PaymentPageField.cardHolderName.name],
          );
        }
      },
    );
  }

  Widget _buildCardHolderNameField() {
    return FormBuilderTextField(
      name: _PaymentPageField.cardHolderName.name,
      decoration: const InputDecoration(labelText: 'Card Holder Name'),
      validator: FormBuilderValidators.required(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildPhoneField() {
    return FormBuilderTextField(
      name: _PaymentPageField.phone.name,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Phone', prefixText: '+38'),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      validator: FormBuilderValidators.required(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildYearField() {
    return FormBuilderDropdown(
      name: _PaymentPageField.cardExpYear.name,
      decoration: const InputDecoration(labelText: 'Year'),
      validator: FormBuilderValidators.required(),
      items: [
        '22',
        '23',
        '24',
        '25',
        '26',
        '27',
        '28',
      ].map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildMonthField() {
    return FormBuilderDropdown(
      name: _PaymentPageField.cardExpMonth.name,
      decoration: const InputDecoration(labelText: 'Month'),
      validator: FormBuilderValidators.required(),
      items: [
        '01',
        '02',
        '03',
        '04',
        '05',
        '06',
        '07',
        '08',
        '09',
        '10',
        '11',
        '12',
      ].map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildCreditCardField() {
    return FormBuilderTextField(
      name: _PaymentPageField.card.name,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Credit card'),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
      ],
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(),
          FormBuilderValidators.creditCard(),
        ],
      ),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildCvvField() {
    return FormBuilderTextField(
      name: _PaymentPageField.cardCvv.name,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'CVV'),
      inputFormatters: [
        LengthLimitingTextInputFormatter(3),
      ],
      validator: FormBuilderValidators.required(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildCreditCard() {
    final cardNumber = _fbValues[_PaymentPageField.card.name] ?? '';
    final String cardExpMonth =
        _fbValues[_PaymentPageField.cardExpMonth.name] ?? '';
    final String cardExpYear =
        _fbValues[_PaymentPageField.cardExpYear.name] ?? '';
    final cardHolderName =
        _fbValues[_PaymentPageField.cardHolderName.name] ?? '';
    final cvvCode = _fbValues[_PaymentPageField.cardCvv] ?? '';
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: cardExpMonth.isNotEmpty && cardExpYear.isNotEmpty
          ? '$cardExpMonth/$cardExpYear'
          : '',
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: false,
      obscureCardCvv: false,
      obscureCardNumber: false,
      isHolderNameVisible: true,
      cardType: CardType.mastercard,
      onCreditCardWidgetChange: (creditCardBrand) {},
    );
  }
}
