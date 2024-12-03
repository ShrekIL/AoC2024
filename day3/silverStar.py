import re


with open('day3/input.txt', 'r') as f:
    text = f.read()
    pattern = r'\bmul\((\d{1,3}),(\d{1,3})\)'
    matches = re.findall(pattern, text)
    total = sum(int(x) * int(y) for x, y in matches)
    print(total)
