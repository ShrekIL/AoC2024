data <- read.table("day1/input.txt", header = FALSE)

left_list <- data$V1
right_list <- data$V2

right_counts <- table(right_list)

similarity_score <- 0

# Calculate similarity score
for (number in left_list) {
  if (number %in% names(right_counts)) {
    similarity_score <- similarity_score + number * right_counts[as.character(number)]
  }
}

cat(similarity_score, "\n")