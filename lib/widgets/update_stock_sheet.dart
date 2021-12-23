import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:astrotak/model/product_model.dart';
import 'package:astrotak/router/app_router.dart';
import 'package:astrotak/services/locator.dart';
import 'package:astrotak/widgets/bottom_sheet.dart';

class UpdateStockSheet extends StatefulWidget {
  const UpdateStockSheet({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<UpdateStockSheet> createState() => _UpdateStockSheetState();
}

class _UpdateStockSheetState extends State<UpdateStockSheet> {
  late DateTime createdAt;
  final DateFormat formatter = DateFormat('E, MMMM d, yyyy\nh:mm a');
  bool valid = false;
  late final TextEditingController _quantityController;
  final RegExp _quantityRegex =
      RegExp("^[0-9]+\$", multiLine: false, dotAll: true);
  late QuantityType _quantityType;

  @override
  void initState() {
    super.initState();
    createdAt = DateTime.now();
    _quantityController = TextEditingController(
        text: widget.product.stockUnits.toInt().toString());
    _quantityType = widget.product.stockUnitType;
    valid = _quantityController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BottomDialog(
      title: "Update Stock",
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: Text(formatter.format(createdAt)),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        createdAt = value;
                      });
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value2) {
                        if (value2 != null) {
                          setState(() {
                            createdAt = DateTime(
                                createdAt.year,
                                createdAt.month,
                                createdAt.day,
                                value2.hour,
                                value2.minute);
                          });
                        }
                      });
                    }
                  });
                },
                trailing: const Icon(Icons.calendar_today)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (text) {
                        if (text != "" && _quantityRegex.hasMatch(text)) {
                          setState(() {
                            valid = true;
                          });
                        } else {
                          setState(() {
                            valid = false;
                          });
                        }
                      },
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.sentences,
                      maxLength: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                    child: DropdownButton<QuantityType>(
                      items: QuantityType.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.toString().split('.').last),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _quantityType = value!;
                        });
                      },
                      isDense: true,
                      value: _quantityType,
                      isExpanded: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      disabled: !valid,
      actions: [
        {
          'text': 'Done',
          'onPressed': valid
              ? () {
                  locator<AppRouter>().pop(context);
                  final Product _finalProduct = Product(
                    id: widget.product.id,
                    name: widget.product.name,
                    description: widget.product.description,
                    imageUrl: widget.product.imageUrl,
                    category: widget.product.category,
                    price: widget.product.price,
                    discountedPrice: widget.product.discountedPrice,
                    quantity: widget.product.quantity,
                    quantityType: widget.product.quantityType,
                    stockUnits: double.parse(_quantityController.text),
                    stockUnitType: _quantityType,
                    isAvailable: widget.product.isAvailable,
                  );
                  // locator<ProductNotifier>().updateProduct(_finalProduct);
                  if (_finalProduct.stockUnits != widget.product.stockUnits ||
                      _finalProduct.stockUnitType !=
                          widget.product.stockUnitType) {
                    // locator<TransactionNotifier>().addTransaction(Transaction(
                    //     product: _finalProduct,
                    //     time: DateTime.now(),
                    //     stockUnits: double.parse(_quantityController.text),
                    //     stockUnitsType: _quantityType));
                  }
                }
              : null,
        },
      ],
    );
  }
}
