import os

with open("temp.jlink", "w") as f:
    f.write("\nconnect\n\rexit\n")

os.system("JLink.Exe -device STM32F429ZI -if swd -speed 4800 < temp.jlink")
os.remove("temp.jlink")
