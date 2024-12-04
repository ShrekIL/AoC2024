# The function purpose is to check if a report is safe
is_safe <- function(report) {
  differences <- diff(report)
  all_increasing <- all(differences > 0 & differences <= 3)
  all_decreasing <- all(differences < 0 & differences >= -3)
  return(all_increasing || all_decreasing)
}

# The function purpose is to check if a report is safe in addition
# with the Problem Dampener
is_safe_with_dampener <- function(report) {
  n <- length(report)
  if (is_safe(report)) {
    return(TRUE)
  }
  for (i in 1:n) {
    modified_report <- report[-i]
    if (is_safe(modified_report)) {
      return(TRUE)
    }
  }
  return(FALSE)
}

data <- readLines("day2/input.txt")

safe_count <- 0

# Process
for (line in data) {
  report <- as.numeric(unlist(strsplit(line, " ")))
  if (is_safe_with_dampener(report)) {
    safe_count <- safe_count + 1
  }
}

cat(safe_count, "\n")