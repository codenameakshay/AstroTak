import 'package:astrotak/model/place_model.dart';
import 'package:astrotak/notifiers/astrologer_notifier.dart';
import 'package:astrotak/notifiers/panchang_notifier.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:astrotak/controller/theme_controller.dart';
import 'package:astrotak/model/filter_enum.dart';
import 'package:astrotak/router/app_router.dart';
import 'package:astrotak/services/locator.dart';
import 'package:astrotak/services/logger.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();
  FilterRange _filterRange = FilterRange.all;
  final DateTime _dateTime = DateTime.now();
  final Place _place =
      Place(placeName: "Delhi, India", placeId: "ChIJL_P_CXMEDTkRw0ZdG-0GVvw");
  bool isSearch = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    logger.d('App init done.');
  }

  @override
  Widget build(BuildContext context) {
    final darkAppBarContents =
        Theme.of(context).scaffoldBackgroundColor.computeLuminance() > 0.5;
    return AutoTabsRouter(
        routes: [
          PanchangRoute(controller: controller),
          AstroRoute(controller: controller),
        ],
        homeIndex: 0,
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness:
                      darkAppBarContents ? Brightness.dark : Brightness.light),
              title: isSearch
                  ? TextField(
                      autofocus: true,
                      onChanged: (text) {
                        if (tabsRouter.activeIndex == 0) {
                          locator<PanchangNotifier>()
                              .fetchPanchang(_dateTime, _place);
                        } else {
                          locator<AstrologerNotifier>()
                              .fetchAstrologers(text, _filterRange);
                        }
                      },
                      controller: _searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    )
                  : Text(
                      'AstroTak',
                      style: TextStyle(
                        color: darkAppBarContents
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor
                            : Theme.of(context)
                                .appBarTheme
                                .titleTextStyle
                                ?.color,
                      ),
                    ),
              actions: [
                tabsRouter.activeIndex == 1
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isSearch = !isSearch;
                          });
                        },
                        icon: Icon(isSearch ? Icons.close : Icons.search),
                        color: darkAppBarContents
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor
                            : Theme.of(context)
                                .appBarTheme
                                .titleTextStyle
                                ?.color,
                      )
                    : Container(),
                tabsRouter.activeIndex == 1
                    ? PopupMenuButton<FilterRange>(
                        icon: Icon(
                          Icons.filter_list,
                          color: _filterRange != FilterRange.all
                              ? Theme.of(context).toggleableActiveColor
                              : null,
                        ),
                        itemBuilder: (context) {
                          return FilterRange.values.map(
                            (FilterRange value) {
                              return PopupMenuItem<FilterRange>(
                                value: value,
                                child: Row(
                                  children: [
                                    Text(value.title),
                                    _filterRange == value
                                        ? Icon(
                                            Icons.check,
                                            color: Theme.of(context)
                                                .toggleableActiveColor,
                                          )
                                        : Container(),
                                  ],
                                ),
                              );
                            },
                          ).toList();
                        },
                        onSelected: (value) {
                          logger.d('Selected $value');
                          setState(() {
                            _filterRange = value;
                          });
                          locator<AstrologerNotifier>().fetchAstrologers(
                            _searchController.text,
                            _filterRange,
                          );
                        },
                      )
                    : Container(),
                IconButton(
                  onPressed: () {
                    context.read<ThemeController>().setSchemeIndex(
                          (context.read<ThemeController>().schemeIndex + 1) %
                              40,
                        );
                  },
                  icon: const Icon(Icons.brightness_4_rounded),
                  color: darkAppBarContents
                      ? Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedItemColor
                      : Theme.of(context).appBarTheme.titleTextStyle?.color,
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              currentIndex: tabsRouter.activeIndex,
              onTap: (value) {
                tabsRouter.setActiveIndex(value);
                _searchController.text = '';
                setState(() {
                  isSearch = false;
                  _filterRange = FilterRange.all;
                });
                if (value == 0) {
                  locator<PanchangNotifier>().fetchPanchang(_dateTime, _place);
                } else {
                  locator<AstrologerNotifier>()
                      .fetchAstrologers('', _filterRange);
                }
              },
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Panchang",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  activeIcon: Icon(Icons.chat_bubble),
                  label: "Talk to Astro",
                ),
              ],
            ),
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        });
  }
}
