// import 'package:flutter/material.dart';
//
// class GameScreen extends StatefulWidget {
//   final String player1;
//   final String player2;
//
//   const GameScreen({Key? key, required this.player1, required this.player2}) : super(key: key);
//
//   @override
//   _GameScreenState createState() => _GameScreenState();
// }
//
// class _GameScreenState extends State<GameScreen> {
//   List<String> board = List.filled(9, '');
//   String currentPlayer = 'X';
//   bool gameEnd = false;
//   String resultMessage = '';
//   int player1Count = 0;
//   int player2Count = 0;
//
//   void resetGame() {
//     setState(() {
//       board = List.filled(9, '');
//       currentPlayer = 'X';
//       gameEnd = false;
//       resultMessage = '';
//       player1Count = 0;
//       player2Count = 0;
//     });
//   }
//
//   void handleTap(int index) {
//     if (board[index] == '' && !gameEnd) {
//       setState(() {
//         board[index] = currentPlayer;
//         if (checkWinner()) {
//           gameEnd = true;
//           if (currentPlayer == 'X') {
//             player1Count++;
//           } else {
//             player2Count++;
//           }
//           resultMessage = 'Player ${currentPlayer == 'X' ? widget.player1 : widget.player2} wins!';
//         } else if (board.every((element) => element != '')) {
//           gameEnd = true;
//           resultMessage = 'It\'s a draw!';
//         } else {
//           currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
//         }
//       });
//     }
//   }
//
//   bool checkWinner() {
//     const List<List<int>> winningCombinations = [
//       [0, 1, 2],
//       [3, 4, 5],
//       [6, 7, 8],
//       [0, 3, 6],
//       [1, 4, 7],
//       [2, 5, 8],
//       [0, 4, 8],
//       [2, 4, 6],
//     ];
//
//     for (var combination in winningCombinations) {
//       if (board[combination[0]] != '' &&
//           board[combination[0]] == board[combination[1]] &&
//           board[combination[1]] == board[combination[2]]) {
//         return true;
//       }
//     }
//     return false;
//   }
//
//   Widget buildGridItem(int index) {
//     Color color;
//     if (board[index] == 'X') {
//       color = Color(0xFFC72712); // Color for X
//     } else if (board[index] == 'O') {
//       color = Color(0xFF8EFF15); // Color for O
//     } else {
//       color =Color(0xFFFFC815); // Default color for empty cells
//     }
//
//     return GestureDetector(
//       onTap: () => handleTap(index),
//       child: Container(
//         width: 80,
//         height: 80,
//         color: color, // Set the background color
//         child: Center(
//           child: Text(
//             board[index],
//             style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Toe"),
//         backgroundColor: Color(0xFFDC0ED0),
//       ),
//       body: Container(
//         color: Color(0xFFDC0ED0), // Background color of the game screen
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Text(
//               "Player 1 (${widget.player1}): $player1Count vs Player 2 (${widget.player2}): $player2Count",
//               style: TextStyle(fontSize: 20, color: Colors.yellow),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: Container(
//                 width: 270,
//                 height: 270,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.orange),
//                 ),
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                   ),
//                   itemBuilder: (context, index) => buildGridItem(index),
//                   itemCount: 9,
//                   shrinkWrap: true,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: resetGame,
//               child: Text('Reset Game'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
