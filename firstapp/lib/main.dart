import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
    home: Home(),
  ));


// cannot change over time
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        //text
        /*child: Text(
          'Hello world',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.amber,
            fontFamily: 'IndieFlower',
          ),
        ),*/
        
        //images
        /*child: Image(
          //network img
          //image: NetworkImage('https://images.unsplash.com/photo-1688019984360-50d40dfa955a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),

          //img from pc
          image: AssetImage('assets/IMG_0599.jpg'),
        ),*/

        //buttons/icons
        /*child: Icon(
          Icons.airport_shuttle,
          color: Colors.lightBlue,
          size: 50.0,
        ),*/
        //button with icon
        /*child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.mail,
            ),
            label: Text('mail me'),
        ),*/
        //icon button
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.abc),
          color: Colors.red,
        ),


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}



