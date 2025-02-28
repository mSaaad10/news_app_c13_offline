import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c13_offline/core/colors_manager.dart';

typedef OnChange = void Function(String?);

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key, required this.onDrawerItemClicked});

  final Function onDrawerItemClicked;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedTheme = "Light";
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.black,
      width: 269.w,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 166.h,
              color: ColorsManager.white,
              child: Text(
                "News App",
                style: Theme.of(context).textTheme.labelLarge,
              )),
          Padding(
            padding: REdgeInsets.only(left: 18, top: 16, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      widget.onDrawerItemClicked();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home_outlined,
                          color: ColorsManager.white,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Go To Categories",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 48.h,
                ),
                Text(
                  "Theme",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                buildDropDownButton(context,
                    contentView: ["Light", "Dark"],
                    textView: selectedTheme, onChange: (newTheme) {
                  selectedTheme = newTheme!;
                  setState(() {});
                }),
                SizedBox(
                  height: 48.h,
                ),
                Text(
                  "Language",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                buildDropDownButton(context, contentView: ["English", "عربي"],
                    onChange: (newLanguage) {
                  selectedLanguage = newLanguage!;
                  setState(() {});
                }, textView: selectedLanguage)
              ],
            ),
          )
        ],
      ),
    );
  }

  buildDropDownButton(BuildContext context,
      {required List<String> contentView,
      required OnChange onChange,
      required String textView}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorsManager.white, width: 2)),
      child: Row(
        children: [
          Text(
            textView,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Spacer(),
          DropdownButton<String>(
            underline: SizedBox(),
            items: contentView.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
