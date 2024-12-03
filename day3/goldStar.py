import re

with open('day3/input.txt', 'r') as f:
    text = f.read()
    pattern = r"do\(\)|don't\(\)|\bmul\((\d{1,3}),(\d{1,3})\)"
    tokens = re.finditer(pattern, text)
    enabled = True
    total = 0
    for token in tokens:
        match_text = token.group(0)
        if match_text == 'do()':
            enabled = True
        elif match_text == "don't()":
            enabled = False
        else:
            x, y = token.groups()
            if enabled:
                total += int(x) * int(y)
    print(total)
