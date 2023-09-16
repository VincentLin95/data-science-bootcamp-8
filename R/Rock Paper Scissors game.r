response <- c("Rock", "Paper", "Scissors")
win <- 0
loss <- 0
draw <- 0

rock_paper_scissors <- function() {
  print("Hello, welcome to 'Rock Paper Scissor Game'. The simple game in everyone childhood.")
  print("Let's recap the rule. The '>' represents 'beat'.")
  print("Rock > Scissors")
  print("Scissors > Paper")
  print("Paper > Rock")
  print("Sounds easy?, you know the rule clearly right now. Are you ready? Type 'Yes' to start, or 'No' to exit the game.")
  start <- readLines("stdin", n = 1)
  if (start == "Yes") {
    while (TRUE) {
      print("Rock...Paper...Scissors!")
      print("Choose your response from these: [1] 'Rock', [2] 'Paper', [3] 'Scissors' or [0] to exit the game.")
      player_turn <- as.numeric(readLines("stdin", n = 1))
      if (player_turn == 0) {
        print("Thank you for coming. Have a nice day!")
        break
      }
      computer_turn <- sample(response, 1)
      player_turn <- response[player_turn]
      if (player_turn == computer_turn) {
        draw <- draw + 1
      } else if (player_turn == "Rock" & computer_turn == "Paper") {
        lose <- loss + 1
      } else if (player_turn == "Rock" & computer_turn != "Paper") {
        win <- win + 1
      } else if (player_turn == "Paper" & computer_turn == "Scissors") {
        lose <- loss + 1
      } else if (player_turn == "Paper" & computer_turn != "Scissors") {
        win <- win + 1
      } else if (player_turn == "Scissors" & computer_turn == "Rock") {
        loss <- loss + 1
      } else if (player_turn == "Scissors" & computer_turn != "Rock") {
        win <- win + 1
      } else {
        win <- win + 1
      }
    cat("Your response is:", player_turn, 
   "\nComputer response is:", computer_turn,
   "\nYour score is: Win =", win, ", Loss =", loss, ", Draw =", draw, "\n")
  }
} else if (start == "No") {
  print("Thank you for coming. Have a nice day!")
} else {
  print("Error, please refresh the game to try again.")
}
}

rock_paper_scissors()
