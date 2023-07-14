class GameBoard {
  late List<String> grid;
  late String turn;

  GameBoard() {
    grid = List<String>.filled(9, '');
    turn = 'X';
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

  (bool, String) isWinner() {
    if (grid[0] == grid[1] && grid[2] == grid[0] && grid[0] != '') {
      return (true, grid[0]);
    }
    // Check row 2
    else if (grid[3] == grid[4] && grid[5] == grid[3] && grid[3] != '') {
      return (true, grid[3]);
    }
    // Check row 3
    else if (grid[6] == grid[7] && grid[7] == grid[8] && grid[6] != '') {
      return (true, grid[6]);
    }
    // Check column 1
    else if (grid[0] == grid[3] && grid[0] == grid[6] && grid[0] != '') {
      return (true, grid[0]);
    }
    // Check column 2
    else if (grid[1] == grid[4] && grid[4] == grid[7] && grid[1] != '') {
      return (true, grid[1]);
    }
    // Check column 3
    else if (grid[2] == grid[5] && grid[5] == grid[8] && grid[2] != '') {
      return (true, grid[2]);
    }
    // Check diagonal
    else if (grid[0] == grid[4] && grid[4] == grid[8] && grid[0] != '') {
      return (true, grid[0]);
    }
    // Check diagonal
    else if (grid[2] == grid[4] && grid[4] == grid[6] && grid[2] != '') {
      return (true, grid[2]);
    } else {
      return (false, "");
    }
  }

  // static setXO(int index) {}

  // clear winner// -> if winner full -> clear
  // setXO
  // check winner//
}
