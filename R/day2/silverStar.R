# Function to check if a report is safe
is_safe <- function(report) {
  differences <- diff(report)
  all_increasing <- all(differences > 0 & differences <= 3)
  all_decreasing <- all(differences < 0 & differences >= -3)
  return(all_increasing || all_decreasing)
}

# Read the input file
data <- readLines("day2/input.txt")

# Initialize the count of safe reports
safe_count <- 0

# Process each report
for (line in data) {
  report <- as.numeric(unlist(strsplit(line, " ")))
  if (is_safe(report)) {
    safe_count <- safe_count + 1
  }
}

# Print the result
cat(safe_count, "\n")
