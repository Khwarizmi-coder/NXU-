#Using variables to create a list of workers dynamically
import sys

workers=[]
for i in range(1,444):
    worker={
        "id":i,
        "name":f"Worker_{i}",
    }
    workers.append(worker)
    #print first 10 workers to see if it works
    print("first 10 workers:")
    for worker in workers[:10]:
        print(worker)
#Total workers
print(f"\nTotal workers:{len(workers)}")
#Generate workers with increasing IDs
import random
workers=[]
for i in range(1,444):
    workers.append({
        "id":i,
        "name":f"Worker_{i}",
        "base_salary":random.randint(5000,100000),
        "performance":random.choice(["Good","Average","Poor"]),
    })
    #payslip generate
for worker in workers:
    bonus=0.1 * worker["base_salary"] if worker["performance"]=="Good"else 0
    total=worker["base_salary"]+ bonus
print(f"\nWorker#{worker['id']}:{worker['performance']}")
print(f"Salary;${worker['performance']}")
print(f"Bonus:${bonus}")
print(f"Total:${total}")
#conditional statements within the loop
if 10000 < worker["base_salary"] <=20000:
    employee_level="A1"
elif 7500 < worker["base_salary"] <=30000:
    employee_level="A5-F"
#exceptions to prevent errors
def generate_payment_slips(workers):
    if not workers:
        print("No worker data available",file=sys.stderr)
        return false
    try:
        for worker in workers:
            try:
                total_payment:calculate_payment(worker)
                if total_payment is None:
                    continue
                employee_level=get_employee_level(worker["base_salary"])
                print("\n"+"="* 40)
                print(f"PAYMENT SLIP FOR WORKER#{worker['id']}")
                print("="*40)
                print(f"Employee_level:{employee_level}")
                print(f"Base_salary:${worker['base_salary']:,.2f}")
                print(f"performance:{worker[performance_salary]}")
                print(f"Bonus:${bonus:,.2f}")
                print(f"Total Payment:${total_payment:,.2f}")
                print("="*40)
            except Exception as e:
                print(f"Error processing worker #{worker.get('id','Unknown')}:{str(e)}",file=sys.stderr)
            continue
            return True
    except Exception as e:
        print(f"System error generating slips:{str(e)}",file=sys.stderr)
        return False

