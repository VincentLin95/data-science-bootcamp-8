# appetizers
A_ID <- c("A1", "A2", "A3", "A4", "A5")
A_list <- c("Bruschetta", "Crostini", "Chicken wings", "Prosciutto", "Italian meatball")
A_price <- c(150, 190, 250, 170, 200)
appetizers <- data.frame(A_ID, A_list, A_price)

# pizza
P_ID <- c("P1", "P2", "P3", "P4", "P5", "P6","P7", "P8", "P9")
P_list <- c("Margherita", "Napoletana", "Quattro formaggi", "Capricciosa", "Caprese", "Bianca",
           "Marinara", "Diavola", "Ortolana")
P_price <- c(250, 280, 340, 400, 270, 260, 320, 330, 290)
pizza <- data.frame(P_ID, P_list, P_price)

# side_dishes
SD_ID <- c("S1", "S2", "S3", "S4")
SD_list <- c("Ratatouille", "Caesar salad", "Pasta salad", "Tomato soup")
SD_price <- c(175, 85, 140, 100)
side_dishes <- data.frame(SD_ID, SD_list, SD_price)

# desserts
D_ID <- c("D1", "D2", "D3", "D4", "D5")
D_list <- c("Tiramisu cake", "Chocolate gelato", "Affogato", "Panna cotta", "Zeppole")
D_price <- c(100, 60, 90, 80, 50)
desserts <- data.frame(D_ID, D_list, D_price)

# beverages
B_ID <- c("B1", "B2", "B3", "B4", "B5", "B6")
B_list <- c("Limoncello", "Bombardino", "Negroni", "Prosecco", "Italian soda", "Water")
B_price <- c(500, 160, 400, 1500, 60, 30)
beverages <- data.frame(B_ID, B_list, B_price)

