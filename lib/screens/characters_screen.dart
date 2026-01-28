import 'package:day8_hw/service/api.dart';
import 'info.dart';

import 'package:flutter/material.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api().getData(), 
        builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              
              return Container(
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
                    Image.network(snapshot.data![index].imageUrl!),
                    SizedBox(height: 8),
                    Text(
                      snapshot.data![index].name!,
                      style: TextStyle(fontSize: 22),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        int i = index;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => info(i:i),
                        ),
                      );    
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, 
                        foregroundColor: Colors.black, 
                      ),
                      child: const Text("info"),
                    )
                  ],
                ),
              );
            },
          );
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return const Center(child: Text("لا توجد بيانات للعرض"));
          },
      ),
    );
  }
}
