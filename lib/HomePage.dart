import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'LogService.dart';
import 'http_servise.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
static final String id = "HomePage";
  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apipostlist();
  }
  void _apipostlist(){
    Network.GET(Network.API_LIST,Network.paramsEmpty()).then((response) => {
     LogService.i(response.toString()),

    });
}

  void _showResponse (){

  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
