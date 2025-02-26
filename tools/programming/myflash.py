import os

with open("temp.jlink", "w") as f:
    f.write("r\nh\nloadfile main.hex \n connect\n exit\n")

os.system("JLink.Exe -device STM32F429ZI -if swd -speed 4800 < temp.jlink")
os.remove("temp.jlink")
