grid <- do.call(rbind, strsplit(readLines("input.txt"), ""))
n_rows <- nrow(grid)
n_cols <- ncol(grid)
word <- c("X", "M", "A", "S")
dirs <- expand.grid(dr = -1:1, dc = -1:1)[-5, ]  # Exclude 0,0

counter <- 0
for (d in seq_len(nrow(dirs))) {
  dr <- dirs$dr[d]
  dc <- dirs$dc[d]
  for (row in 1:n_rows) {
    for (col in 1:n_cols) {
      idx <- cbind(row + dr * 0:3, col + dc * 0:3)
      if (all(idx[,1] >= 1 & idx[,1] <= n_rows & idx[,2] >= 1 & idx[,2] <= n_cols)) {
        if (all(grid[idx] == word)) counter <- counter + 1
      }
    }
  }
}
print(counter)
