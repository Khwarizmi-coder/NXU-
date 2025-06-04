
# Using variables to create a list of workers dynamically
set.seed(123) # For reproducibility
workers <- list()
for (i in 1:443) {
  workers[[i]] <- list(
    id = i,
    name = paste("Worker", i, sep = "_"),
    base_salary = sample(5000:100000, 1),
    performance = sample(c("Good", "Average", "Poor"), 1),
    gender = sample(c("Male", "Female"), 1)
  )
}

get_employee_bonus <- function(worker) {
  bonus <- ifelse(worker$performance == "Good", 0.1 * worker$base_salary, 0)
  return(bonus)
}

get_employee_level <- function(worker) {
  base_salary <- worker$base_salary
  employee_level <- ""
  if (base_salary > 10000 && base_salary < 20000) {
    employee_level <- "A1"
  } else if (base_salary > 7500 && base_salary < 30000 && worker$gender == "Female") {
    employee_level <- "A5-F"
  }
  return(employee_level)
}

generate_payment_slips <- function(workers) {
  if (length(workers) == 0) {
    cat("No worker data available\n", file = stderr())
    return(FALSE)
  }
  tryCatch({
    for (worker in workers) {
      tryCatch({
        bonus <- get_employee_bonus(worker)
        total_payment <- worker$base_salary
        if (is.null(total_payment)) {
          next
        }
        employee_level <- get_employee_level(worker)
        cat("\n", strrep("=", 40), "\n")
        cat(sprintf("PAYMENT SLIP FOR WORKER#%d\n", worker$id))
        cat(strrep("=", 40), "\n")
        cat(sprintf("Employee_level: %s\n", employee_level))
        cat(sprintf("Base_salary: $%.2f\n", worker$base_salary))
        cat(sprintf("performance: %s\n", worker$performance))
        cat(sprintf("Bonus: $%.2f\n", bonus))
        cat(sprintf("Total Payment: $%.2f\n", total_payment + bonus))
        cat(strrep("=", 40), "\n")
      }, error = function(e) {
        cat(sprintf("Error processing worker #%s: %s\n", ifelse(is.null(worker$id), "Unknown", worker$id), conditionMessage(e)), file = stderr())
        next
      })
    }
    return(TRUE)
  }, error = function(e) {
    cat(sprintf("System error generating slips: %s\n", conditionMessage(e)), file = stderr())
    return(FALSE)
  })
}

generate_payment_slips(workers)

