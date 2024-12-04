data <- read.table("day1/input.txt", header = FALSE)

left_list <- data$V1
right_list <- data$V2

# Sort lists
sorted_left <- sort(left_list)
sorted_right <- sort(right_list)

# Compute differences
differences <- abs(sorted_left - sorted_right)

# Calculate total distance
total_distance <- sum(differences)

cat(total_distance, "\n")
