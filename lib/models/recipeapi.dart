// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
//   var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"limit": "18",
// 	"start": "0",
// 	"tag": "list.recipe.popular"
// });

// req.headers({
// 	"x-rapidapi-host": "yummly2.p.rapidapi.com",
// 	"x-rapidapi-key": "c50cb6d0bbmsha85ea12c49a550bp17e86djsnf3ed79e964b9",
// 	"useQueryString": true
// });
  static Future<List<Recipe>> getRecipe() async {
    //Uniform Resource Identifier is a unique sequence of characters that
    //identifies a logical or physical resource used by web technologies
    //construct query string
    var uri = Uri.https("yummly2.p.rapidapi.com", "feeds/list",
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

//execute HTTP query to API
    final response = await http.get(
      uri,
      headers: {
        "x-rapidapi-host": "yummly2.p.rapidapi.com",
        "x-rapidapi-key": "c50cb6d0bbmsha85ea12c49a550bp17e86djsnf3ed79e964b9",
        "useQueryString": "true"
      },
    );

//DECODE the JSON data from API call response
    Map data = jsonDecode(response.body);
//temporary List to parse data
    List _tempList = [];
//run TestEndpoint > Results for keys
//loop through response to add items to temp List
    for (var i in data['feed']) {
      _tempList.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_tempList);
  }
}
