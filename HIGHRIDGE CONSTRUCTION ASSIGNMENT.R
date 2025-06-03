# Create a list of workers dynamically
workers <- list()
for (i in 1:443) {
  worker <- list(
    id = i,
    name = paste0("Worker_", i)
  )
  workers[[i]] <- worker
}

# Print first 10 workers
cat("First 10 workers:\n")
for (worker in workers[1:10]) {
  print(worker)
}

# Total workers
cat("\nTotal workers:", length(workers), "\n")

# Generate workers with increasing IDs and random attributes
set.seed(123) # For reproducibility
workers <- list()
for (i in 1:443) {
  workers[[i]] <- list(
    id = i,
    name = paste0("Worker_", i),
    base_salary = sample(5000:100000, 1),
    performance = sample(c("Good", "Average", "Poor"), 1)
  )
}

# Generate payslips
for (worker in workers) {
 > bonus <- if else(worker$performance == "Good", 0.1 * worker$base_salary, 0)
  total <- worker$base_salary + bonus
  
  # Conditional statements for employee level
  if (worker$base_salary > 10000 && worker$base_salary <= 20000) {
    employee_level <- "A1"
  } else if (worker$base_salary > 7500 && worker$base_salary <= 30000) {
    employee_level <- "A5-F"
  } else {
    employee_level <- "Regular"
  }
  
  cat("\nWorker #", worker$id, ":", worker$name, "\n", sep = "")
  cat("Performance:", worker$performance, "\n")
  cat("Salary: $", format(worker$base_salary, big.mark = ",", nsmall = 2), "\n", sep = "")
  cat("Bonus: $", format(bonus, big.mark = ",", nsmall = 2), "\n", sep = "")
  cat("Total: $", format(total, big.mark = ",", nsmall = 2), "\n", sep = "")
  cat("Employee Level:", employee_level, "\n")
}

# Function to generate payment slips with error handling
generate_payment_slips <- function(workers) {
  if (length(workers) == 0) {
    message("No worker data available")
    return(FALSE)
  }
  
  tryCatch({
    for (worker in workers) {
      tryCatch({
        bonus <- ifelse(worker$performance == "Good", 0.1 * worker$base_salary, 0)
        total_payment <- worker$base_salary + bonus
        
        if (is.null(total_payment)) next
        
        # Determine employee level
        if (worker$base_salary > 10000 && worker$base_salary <= 20000) {
          employee_level <- "A1"
        } else if (worker$base_salary > 7500 && worker$base_salary <= 30000) {
          employee_level <- "A5-F"
        } else {
          employee_level <- "Regular"
        }
        
        cat("\n", rep("=", 40), "\n", sep = "")
        cat("PAYMENT SLIP FOR WORKER #", worker$id, "\n", sep = "")
        cat(rep("=", 40), "\n", sep = "")
        cat("Name:", worker$name, "\n")
        cat("Employee Level:", employee_level, "\n")
        cat("Base Salary: $", format(worker$base_salary, big.mark = ",", nsmall = 2), "\n", sep = "")
        cat("Performance:", worker$performance, "\n")
        cat("Bonus: $", format(bonus, big.mark = ",", nsmall = 2), "\n", sep = "")
        cat("Total Payment: $", format(total_payment, big.mark = ",", nsmall = 2), "\n", sep = "")
        cat(rep("=", 40), "\n", sep = "")
      }, error = function(e) {
        message("Error processing worker #", ifelse(is.null(worker$id), "Unknown", worker$id), ": ", conditionMessage(e))
      })
    }
    return(TRUE)
  }, error = function(e) {
    message("System error generating slips: ", conditionMessage(e))
    return(FALSE)
  })
}

# Execute the payment slip generation
generate_payment_slips(workers)
