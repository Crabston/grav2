import sys
import json

ENV_FILE = '.grav.env'

# Read JSON data from standard input
data = json.load(sys.stdin)

# List to store environment variables
envs = []

# Parse JSON data
# Example item: "NAME": {"computed": "SECRET", "note": "GRAV_PATH"}
for item in data:
    name = item
    gravPath = data[item]['note']
    secret = data[item]['computed']

    # Skip items without a note (they don't get used by grav)
    if data[item]['note'] == '':
        continue

    envs.append(f'{gravPath}={secret}\n')

# Write the parsed data to a file
with open(ENV_FILE, 'w') as f:
    f.writelines(envs)