chatbot <- function() {
  print("Ciao!, Benvenuti in Vincenzo Pizzeria!")
print("Dear our customer, can we have your name please?")
name <- readLines("stdin", n = 1)
print(paste0(name,", do you want to order something? Please type 'Yes' for yes and 'No' for no"))
order <- readLines("stdin", n = 1)

if(order == "Yes") {
  print("When you can make a decision, please order by typing IDs which stand for the food details in menu for instance: A1.")
  print("Choose some dishes that you want. (Limit at 1 dish per each kind of food.)")
  print(appetizers)
} else if (order == "No") {
  print("Molte grazie. Arrivederci!")
} else {
  print("Mi dispiace, please refresh the system again.")
}
  
  order_app <- readLines("stdin", n = 1)
if (order_app == "No") {
  print("Molte grazie. Arrivederci!")
} else {
  print(paste("Your appetizer:", appetizers[appetizers$A_ID == order_app,2]))
  print("Do you want to order pizzas? Type 'Yes' to visit next menu, type 'No' to pay your order.")
}

to_piz <- readLines("stdin", n = 1)
if (to_piz == "Yes") {
  print("Which pizza do you want?")
  print(pizza)
  order_piz <- readLines("stdin", n = 1)
  print(paste("Your pizza:", pizza[pizza$P_ID == order_piz,2]))
  print("Do you want to order side dish? Type 'Yes' to visit next menu, type 'No' to pay your order.")
} else if (to_piz == "No") {
    print("Your order is ready")
    print(paste("Your total price is", appetizers[appetizers$A_ID == order_app,3], "Baht"))
    print("You can choose your payment by type the number from these choice [1] Credit/Debit card, [2] QR code payment, or [3] Cash")
    payment <- as.numeric(readLines("stdin", n = 1))
  if (payment == 1 | payment == 2) {
    print("The system will lead you to the mobile banking, after payment finish please upload your E-slip to confirm your payment.")
  } else if (payment == 3) {
    print("Please provide your cash. After your order deilivered, we'll inform you again.")
  } else {
    print("Mi dispiace, you can fill only number. Please try again.")
  }
    print("Your order will be ready to deliver in 30 minutes. Buon Appetito!")
    print("Molte grazie. Arrivederci!")
} else {
  print("Mi dispiace, please refresh the system again.")
}

to_sd <- readLines("stdin", n = 1)
if (to_sd == "Yes") {
  print("Which side dishes do you want?")
  print(side_dishes)
  order_sd <- readLines("stdin", n = 1)
  print(paste("Your side dish:", side_dishes[side_dishes$SD_ID == order_sd,2]))
  print("Do you want to order dessert? Type 'Yes' to visit next menu, type 'No' to pay your order.")
} else if (to_sd == "No") {
    print("Your order is ready")
    print(paste("Your total price is", appetizers[appetizers$A_ID == order_app,3] +
                pizza[pizza$P_ID == order_piz,3], "Baht"))
    print("You can choose your payment by type the number from these choice [1] Credit/Debit card, [2] QR code payment, or [3] Cash")
    payment <- as.numeric(readLines("stdin", n = 1))
  if (payment == 1 | payment == 2) {
    print("The system will lead you to the mobile banking, after payment finish please upload your E-slip to confirm your payment.")
  } else if (payment == 3) {
    print("Please provide your cash. After your order deilivered, we'll inform you again.")
  } else {
    print("Mi dispiace, you can fill only number. Please try again.")
  }
    print("Your order will be ready to deliver in 30 minutes. Buon Appetito!")
    print("Molte grazie. Arrivederci!")
} else {
  print("Mi dispiace, please refresh the system again.")
}

to_des <- readLines("stdin", n = 1)
if (to_des == "Yes") {
  print("Which desserts do you want?")
  print(desserts)
  order_des <- readLines("stdin", n = 1)
  print(paste("Your dessert:", desserts[desserts$D_ID == order_des,2]))
  print("Do you want to order beverages? Type 'Yes' to visit next menu, type 'No' to pay your order.")
  to_bev <- readLines("stdin", n = 1)
} else if (to_des == "No") {
    print("Your order is ready")
    print(paste("Your total price is", appetizers[appetizers$A_ID == order_app,3] +
                pizza[pizza$P_ID == order_piz,3] +
                side_dishes[side_dishes$SD_ID == order_sd, 3], "Baht"))
    print("You can choose your payment by type the number from these choice [1] Credit/Debit card, [2] QR code payment, or [3] Cash")
    payment <- as.numeric(readLines("stdin", n = 1))
  if (payment == 1 | payment == 2) {
    print("The system will lead you to the mobile banking, after payment finish please upload your E-slip to confirm your payment.")
  } else if (payment == 3) {
    print("Please provide your cash. After your order deilivered, we'll inform you again.")
  } else {
    print("Mi dispiace, you can fill only number. Please try again.")
  }
    print("Your order will be ready to deliver in 30 minutes. Buon Appetito!")
    print("Molte grazie. Arrivederci!")
} else {
  print("Mi dispiace, please refresh the system again.")
}

if (to_bev == "Yes") {
  print("Which beverages do you want?")
  print(beverages)
  order_bev <- readLines("stdin", n = 1)
  print(paste("Your beverage:", beverages[beverages$B_ID == order_bev,2]))
} else if (to_bev == "No") {
    print("Your order is ready")
    print(paste("Your total price is", appetizers[appetizers$A_ID == order_app,3] +
    pizza[pizza$P_ID == order_piz,3] +
    side_dishes[side_dishes$SD_ID == order_sd,3] +
    desserts[desserts$D_ID == order_des,3], "Baht"))
    print("You can choose your payment by type the number from these choice [1] Credit/Debit card, [2] QR code payment, or [3] Cash")
    payment <- as.numeric(readLines("stdin", n = 1))
  if (payment == 1 | payment == 2) {
    print("The system will lead you to the mobile banking, after payment finish please upload your E-slip to confirm your payment.")
  } else if (payment == 3) {
    print("Please provide your cash. After your order deilivered, we'll inform you again.")
  } else {
    print("Mi dispiace, you can fill only number. Please try again.")
  }
    print("Your order will be ready to deliver in 30 minutes. Buon Appetito!")
    print("Molte grazie. Arrivederci!")
  break
} else {
  print("Mi dispiace, please refresh the system again.")
}

print("Your order is ready")
print(paste("Your total price is", appetizers[appetizers$A_ID == order_app,3] +
            pizza[pizza$P_ID == order_piz,3] +
            side_dishes[side_dishes$SD_ID == order_sd,3] +
            desserts[desserts$D_ID == order_des,3] +
            beverages[beverages$B_ID == order_bev,3], "Baht"))
print("You can choose your payment by type the number from these choice [1] Credit/Debit card, [2] QR code payment, or [3] Cash")
payment <- as.numeric(readLines("stdin", n=1))
if (payment == 1 | payment == 2) {
  print("The system will lead you to the mobile banking, after payment finish please upload your E-slip to confirm your payment.")
} else if (payment == 3) {
  print("Please provide your cash for pay after your order is delivered.")
} else {
  print("Mi dispiace, you can fill only number. Please try again.")
}
print("Your order will be ready to deliver in 30 minutes. Buon Appetito!")
print("Molte grazie. Arrivederci!")
}

chatbot()
