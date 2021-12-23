import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:astrotak/model/product_model.dart';
import 'package:astrotak/notifiers/product_notifier.dart';
import 'package:astrotak/router/app_router.dart';
import 'package:astrotak/services/locator.dart';
import 'package:astrotak/widgets/list_header.dart';

class NewProductPage extends StatefulWidget {
  const NewProductPage({Key? key, this.product, this.edit = false})
      : super(key: key);

  final bool edit;
  final Product? product;

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  bool nameValid = false;
  bool descValid = false;
  bool idValid = false;
  bool priceValid = false;
  bool dPriceValid = true;
  bool imageValid = false;
  bool categoryValid = false;
  bool quantityValid = false;
  bool stockValid = false;
  late final TextEditingController _nameController;
  late final TextEditingController _descController;
  late final TextEditingController _idController;
  late final TextEditingController _priceController;
  late final TextEditingController _discountedPriceController;
  late final TextEditingController _imageController;
  late final TextEditingController _categoryController;
  late final TextEditingController _quantityController;
  late final TextEditingController _stockController;
  final RegExp _quantityRegex =
      RegExp("^[0-9]+\$", multiLine: false, dotAll: true);
  final RegExp _urlRegex = RegExp(
    r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)",
    multiLine: true,
  );
  late QuantityType _quantityType;
  late QuantityType _stockType;

  @override
  void initState() {
    super.initState();
    if (widget.edit) {
      nameValid = true;
      descValid = true;
      idValid = true;
      priceValid = true;
      dPriceValid = true;
      imageValid = true;
      categoryValid = true;
      quantityValid = true;
      stockValid = true;
    }
    _nameController =
        TextEditingController(text: widget.edit ? widget.product?.name : "");
    _descController = TextEditingController(
        text: widget.edit ? widget.product?.description : "");
    _idController =
        TextEditingController(text: widget.edit ? widget.product?.id : "");
    _priceController = TextEditingController(
        text: widget.edit ? widget.product?.price.toString() : "");
    _discountedPriceController = TextEditingController(
        text: widget.edit ? widget.product?.discountedPrice.toString() : "");
    _imageController = TextEditingController(
        text: widget.edit ? widget.product?.imageUrl : "");
    _categoryController = TextEditingController(
        text: widget.edit ? widget.product?.category : "");
    _quantityController = TextEditingController(
        text: widget.edit ? widget.product?.quantity.toInt().toString() : "");
    _stockController = TextEditingController(
        text: widget.edit ? widget.product?.stockUnits.toInt().toString() : "");
    _quantityType =
        (widget.edit ? widget.product?.quantityType : QuantityType.kilograms)!;
    _stockType =
        (widget.edit ? widget.product?.stockUnitType : QuantityType.kilograms)!;
  }

  @override
  Widget build(BuildContext context) {
    final darkAppBarContents =
        Theme.of(context).scaffoldBackgroundColor.computeLuminance() > 0.5;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness:
                  darkAppBarContents ? Brightness.dark : Brightness.light),
          title: Text(
            widget.edit ? 'Edit Product' : 'New Product',
            style: TextStyle(
              color: darkAppBarContents
                  ? Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor
                  : Theme.of(context).appBarTheme.titleTextStyle?.color,
            ),
          ),
          actions: [
            IconButton(
              onPressed: (nameValid &&
                      descValid &&
                      idValid &&
                      priceValid &&
                      dPriceValid &&
                      imageValid &&
                      categoryValid &&
                      quantityValid &&
                      stockValid)
                  ? () {
                      locator<AppRouter>().pop();
                      if (widget.edit) {
                        final Product _finalProduct = Product(
                          id: _idController.text,
                          name: _nameController.text,
                          description: _descController.text,
                          price: _priceController.text,
                          discountedPrice: _discountedPriceController.text != ""
                              ? _discountedPriceController.text
                              : _priceController.text,
                          imageUrl: _imageController.text,
                          category: _categoryController.text,
                          quantity: double.parse(_quantityController.text),
                          quantityType: _quantityType,
                          stockUnits: double.parse(_stockController.text),
                          stockUnitType: _stockType,
                          isAvailable: true,
                        );
                        locator<ProductNotifier>().updateProduct(
                          _finalProduct,
                        );
                        if (_finalProduct.stockUnits !=
                                widget.product?.stockUnits ||
                            _finalProduct.stockUnitType !=
                                widget.product?.stockUnitType) {
                          // locator<TransactionNotifier>().addTransaction(
                          //     Transaction(
                          //         product: _finalProduct,
                          //         time: DateTime.now(),
                          //         stockUnits:
                          //             double.parse(_stockController.text),
                          //         stockUnitsType: _stockType));
                        }
                      } else {
                        final Product _finalProduct = Product(
                          id: _idController.text,
                          name: _nameController.text,
                          description: _descController.text,
                          price: _priceController.text,
                          discountedPrice: _discountedPriceController.text != ""
                              ? _discountedPriceController.text
                              : _priceController.text,
                          imageUrl: _imageController.text,
                          category: _categoryController.text,
                          quantity: double.parse(_quantityController.text),
                          quantityType: _quantityType,
                          stockUnits: double.parse(_stockController.text),
                          stockUnitType: _stockType,
                          isAvailable: true,
                        );
                        locator<ProductNotifier>().addProduct(
                          _finalProduct,
                        );
                        // locator<TransactionNotifier>().addTransaction(
                        //     Transaction(
                        //         product: _finalProduct,
                        //         time: DateTime.now(),
                        //         stockUnits: double.parse(_stockController.text),
                        //         stockUnitsType: _stockType));
                      }
                    }
                  : null,
              icon: const Icon(Icons.check),
              color: darkAppBarContents
                  ? Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor
                  : Theme.of(context).appBarTheme.titleTextStyle?.color,
            ),
          ],
        ),
        body: ListView(
          children: [
            const ListHeader(
              title: "NAME",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  if (text != "") {
                    setState(() {
                      nameValid = true;
                    });
                  } else {
                    setState(() {
                      nameValid = false;
                    });
                  }
                },
                controller: _nameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(
                    nameValid ? Icons.check : Icons.close,
                    color: nameValid ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            const ListHeader(
              title: "DESCRIPTION",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  if (text != "") {
                    setState(() {
                      descValid = true;
                    });
                  } else {
                    setState(() {
                      descValid = false;
                    });
                  }
                },
                controller: _descController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(
                    descValid ? Icons.check : Icons.close,
                    color: descValid ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            const ListHeader(
              title: "ID",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  if (text != "") {
                    setState(() {
                      idValid = true;
                    });
                  } else {
                    setState(() {
                      idValid = false;
                    });
                  }
                },
                controller: _idController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(
                    idValid ? Icons.check : Icons.close,
                    color: idValid ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.characters,
              ),
            ),
            const ListHeader(
              title: "PRICE (in ₹)",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  if (text != "" && _quantityRegex.hasMatch(text)) {
                    setState(() {
                      priceValid = true;
                    });
                  } else {
                    setState(() {
                      priceValid = false;
                    });
                  }
                },
                controller: _priceController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(
                    priceValid ? Icons.check : Icons.close,
                    color: priceValid ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ),
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            const ListHeader(
              title: "DISCOUNTED PRICE (in ₹) (leave for same as price)",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  if (text != "" && _quantityRegex.hasMatch(text)) {
                    setState(() {
                      dPriceValid = true;
                    });
                  } else if (text == "") {
                    setState(() {
                      dPriceValid = true;
                    });
                  } else {
                    setState(() {
                      dPriceValid = false;
                    });
                  }
                },
                controller: _discountedPriceController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(
                    dPriceValid ? Icons.check : Icons.close,
                    color: dPriceValid ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ),
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            const ListHeader(
              title: "IMAGE URL",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  if (text != "" && _urlRegex.hasMatch(text)) {
                    setState(() {
                      imageValid = true;
                    });
                  } else {
                    setState(() {
                      imageValid = false;
                    });
                  }
                },
                controller: _imageController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(
                    imageValid ? Icons.check : Icons.close,
                    color: imageValid ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            _urlRegex.hasMatch(_imageController.text)
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black.withOpacity(0.12)
                                    : Colors.white.withOpacity(0.12),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(14),
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width - 32,
                            height: (MediaQuery.of(context).size.width - 32) *
                                9 /
                                16,
                            child: CachedNetworkImage(
                              imageUrl: _imageController.text,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ))
                : Container(),
            const ListHeader(
              title: "CATEGORY",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  if (text != "") {
                    setState(() {
                      categoryValid = true;
                    });
                  } else {
                    setState(() {
                      categoryValid = false;
                    });
                  }
                },
                controller: _categoryController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(
                    categoryValid ? Icons.check : Icons.close,
                    color: categoryValid ? Colors.green : Colors.red,
                    size: 24,
                  ),
                ),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            const ListHeader(
              title: "QUANTITY",
            ),
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
                            quantityValid = true;
                          });
                        } else {
                          setState(() {
                            quantityValid = false;
                          });
                        }
                      },
                      controller: _quantityController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: Icon(
                          quantityValid ? Icons.check : Icons.close,
                          color: quantityValid ? Colors.green : Colors.red,
                          size: 24,
                        ),
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
            const ListHeader(
              title: "STOCK QUANTITY",
            ),
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
                            stockValid = true;
                          });
                        } else {
                          setState(() {
                            stockValid = false;
                          });
                        }
                      },
                      controller: _stockController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: Icon(
                          stockValid ? Icons.check : Icons.close,
                          color: stockValid ? Colors.green : Colors.red,
                          size: 24,
                        ),
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
                          _stockType = value!;
                        });
                      },
                      isDense: true,
                      value: _stockType,
                      isExpanded: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
