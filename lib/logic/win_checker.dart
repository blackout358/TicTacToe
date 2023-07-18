class WinnerChecker {
  static String checkWinner(List<String> data) {
    // Check row 1
    if (data[0] == data[1] && data[2] == data[0] && data[0] != '') {
      return "${data[0]} is the winner";
    }
    // Check row 2
    else if (data[3] == data[4] && data[5] == data[3] && data[3] != '') {
      return "${data[3]} is the winner";
    }
    // Check row 3
    else if (data[6] == data[7] && data[7] == data[8] && data[6] != '') {
      return "${data[6]} is the winner";
    }
    // Check column 1
    else if (data[0] == data[3] && data[0] == data[6] && data[0] != '') {
      return "${data[0]} is the winner";
    }
    // Check column 2
    else if (data[1] == data[4] && data[4] == data[7] && data[1] != '') {
      return "${data[1]} is the winner";
    }
    // Check column 3
    else if (data[2] == data[5] && data[5] == data[8] && data[2] != '') {
      return "${data[2]} is the winner";
    }
    // Check diagonal
    else if (data[0] == data[4] && data[4] == data[8] && data[0] != '') {
      return "${data[0]} is the winner";
    }
    // Check diagonal
    else if (data[2] == data[4] && data[4] == data[6] && data[2] != '') {
      return "${data[2]} is the winner";
    }
    // Check Tie
    else if (data.every((element) => element.isNotEmpty)) {
      return "Tie";
    } else {
      return "";
    }
  }
}
