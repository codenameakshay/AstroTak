<h1 align="center" style="border-bottom: none">
    <b>
        <p>astrotak Submission</p><br>
    </b>
    🦾 A product/inventory management app. 🦾 <br>
</h1>

<p align="center">
<a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-v2.5.1-blue?logo=flutter"></a>
<a href="https://github.com/codenameakshay/product-IO"><img src="https://img.shields.io/github/stars/codenameakshay/product-IO.svg?style=flat&logo=github&colorB=deeppink&label=stars"></a>
<a href="https://github.com/codenameakshay/product-IO"><img src="https://img.shields.io/github/v/release/codenameakshay/product-IO.svg"></a>
<a href="https://github.com/codenameakshay/product-IO"><img src="https://img.shields.io/github/license/codenameakshay/product-IO.svg" alt="License: AGPL"></a>

</p>

<p align="center">
This is a basic inventory management app made from Flutter, which uses minimum packages.
</p>




## Screenshots

| Products Page 	| Update Stock 	| New Product Page 	| Edit Product Page 	| Inventory Page 	|
|--------------	|--------------	|--------------	|--------------	|--------------	|
|  ![Products Page](screenshots/2.jpg) | ![Update Stock](screenshots/5.jpg) 	| ![New Product Page](screenshots/7.jpg)  	| ![Edit Product Page](screenshots/8.jpg)   	|  ![Inventory Page](screenshots/10.jpg) 	|

| Expanded Product Card 	| Expanded Product Card 	| Date Picker 	| Date Filter 	| Expanded Record Card 	|
|--------------	|--------------	|--------------	|--------------	|--------------	|
|  ![Expanded Product Card](screenshots/3.jpg) | ![Expanded Product Card](screenshots/4.jpg) 	| ![Date Picker](screenshots/6.jpg)  	| ![Date Filter](screenshots/12.jpg)   	|  ![Expanded Record Card](screenshots/13.jpg) 	|
||||||
| Product Search 	| Record Search 	| 	| 	| |
|  ![Product Search](screenshots/14.jpg) | ![Record Search](screenshots/1.jpg) 	| | | |

## Built With

