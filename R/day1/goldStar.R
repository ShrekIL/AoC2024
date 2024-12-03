# Read the input file
data <- read.table("day1/input.txt", header = FALSE)

# Extract the two columns
left_list <- data$V1
right_list <- data$V2

# Create a table of counts for the right list
right_counts <- table(right_list)

# Initialize the similarity score
similarity_score <- 0

# Calculate the similarity score
for (number in left_list) {
  if (number %in% names(right_counts)) {
    similarity_score <- similarity_score + number * right_counts[as.character(number)]
  }
}

# Print the result
cat(similarity_score, "\n")