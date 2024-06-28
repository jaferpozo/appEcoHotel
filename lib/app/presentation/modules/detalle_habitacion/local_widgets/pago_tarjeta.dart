import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:milicoreria/app/core/utils/responsiveUtil.dart';
import 'package:milicoreria/app/presentation/widgets/custom_widgets.dart';

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

          DateRangePickerDemo(),
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

  Widget desingTarjeta(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade800, Colors.blue.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Detalles de la Tarjeta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _cardNumberController,
                    decoration: InputDecoration(
                      labelText: 'Número de Tarjeta',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 19, // Formato XXXX XXXX XXXX XXXX
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.length != 19) {
                        return 'Ingrese un número de tarjeta válido';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _cardNumberController.text = _formatCardNumber(value);
                        _cardNumberController.selection = TextSelection.fromPosition(
                            TextPosition(offset: _cardNumberController.text.length));
                      });
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _cardHolderNameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre del Titular',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese el nombre del titular';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _expiryDateController,
                          decoration: InputDecoration(
                            labelText: 'Fecha Venc.',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 5, // Formato MM/YY
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.length != 5 || !_isValidExpiryDate(value)) {
                              return 'Fecha no válida';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _expiryDateController.text = _formatExpiryDate(value);
                              _expiryDateController.selection = TextSelection.fromPosition(
                                  TextPosition(offset: _expiryDateController.text.length));
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextFormField(
                          controller: _cvvController,
                          decoration: InputDecoration(
                            labelText: 'CVV',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.length != 3) {
                              return 'CVV no válido';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
        ),
      ),
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



class DateRangePickerDemo extends StatefulWidget {
  @override
  _DateRangePickerDemoState createState() => _DateRangePickerDemoState();
}

class _DateRangePickerDemoState extends State<DateRangePickerDemo> {
  DateTimeRange? _selectedDateRange;

  void _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: _selectedDateRange,
    );
    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        GestureDetector(
          onTap: () => _selectDateRange(context),

          child:  ContenedorDesingWidget(
            margin: EdgeInsets.symmetric(horizontal: 15),
          anchoPorce: 100,

          child:  Center(child: Text(
            style: TextStyle(color: Colors.black),
            _selectedDateRange == null
                ? 'Seleccione la Fecha'
                : 'Desde: ${dateFormat.format(_selectedDateRange!.start)}  Hasta: ${dateFormat.format(_selectedDateRange!.end)}',
          ),),),),

       SizedBox(height: 10,)
        ],
      ),
    );
  }
}