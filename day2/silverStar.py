def is_safe(report):
    diffs = [report[i+1] - report[i] for i in range(len(report)-1)]
    
    if not all(abs(d) >= 1 and abs(d) <= 3 for d in diffs):
        return False
    
    if all(d > 0 for d in diffs) or all(d < 0 for d in diffs):
        return True
    else:
        return False

safe_count = 0

with open('day2/input.txt', 'r') as file:
    for line in file:
        report = list(map(int, line.strip().split()))
        if report:
            if is_safe(report):
                safe_count += 1

print(safe_count)