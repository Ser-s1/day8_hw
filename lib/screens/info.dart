import 'package:day8_hw/service/api.dart';
import 'package:flutter/material.dart';

class info extends StatelessWidget {
  final int i;
  const info({super.key,required this.i});
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api().getData(), 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }

              return Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 150, 85, 214),
                      // offset: Offset(0,0),
                      blurRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Image.network(snapshot.data![i].imageUrl!),
                    SizedBox(height: 20),
                    Text(
                      snapshot.data![i].name!,
                      style: TextStyle(fontSize: 22),
                      ),
                    SizedBox(height: 20),
                    Text(
                      snapshot.data![i].info!,
                      style: TextStyle(fontSize: 18),
                      ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20,left: 20),
                          child: Text(
                          "price: ${snapshot.data![i].price!}",
                          style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20,left: 140),
                          child: Text(
                          "stock: ${snapshot.data![i].stock!}",
                          style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],)
                  ],
                ),
              );
            
          
        },
      ),
    );
  }
}
