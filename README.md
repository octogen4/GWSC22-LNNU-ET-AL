#  GWSC22-LNNU-ET-AL
## Group Members

Wenzhong Liu (leader); JiaNan Chi; Jinyu Li; Lu Yin; Aojia Xu; Guodong Cheng; Yupeng E; Liming Zheng; Jingyi Jia; Gan Luo;

刘文中（辽宁师范），迟嘉楠（辽宁师范），李金雨（东北大学），尹璐（西江大学），许奥佳（河南大学），程国栋（河南大学），郑力铭(北师大)，鄂宇鹏(兰大)，贾静宜(北理工)，罗淦(华科)

## Contents

[./CJN](https://github.com/octogen4/GWSC22-LNNU-ET-AL/tree/master/CJN) Uploaded a complete copy of Soumya D. Mohanty's [GWSC](https://github.com/mohanty-sd/GWSC)

Our codes of Lab1-Lab6 are in [./LWZ](https://github.com/octogen4/GWSC22-LNNU-ET-AL/tree/master/LWZ), Lab6 is also done seperately in [./ZLM](https://github.com/octogen4/GWSC22-LNNU-ET-AL/tree/master/ZLM)

[./report](https://github.com/octogen4/GWSC22-LNNU-ET-AL/tree/master/report) contains the report slides and some results of Lab2 (gif figures)

## Codes of the Labs


### Lab1

test.m
  >Processing the test signals, plot periodograms and spectrograms
  
sigfuns.m                   
  >Test signal functions , written in a function interface
  
SigmaData.m                 
  >Class to store the signal for processing
  
testfilters.m               
  >Exercises on filters

### Lab2

Codes in the 3 dirs does:
>task1_Lantenna_patterns   
  >>Plot the antenna pattern of a given form
  
>task2_L_AP_with_tenser    
  >>Calculate the pattern functioins for the L-shaped ground base detector with tensors, considering burst and inspiral cases.

>task_toyLISA              
  >>Antenna pattern functions, response signals for LISA toy model

Results shown in gif. figures are stored in [./report/fig/gif](https://github.com/octogen4/GWSC22-LNNU-ET-AL/tree/master/report/fig/gif)
    
### Lab3

testData.m                  
>Exercise on data whitening, results are shown in /report/report_lwz.pdf

testLIGOnoise.m             
>Generate colored noise with initial LIGO PSD

### Lab4

testglrtqcsig.m 
>Clculate GLRT of the data, noise PSD is a special form.

testsignificance.m
>Clculate significane of the data for a given signal template. We find that for all three data the significance are quite large (up to 0.8), meaning that the existance or the signal is highly unimpossible.

### Lab5
GLRT test for data with a quadratic chirp (QC) signal applying PSO algorithm. (With an arbitarily chosen PSD)

llrqc.m
> GLRT for QC template, with the method in Lab4

testllrqc.m
> Test llrqc to make sure it works well.

glrtqcsig4pso.m
> Where llrqc is adapted for PSO

crcbqcpso_colpsd.m
> Upload parameters to PSO, and get results.

crcbqcsig_colpsd.m
> Generate the QC signal, we only removed the input variable A since it is not needed.

crcbgenqcdata_colpas.m
> Generate data with colored PSD. We use it as a input to the PSO.


test_crcbqcpso_colpsd.m
> Run PSO, some reusults are shown in [./report](https://github.com/octogen4/GWSC22-LNNU-ET-AL/tree/master/report)


### Lab6
test.m
> Do the MDC job with codes of Lab5. We estimated the correct values of [a1,a2,a3] successfully.

## References

Thank Professor [Soumya D. Mohanty](https://github.com/mohanty-sd/) for this wonderful course.
Link to original GWSC codes  https://github.com/mohanty-sd/GWSC

