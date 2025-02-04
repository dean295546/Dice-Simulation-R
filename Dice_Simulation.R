## Dice Simulation
library(ggplot2)

# Function to simulate dice rolls and plot the percentage of rolling a 6
simulate_dice_rolls <- function(num_rolls) {
  # Simulate dice rolls (1-6)
  rolls <- sample(1:6, size = num_rolls, replace = TRUE)
  
  # Compute cumulative percentage of rolling a 6
  six_count <- ifelse(rolls == 6, 1, 0)  # 1 if roll is 6, otherwise 0
  running_six_percentage <- cumsum(six_count) / seq_along(rolls) * 100
  
  # Create a data frame for plotting
  df <- data.frame(Roll = 1:num_rolls, Percentage_Six = running_six_percentage)
  
  # Final percentage
  final_percentage <- tail(running_six_percentage, 1)
  
  # Plot the trend
  ggplot(df, aes(x = Roll, y = Percentage_Six)) +
    geom_line(color = "blue", size = 1) +
    geom_hline(yintercept = 100/6, linetype = "dashed", color = "red") +  # Expected probability line 16.67%
    annotate("text", x = num_rolls * 0.1, y = 100/6, label = "16.67%", color = "red", size = 4, hjust = 1.5) +  # Label at (0, 16.67)
    annotate("text", x = num_rolls * 0.95, y = final_percentage - 2, 
             label = paste0(round(final_percentage, 1), "%"), color = "blue", size = 4, hjust = -0.3) + # Final percentage label
    labs(title = "Trend of Rolling a 6 in Dice Rolls",
         x = "Number of Rolls",
         y = "Percentage of Rolls That Were 6") +
    theme_minimal()
}

# Allow the user to enter the number of rolls
num_rolls <- as.numeric(readline("Enter the number of rolls: "))

# Run the simulation and plot
simulate_dice_rolls(num_rolls)
