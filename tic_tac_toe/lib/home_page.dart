import 'package:flutter/material.dart';
import 'package:tic_tac_toe/alert_dialog.dart';

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
                          color: xOrOList[index] == 'x' ? Colors.green : Colors.red,
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
            color: turnOfX ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void clicked(int index) {
    setState(() {
      if(turnOfX && xOrOList[index] == ''){
        xOrOList[index] = 'x';
        BoxesFull += 1;
      }else if(!turnOfX && xOrOList[index] == ''){
        xOrOList[index] = 'O';
        BoxesFull += 1;
      }

      turnOfX = !turnOfX;
      checkWinner();
    });
  }

  void checkWinner() {
    //first row
    if(xOrOList[0] == xOrOList[1] && xOrOList[0] == xOrOList[2] && xOrOList[0] != ''){
      _showAlertDialog('Winner', xOrOList[0]);
      return;
    }
    //second row
    if(xOrOList[3] == xOrOList[4] && xOrOList[3] == xOrOList[5] && xOrOList[3] != ''){
      _showAlertDialog('Winner', xOrOList[3]);
      return;
    }
    //third row
    if(xOrOList[6] == xOrOList[7] && xOrOList[6] == xOrOList[8] && xOrOList[6] != ''){
      _showAlertDialog('Winner', xOrOList[6]);
      return;
    }
    //first column
    if(xOrOList[0] == xOrOList[3] && xOrOList[0] == xOrOList[6] && xOrOList[0] != ''){
      _showAlertDialog('Winner', xOrOList[0]);
      return;
    }
    //second column
    if(xOrOList[1] == xOrOList[4] && xOrOList[1] == xOrOList[7] && xOrOList[1] != ''){
      _showAlertDialog('Winner', xOrOList[1]);
      return;
    }
    //third column
    if(xOrOList[2] == xOrOList[5] && xOrOList[2] == xOrOList[8] && xOrOList[2] != ''){
      _showAlertDialog('Winner', xOrOList[2]);
      return;
    }
    //first diagonal
    if(xOrOList[0] == xOrOList[4] && xOrOList[0] == xOrOList[8] && xOrOList[0] != ''){
      _showAlertDialog('Winner', xOrOList[0]);
      return;
    }
    //second diagonal
    if(xOrOList[2] == xOrOList[4] && xOrOList[2] == xOrOList[6] && xOrOList[2] != ''){
      _showAlertDialog('Winner', xOrOList[2]);
      return;
    }
    //draw
    if(BoxesFull == 9){
      _showAlertDialog('Draw', '');
    }

  }


  void _showAlertDialog(String title, String winner){
    showAlertDialog(
      context: context,
        title: title,
        content: winner == ''
        ? 'Its a Draw' : 'The winner is ${winner.toUpperCase()}',
      defaultActionText: 'OK',
      onOkPressed: () {
        refresh();
        Navigator.of(context).pop();
      }
    );

    if (winner == 'O'){
      scoreO += 1;
    } else if (winner == 'x'){
      scorex += 1;
    }
  }



  void refresh() {
    setState(() {
      for(int i = 0; i < 9; i++){
        xOrOList[i] = '';
      }
      turnOfX = true;
    });
  }
}
