#Using variables to create a list of workers dynamically
import sys
import random
workers=[]
for i in range(1,444):
    workers.append({
        "id":i,
        "name":f"Worker_{i}",
        "base_salary":random.randint(5000,100000),
        "performance":random.choice(["Good","Average","Poor"]),
        "gender": random.choice(["Male", "Female"]),
    })
    #payslip generate
# for worker in workers:
#     bonus=0.1 * worker["base_salary"] if worker["performance"]=="Good"else 0
#     total=worker["base_salary"]+ bonus
#     print(f"\nWorker#{worker['id']}:{worker['performance']}")
#     print(f"Salary;${worker['performance']}")
#     print(f"Bonus:${bonus}")
#     print(f"Total:${total}")

def get_employee_bonus(worker):
    bonus = 0.1 * worker["base_salary"] if worker["performance"] == "Good" else 0
    return  bonus


#conditional statements within the loop
def get_employee_level(worker):
    base_salary =  worker["base_salary"]
    employee_level=""
    if base_salary > 10000 and base_salary  <20000:
        employee_level="A1"
    elif  base_salary > 7500 and base_salary  <30000 and worker.gender=="Female":
        employee_level="A5-F"

    return employee_level

#exceptions to prevent errors
def generate_payment_slips(workers):
    if not workers:
        print("No worker data available",file=sys.stderr)
        return False
    try:
        for worker in workers:
            try:
                bonus = get_employee_bonus(worker)
                total_payment= worker['base_salary']
                if total_payment is None:
                    continue
                employee_level=get_employee_level(worker)
                print("\n"+"="* 40)
                print(f"PAYMENT SLIP FOR WORKER#{worker['id']}")
                print("="*40)
                print(f"Employee_level:{employee_level}")
                print(f"Base_salary:${worker['base_salary']:,.2f}")
                print(f"performance:{worker["performance"]}")
                print(f"Bonus:${bonus:,.2f}")
                print(f"Total Payment:${total_payment+bonus:,f}")
                print("="*40)
            except Exception as e:
                print(f"Error processing worker #{worker.get('id','Unknown')}:{str(e)}",file=sys.stderr)
                continue
        return True
    except Exception as e:
        print(f"System error generating slips:{str(e)}",file=sys.stderr)
        return False



generate_payment_slips(workers)