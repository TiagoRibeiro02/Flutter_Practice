import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int scoreO = 0;
  int scorex = 0;
  bool turnOfX = true;
  int BoxesFull = 0;
  List<String> xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () { refresh(); },
              icon: Icon(Icons.refresh),
          )
        ],

        title: Center(
          child: Text(
            'Tic Tac Toe',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          buidscore(),
          buildGrid(),
          buildTurnOf(),
        ],
      ),
    );
  }

  Widget buidscore() {
    return Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Player X',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                      ),
                      const SizedBox(height: 20.0,),
                      Text(
                        scorex.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Player O',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      Text(
                        scoreO.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
        )
    );
  }

  Widget buildGrid() {
    return Expanded(
      flex: 3,
        child: GridView.builder(
          itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3
            ),
            itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    clicked(index);
                  },
                  child: Container(
                    decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Center(
                      child: Text(
                        xOrOList[index],
                        style: TextStyle(
                          color: xOrOList[index] == 'x' ? Colors.white : Colors.red,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                );
            }
        )
    );
  }

  Widget buildTurnOf() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          turnOfX ? 'Turn of X' : 'Turn of O',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void clicked(int index) {
    print(index);
  }

  void checkWinner() {

  }



  void refresh() {
    setState(() {
      for(int i = 0; i < 9; i++){
        xOrOList[i] = '';
      }
    });
  }
}
