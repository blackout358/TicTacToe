class GameBoard {
  late List<String> grid;
  late String turn;
  late String winner;
  late int xScore;
  late int oScore;

  GameBoard() {
    grid = List<String>.filled(9, '');
    turn = 'X';
    winner = "";
    xScore = 0;
    oScore = 0;
  }

  String getGridValue(int index) {
    return grid[index];
  }

  List<String> getGrid() {
    return grid;
  }

  void setXO(int index) {
    if (grid[index].isEmpty) {
      grid[index] = turn;
      updateTurn();
    }
  }

  void clearBoard() {
    grid = ['', '', '', '', '', '', '', '', ''];
  }

  void updateTurn() {
    turn == "O" ? turn = "X" : turn = "O";
  }

  bool isWinner() {
    if (grid[0] == grid[1] && grid[2] == grid[0] && grid[0] != '') {
      setWinner("${grid[0]} is the winner");
      updateScore(grid[0]);
      return true;
    }
    // Check row 2
    else if (grid[3] == grid[4] && grid[5] == grid[3] && grid[3] != '') {
      setWinner("${grid[3]} is the winner");
      updateScore(grid[3]);
      return true;
    }
    // Check row 3
    else if (grid[6] == grid[7] && grid[7] == grid[8] && grid[6] != '') {
      setWinner("${grid[6]} is the winner");
      updateScore(grid[6]);
      return true;
    }
    // Check column 1
    else if (grid[0] == grid[3] && grid[0] == grid[6] && grid[0] != '') {
      setWinner("${grid[0]} is the winner");
      updateScore(grid[0]);
      return true;
    }
    // Check column 2
    else if (grid[1] == grid[4] && grid[4] == grid[7] && grid[1] != '') {
      setWinner("${grid[1]} is the winner");
      updateScore(grid[1]);
      return true;
    }
    // Check column 3
    else if (grid[2] == grid[5] && grid[5] == grid[8] && grid[2] != '') {
      setWinner("${grid[2]} is the winner");
      updateScore(grid[2]);
      return true;
    }
    // Check diagonal
    else if (grid[0] == grid[4] && grid[4] == grid[8] && grid[0] != '') {
      setWinner("${grid[0]} is the winner");
      updateScore(grid[0]);
      return true;
    }
    // Check diagonal
    else if (grid[2] == grid[4] && grid[4] == grid[6] && grid[2] != '') {
      setWinner("${grid[2]} is the winner");
      updateScore(grid[2]);
      return true;
    } // Check tie
    else if (grid.every((element) => element.isNotEmpty)) {
      setWinner("Tie");
      return true;
    } else {
      setWinner("");
      return false;
    }
  }

  void setWinner(String victor) {
    winner = victor;
  }

  String getWinner() {
    return winner;
  }

  void updateScore(String victor) {
    victor == "X" ? xScore++ : oScore++;
  }

  int getOScore() {
    return oScore;
  }

  int getXScore() {
    return xScore;
  }

  String getTurn() {
    return turn;
  }
}
