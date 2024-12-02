def is_safe(report):
    if len(report) < 2:
        return True
    diffs = [report[i+1] - report[i] for i in range(len(report)-1)]
    if not all(1 <= abs(d) <= 3 for d in diffs):
        return False
    if all(d > 0 for d in diffs) or all(d < 0 for d in diffs):
        return True
    return False

safe_count = 0

with open('day2/input.txt', 'r') as file:
    for line in file:
        report = list(map(int, line.strip().split()))
        if not report:
            continue
        if is_safe(report):
            safe_count += 1
        else:
            # Try removing each level
            for i in range(len(report)):
                modified_report = report[:i] + report[i+1:]
                if is_safe(modified_report):
                    safe_count += 1
                    break

print(safe_count)