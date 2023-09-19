import requests
## This is generated from: https://github.com/settings/tokens of your github account
personal_access_token = ""
## Who owns the repo? 
owner = "Utah-CS3550-Fall-2023"

with open("usernames.txt", "r") as file:
    repos = [line.strip() for line in file.readlines()]

def get_latest_actions_status(repo):
    url = f"https://api.github.com/repos/{owner}/{repo}/actions/runs"
    headers = {"Authorization": f"token {personal_access_token}"}

    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        data = response.json()
        if data["workflow_runs"]:
            latest_run = data["workflow_runs"][0]
            return latest_run["conclusion"]
        else:
            return "No workflow runs found"
    else:
        return "Error fetching data"

for repo in repos:
    status = get_latest_actions_status(repo)
    print(f"Repository: {repo}, Latest Status: {status}")
