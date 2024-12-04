lines <- readLines("R/day4/input.txt")

# Use character matrix
grid <- do.call(rbind, strsplit(lines, split = ""))

# rows and columns
n_rows <- nrow(grid)
n_cols <- ncol(grid)


counter <- 0

# Possible sequences for MAS (forwards and backwards)
sequences <- list(c("M", "A", "S"), c("S", "A", "M"))

# Excluding borders
for (i in 2:(n_rows - 1)) {
  for (j in 2:(n_cols - 1)) {
    # Check if center is A
    if (grid[i, j] == "A") {
      # Diagonals
      diag1 <- c(grid[i - 1, j - 1], grid[i, j], grid[i + 1, j + 1])
      diag2 <- c(grid[i - 1, j + 1], grid[i, j], grid[i + 1, j - 1])

      # Diagonals valid?
      valid_diag1 <- any(sapply(sequences, function(seq) all(diag1 == seq)))
      valid_diag2 <- any(sapply(sequences, function(seq) all(diag2 == seq)))

      if (valid_diag1 && valid_diag2) {
        counter <- counter + 1
      }
    }
  }
}

print(counter)
