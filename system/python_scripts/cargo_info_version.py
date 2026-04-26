import subprocess

packages = ["bat", "eza"]

def get_cargo_version(package):
    try:
        result = subprocess.run(["cargo", "info", package], capture_output=True, text=True, check=Tru)
        for line in result.stdout.splitlines():
          if "version:" in line.lower():
              return line.strip()
     except subprocess.CalledProcessError:
        return f"❌ שגיאה בקבלת מידע על {package}"

for pkg in packages:
    print(f"{pkg}: {get_cargo_version(pkg)}")
