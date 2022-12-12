# Raspberry Pi

source:https://elinux.org/RPI_vcgencmd_usage

<br>

### General command
`watch -n1 'vcgencmd measure_temp && vcgencmd measure_clock arm && vcgencmd get_throttled'`

<br>

---  

<br>
### To check frequency
` watch -n1 vcgencmd measure_clock arm`


### To read cpu temps  
`vcgencmd measure_temp`  
<br><br>

### Lightning symbol - under power
To check if having power supply issue:  
`vcgencmd get_throttled`

0: under-voltage (0xX0001)  
1: arm frequency capped (0xX0002 or 0xX0003 with under-voltage)  
2: currently throttled (0xX0004 or 0xX0005 with under-voltage)  

16: under-voltage has occurred (0x1000X)  
17: arm frequency capped has occurred (0x2000X or 0x3000X also under-voltage occurred)  
18: throttling has occurred (0x4000X or 0x5000X also under-voltage occurred)  

under-voltage occurs when voltage drops below 4.63V. The Pi is throttled  
arm frequency capped occurs with temp > 80'C  
over-temperature occurs with temp > 85'C. The Pi is throttled  

Throttling removes turbo mode, which reduces core voltage, and sets arm and gpu frequencies to non-turbo value.  
Capping just limits the arm frequency (somewhere between 600MHz and 1200MHz) to try to avoid throttling.  
If you are throttled and not under-voltage then you can assume over-temperature. (confirm with vcgencmd measure_temp).  
<br><br>


### To check output flags  

`sudo vcgencmd get_throttled | cut -dx -f2- | xargs -I % echo "obase=2; ibase=16; %" | bc`  
<br>
```
0b01110000000000000010  
  ||||            ||||_ Under-voltage detected  
  ||||            |||_ Arm frequency capped  
  ||||            ||_ Currently throttled  
  ||||            |_ Soft temperature limit active  
  ||||_ Under-voltage has occurred since last reboot  
  |||_ Arm frequency capped has occurred  
  ||_ Throttling has occurred  
  |_ Soft temperature limit has occurred  
```
https://harlemsquirrel.github.io/shell/2019/01/05/monitoring-raspberry-pi-power-and-thermal-issues.html

Easier to read output  
`sudo vcgencmd get_throttled | cut -d= -f2- | xargs -I {} python3 -c 'binStr=format(int("{}",16),"#020b");[ print(str(i).rjust(3," "), end="") for i in range(len(binStr))]; print();[print(k.rjust(3, " "), end="") for i,k in enumerate(binStr)];print()'`

`sudo vcgencmd get_throttled | cut -d= -f2- | xargs -I {} python3 -c "print(format(int('{}',16),'#020b'))"`  
`sudo vcgencmd get_throttled | awk -Fx '{print $2}' | xargs -I % echo "obase=2; ibase=16; %" | bc`  

<br>

Insert into bash aliases  
```quote 
check_throttled() {
      sudo vcgencmd get_throttled | cut -d= -f2- | xargs -I {} python3 -c 'binStr=format(int("{}",16),"#020b");[ print(str(i).rjust(3," "), end="") for i in range(len(binStr))]; print();[print(k.rjust(3, " "), end="") for i,k in enumerate(binStr)];print()
      echo -e "\n2 - Under-voltage has occurred since last reboot  
3 - Arm frequency capped has occurred  
4 - Throttling has occurred  
5 - Soft temperature limit has occurred 

16 - Soft temperature limit active 
17 - Currently throttled
18 - Arm frequency capped
19 - Under-voltage detected"
}
```


<br><br><br>