* [Flutter](https://flutter.dev/)
* [Dart](https://dart.dev/)

## Getting Started

To build on MacOS or Windows, please follow these simple steps.

**Step 1:**

```shell
git clone https://github.com/codenameakshay/product-IO.git
```

**Step 2:**

Follow the instructions [here](https://developer.android.com/studio) to install Android Studio. Then you're ready to build the app.

For testing the app you can create an emulator following the steps [here](https://developer.android.com/studio/run/emulator), or directly run on a physical Android device.

**Step 3:**

Follow the instructions [here](https://flutter.dev/docs/get-started/install) to install Flutter. As Odin uses the `stable` channel, you need to switch the channel if you are on `dev` or `beta` channels. Just type:

```shell
flutter channel stable
```

**Step 4:**

You should generate the necessary code first.
```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

**Step 5:**

To run the app just type these commands in terminal or use the Run and Debug option from your editor of choice.
```shell
flutter pub get
flutter run
```

## Code Walkthrough

### Folder Structure

The folder structure is explained below.

```
lib (All flutter code in present here)
 ┃
 ┣ constants (Various constant values used throughout the app)
 ┃
 ┣ controller (All the controllers used in the app)
 ┃
 ┣ model (All the models used in the app)
 ┃
 ┣ notifiers (Classes extending ChangeNotifier)
 ┃
 ┣ pages (All the UI pages in the app)
 ┃
 ┣ router (All the routes used in the app)
 ┃
 ┣ services (All the services used in the app)
 ┃
 ┗ widgets (All the widgets used in the app)
 ```

```
lib
 ┃
 ┣ constants
 ┃ ┣ app_color.dart (App color constants)
 ┃ ┣ app_data.dart (App data constants such as device size)
 ┃ ┗ demo_products.dart (Demo product, and stock records)
 ┃
 ┣ controller
 ┃ ┗ theme_controller.dart (Theme controller)
 ┃
 ┣ model
 ┃ ┣ filter_enum.dart (Enum for filtering on the basis of date)
 ┃ ┣ product_model.dart (Product model)
 ┃ ┣ product_model.g.dart (Generated file)
 ┃ ┣ transaction_model.dart (Transaction i.e. Stock record model)
 ┃ ┗ transaction_model.g.dart (Generated file)
 ┃
 ┣ notifiers
 ┃ ┣ product_notifier.dart (Product Notifier)
 ┃ ┗ transaction_notifier.dart (Stock Record Notifier)
 ┃
 ┣ pages
 ┃ ┣ home_page.dart (The default home page, which consist bottom tab bar, and top app bar)
 ┃ ┣ inventory_page.dart (The 2nd tab page which shows all stock records)
 ┃ ┣ loading_page.dart (A loading page is shown for data loading)
 ┃ ┣ new_product_page.dart (New product page/Edit product page, to add/edit a product)
 ┃ ┗ products_page.dart (The 1st tab which shows all products in a list)
 ┃
 ┣ router
 ┃ ┣ app_router.dart (Define routes inside the app)
 ┃ ┣ app_router.gr.dart (Generated file)
 ┃ ┣ route_observer.dart (Define route observer to get current route stack, and debug)
 ┃ ┗ transition_route_builders.dart (Animations which happen on route transition)
 ┃
 ┣ services
 ┃ ┣ locator.dart (Service locator, using get_it package to register notifiers and services)
 ┃ ┣ logger.dart (Logger service, which logs errors, infos or any warnings)
 ┃ ┣ product_service.dart (Product service, which handles all product related operations like fetching them)
 ┃ ┣ theme_pref_service.dart (Theme preference service, which handles the theme preference, and change theme)
 ┃ ┣ theme_service.dart (Theme service, which handles the theme, and change theme)
 ┃ ┗ transaction_service.dart (Transaction service, which handles all stock record related operations like fetching, updating them)
 ┃
 ┣ widgets
 ┃ ┣ bottom_sheet.dart (Bottom sheet is used throughout the app instead of dialogs for better accessibility)
 ┃ ┣ list_header.dart (List title widget which is shown in new products page)
 ┃ ┣ product_card.dart (Product card widget, which is shown in products page)
 ┃ ┣ transaction_card.dart (Transaction card widget, which is shown in inventory page)
 ┃ ┗ update_stock_sheet.dart (Update stock sheet widget)
 ┃
 ┣ generated_plugin_registrant.dart (Generated file for plugins)
 ┗ main.dart (Main file, which is the entry point of the app, used for registering theme, providers, routes, etc.)
 ```

### Packages Used

All the different packages used throughout the app, with thier explanations.
- `animations: ^2.0.2` - Used for animations during page/route transitions
- `auto_route: ^3.1.3` - Used to generate routes automatically
- `cached_network_image: ^3.2.0` - Used to load images from the internet
- `flex_color_scheme: ^4.1.1` - Used for theming
- `get_it: ^7.2.0` - Used for state management
- `google_fonts: ^2.1.0` - Used for Rubik font
- `intl: ^0.17.0` - Used to format date and time
- `json_annotation: ^4.4.0` - Used to generate models
- `json_serializable: ^6.1.1` - Used to serialize models
- `logger: ^1.1.0` - Used to log errors, info or warnings
- `provider: ^6.0.1` - Used for state management
- `rxdart: ^0.27.3` - Used to create streams
- `shared_preferences: ^2.0.9` - Used to save theme preference
- `sprung: ^3.0.0` - Usedd for dampening the animations

Dev dependencies -
- `auto_route_generator: ^3.1.0` - Used for generating routes
- `build_runner: ^2.1.5` - Used to generate necessary code
## Releases

Please see the [releases tab](https://github.com/codenameakshay/product-IO/releases) for more details about the latest release.

## Contributing
First off, thanks for visiting this repo and taking your time to read this doc.
Any contributions you make are **greatly appreciated**.

If you'd like to propose a feature, submit an issue [here](https://github.com/codenameakshay/product-IO/issues).

## License

Distributed under the GPL-3.0 License. See `LICENSE` for more information.

## Contributers

<a href="https://github.com/codenameakshay/product-IO/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=codenameakshay/product-IO" />
</a>

### If you made it here, thanks for your support. You can show more support by starring this repo. See ya! 👋
