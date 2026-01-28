import 'package:day8_hw/service/api.dart';
import 'package:day8_hw/screens/characters_screen.dart';

import 'info.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    List category1 = ["beauty","furniture","groceries"];
    List img = ["https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"
    ,"https://cdn.dummyjson.com/product-images/furniture/annibale-colombo-bed/thumbnail.webp",
    "https://cdn.dummyjson.com/product-images/groceries/ice-cream/thumbnail.webp"];
    return Scaffold(
      appBar: AppBar(),
      body: 
             ListView.builder(
            itemCount: 3 ,
            itemBuilder: (context, index) {
              
              return 
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 144, 83, 206),
                      // offset: Offset(0,0),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Image.network(img[index]),
                    SizedBox(height: 8),
                    Text(
                      category1[index],
                      style: TextStyle(fontSize: 22),
                      ),
                    ElevatedButton(
                      onPressed: () {
                      String s = "${category1[index]}";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharactersScreen(s:s),
                        ),
                      );    
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, 
                        foregroundColor: Colors.black, 
                      ),
                      child: const Text("browse"),
                    )
                  ],
                ),
              );
              }
      
          )
          
        

      );
    
 } 
}
