import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCardForm extends StatefulWidget {
  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cardHolderNameController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cardHolderNameController.dispose();
    super.dispose();
  }

  String _formatCardNumber(String input) {
    String cleaned = input.replaceAll(RegExp(r'\D'), '');
    List<String> parts = [];
    for (int i = 0; i < cleaned.length; i += 4) {
      parts.add(cleaned.substring(
          i, i + 4 <= cleaned.length ? i + 4 : cleaned.length));
    }
    return parts.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        CreditCard(
          cardNumber: _formatCardNumber(_cardNumberController.text),
          expiryDate: _expiryDateController.text,
          cardHolderName: _cardHolderNameController.text,
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _cardNumberController,
            decoration: InputDecoration(
              labelText: 'Número de la tarjeta',
              filled: true,
              fillColor: Colors.white,

            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
            ],
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _expiryDateController,
            decoration: InputDecoration(labelText: 'EXPIRA (MM/YY)',          filled: true,
              fillColor: Colors.white,),
            keyboardType: TextInputType.datetime,
            maxLength: 5,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _cardHolderNameController,
            decoration: InputDecoration(labelText: 'Nombre',          filled: true,
              fillColor: Colors.white,),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 20),

      ],
    );
  }
}

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;

  CreditCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Colors.blueGrey[900]!, Colors.blueGrey[800]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TARJETA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.tab_rounded,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.pin_end,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              cardNumber.isEmpty ? 'XXXX XXXX XXXX XXXX' : cardNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'EXPIRA: ',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
                Text(
                  expiryDate.isEmpty ? 'MM/YY' : expiryDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              cardHolderName.isEmpty ? 'NOMBRE' : cardHolderName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
