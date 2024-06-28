import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milicoreria/app/core/utils/responsiveUtil.dart';

class PagoConTarjetaPage extends StatefulWidget {
  @override
  _PagoConTarjetaPageState createState() => _PagoConTarjetaPageState();
}

class _PagoConTarjetaPageState extends State<PagoConTarjetaPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final responsive=ResponsiveUtil();
    return Form(
      key: _formKey,
      child: Container(height: responsive.altoP(50),child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _cardNumberController,
            decoration: InputDecoration(labelText: 'Número de Tarjeta'),
            keyboardType: TextInputType.number,
            maxLength: 19, // Formato XXXX XXXX XXXX XXXX
            validator: (value) {
              if (value==null || value.length != 19) {
                return 'Ingrese un número de tarjeta válido';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _cardNumberController.text = _formatCardNumber(value);
                _cardNumberController.selection = TextSelection.fromPosition(TextPosition(offset: _cardNumberController.text.length));
              });
            },
          ),
          TextFormField(
            controller: _cardHolderNameController,
            decoration: InputDecoration(labelText: 'Nombre del Titular'),
            validator: (value) {
              if (value==null) {
                return 'Ingrese el nombre del titular';
              }
              return null;
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: _expiryDateController,
                  decoration: InputDecoration(labelText: 'Fecha Venc.'),
                  keyboardType: TextInputType.number,
                  maxLength: 5, // Formato MM/YY
                  validator: (value) {
                    if (value==null || value.length != 5 || !_isValidExpiryDate(value)) {
                      return 'Fecha no válida';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _expiryDateController.text = _formatExpiryDate(value);
                      _expiryDateController.selection = TextSelection.fromPosition(TextPosition(offset: _expiryDateController.text.length));
                    });
                  },
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: TextFormField(
                  controller: _cvvController,
                  decoration: InputDecoration(labelText: 'CVV'),
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  validator: (value) {
                    if (value==null || value.length != 3) {
                      return 'CVV no válido';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Procesar el pago
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Procesando pago...')),
                );
              }
            },
            child: Text('Pagar'),
          ),
        ],
      ),),
    );
  }

  String _formatCardNumber(String input) {
    // Remover espacios previos y dividir cada 4 dígitos
    return input.replaceAll(RegExp(r'\D'), '').replaceAllMapped(RegExp(r'.{4}'), (match) => '${match.group(0)} ').trim();
  }

  String _formatExpiryDate(String input) {
    // Remover caracteres no numéricos y agregar barra diagonal después de 2 dígitos
    return input.replaceAll(RegExp(r'\D'), '').replaceAllMapped(RegExp(r'^(\d{2})(\d{2})'), (match) => '${match.group(1)}/${match.group(2)}').substring(0, 5);
  }

  bool _isValidExpiryDate(String input) {
    // Validar formato MM/YY
    if (input.length != 5 || input[2] != '/') return false;
    final month = int.tryParse(input.substring(0, 2));
    final year = int.tryParse(input.substring(3, 5));
    if (month == null || year == null) return false;
    if (month < 1 || month > 12) return false;
    // Validar que la fecha no sea en el pasado (simplificado)
    final now = DateTime.now();
    final fourDigitYear = 2000 + year;
    if (fourDigitYear < now.year || (fourDigitYear == now.year && month < now.month)) return false;
    return true;
  }
}