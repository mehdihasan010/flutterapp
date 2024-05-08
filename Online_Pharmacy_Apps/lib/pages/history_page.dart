import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medhealths/network/api/url_api.dart';
import 'package:medhealths/network/model/history_model.dart';
import 'package:medhealths/network/model/pref_profile_model.dart';
import 'package:medhealths/theme.dart';
import 'package:medhealths/widget/card_history.dart';
import 'package:medhealths/widget/widget_ilustration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HistoryPages extends StatefulWidget {
  const HistoryPages({super.key});

  @override
  _HistoryPagesState createState() => _HistoryPagesState();
}

class _HistoryPagesState extends State<HistoryPages> {
  List<HistoryOrdelModel> list = [];
  late String userID;
  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userID = sharedPreferences.getString(PrefProfile.idUSer)!;
    });
    getHistory();
  }

  getHistory() async {
    list.clear();
    var urlHistory = Uri.parse(BASEURL.historyOrder + userID);
    final response = await http.get(urlHistory);
    if (response.statusCode == 200) {
      setState(() {
        final data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        for (var element in data) {
          print(element);
          list.add(HistoryOrdelModel.fromJson(element));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  void dispose() {
    // Dispose of resources here, such as timers or animations
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              height: 70,
              child: Text(
                "History Order",
                style: regulerTextStyle.copyWith(fontSize: 25),
              )),
          SizedBox(
            height: (list.isEmpty) ? 80 : 20,
          ),
          list.isEmpty
              ? Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: const WidgetIlustration(
                      image: "assets/no_history_ilustration.png",
                      subtitle1: "You dont have history order",
                      subtitle2: "lets shopping now",
                      title: "Oops, there are no history order",
                      child: SizedBox(),
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final x = list[i];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      child: CardHistory(
                        model: x,
                      ),
                    );
                  }),
        ]),
      ),
    );
  }
}
