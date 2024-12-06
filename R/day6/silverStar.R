map_lines <- readLines("R/day6/input.txt")
map <- do.call(rbind, strsplit(map_lines, ""))

directions <- c("^", ">", "v", "<")
vectors <- list(c(-1, 0), c(0, 1), c(1, 0), c(0, -1))

# Find the guard's starting position and facing direction
for (i in seq_len(nrow(map))) {
  for (j in seq_len(ncol(map))) {
    if (map[i, j] %in% directions) {
      pos <- c(i, j)
      dir <- which(directions == map[i, j])
      map[i, j] <- "." 
      break
    }
  }
  if (exists("pos")) break
}

visited <- matrix(FALSE, nrow = nrow(map), ncol = ncol(map))
visited[pos[1], pos[2]] <- TRUE

repeat {
  move <- vectors[[dir]]
  next_pos <- pos + move

  if (next_pos[1] < 1 || next_pos[1] > nrow(map) || next_pos[2] < 1 || next_pos[2] > ncol(map)) {
    break
  }

  if (map[next_pos[1], next_pos[2]] == "#") {
    dir <- (dir %% 4) + 1  # Turn right
  } else {
    pos <- next_pos
    visited[pos[1], pos[2]] <- TRUE
  }
}

cat(sum(visited), "\n")