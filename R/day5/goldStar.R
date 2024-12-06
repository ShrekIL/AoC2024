library(dplyr)

file_path <- "R/day5/input.txt"

read_input <- function(file_path) {
  input <- readLines(file_path)
  separator_index <- which(input == "")
  ordering_rules <- input[1:(separator_index - 1)]
  updates <- input[(separator_index + 1):length(input)]
  list(ordering_rules = ordering_rules, updates = updates)
}

# Check if an update is in the correct order
is_correct_order <- function(update, rules) {
  pages <- as.numeric(unlist(strsplit(update, ",")))
  for (rule in rules) {
    rule_pages <- as.numeric(unlist(strsplit(rule, "\\|")))
    if (all(rule_pages %in% pages)) {
      if (which(pages == rule_pages[1]) > which(pages == rule_pages[2])) {
        return(FALSE)
      }
    }
  }
  return(TRUE)
}

# Find the middle page number of an update
middle_page <- function(update) {
  pages <- as.numeric(unlist(strsplit(update, ",")))
  return(pages[ceiling(length(pages) / 2)])
}

# Order an update correctly based on the rules
order_update <- function(update, rules) {
  pages <- as.numeric(unlist(strsplit(update, ",")))
  ordered_pages <- pages
  repeat {
    changed <- FALSE
    for (rule in rules) {
      rule_pages <- as.numeric(unlist(strsplit(rule, "\\|")))
      if (all(rule_pages %in% ordered_pages)) {
        idx1 <- which(ordered_pages == rule_pages[1])
        idx2 <- which(ordered_pages == rule_pages[2])
        if (idx1 > idx2) {
          ordered_pages <- ordered_pages[-c(idx1, idx2)]
          ordered_pages <- append(ordered_pages, rule_pages[1], after = idx2 - 1)
          ordered_pages <- append(ordered_pages, rule_pages[2], after = idx2)
          changed <- TRUE
        }
      }
    }
    if (!changed) break
  }
  return(ordered_pages)
}

# Process the updates
process_incorrect_updates <- function(file_path) {
  input_data <- read_input(file_path)
  ordering_rules <- input_data$ordering_rules
  updates <- input_data$updates
  
  sum_middle_pages <- 0
  for (update in updates) {
    if (!is_correct_order(update, ordering_rules)) {
      ordered_update <- order_update(update, ordering_rules)
      sum_middle_pages <- sum_middle_pages + middle_page(paste(ordered_update, collapse = ","))
    }
  }
  
  return(sum_middle_pages)
}

result <- process_incorrect_updates(file_path)
print(result)