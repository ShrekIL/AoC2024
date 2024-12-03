# Read the input file
data <- read.table("day1/input.txt", header = FALSE)

# Extract the two columns
left_list <- data$V1
right_list <- data$V2

# Sort both lists
sorted_left <- sort(left_list)
sorted_right <- sort(right_list)

# Compute the absolute differences
differences <- abs(sorted_left - sorted_right)

# Calculate the total distance
total_distance <- sum(differences)

# Print the result
cat(total_distance, "\n")
