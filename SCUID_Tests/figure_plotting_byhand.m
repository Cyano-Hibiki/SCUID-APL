%____October 6th, "blank test"
figure(40)
hold on
plot((SCUID_Test_Results(8).TimeUE(:,:)-SCUID_Test_Results(8).TimeUE(1,:))./60, SCUID_Test_Results(8).P1(:,:))
xlabel('time [min]')
ylabel('pressure [mbar]')
title('Oct 6th,  blank , AMES 18')
xline(0,'--',{'M, N2'})
xline(20,'--',{'B, N2'})
xline(25,'--',{'M, N2'})
xline(40,'--',{'B, N2'})


figure(41)
hold on
plot((SCUID_Test_Results(8).TimeUE(:,:)-SCUID_Test_Results(8).TimeUE(1,:))./60, SCUID_Test_Results(8).RH(:,:))
xlabel('time [min]')
ylabel('RH [%]')
title('Oct 6th, blank, AMES 18')
xline(0,'--',{'M, N2'})
xline(20,'--',{'B, N2'})
xline(25,'--',{'M, N2'})
xline(40,'--',{'B, N2'})

figure(42)
hold on
plot((SCUID_Test_Results(8).TimeUE(:,:)-SCUID_Test_Results(8).TimeUE(1,:))./60, SCUID_Test_Results(8).Sensors(:,1:6)./1000)
xlabel('time [min]')
ylabel('resistance P1-6 [kOhm]')
title('Oct 6th, blank, AMES 18')
xline(0,'--',{'M, N2'})
xline(20,'--',{'B, N2'})
xline(25,'--',{'M, N2'})
xline(40,'--',{'B, N2'})


figure(43)
hold on
plot((SCUID_Test_Results(8).TimeUE(:,:)-SCUID_Test_Results(8).TimeUE(1,:))./60, SCUID_Test_Results(8).Temp1(:,:))
xlabel('time [min]')
ylabel('Board Temperature [^o C]')
title('Oct 6th,blank, AMES 18')
xline(0,'--',{'M, N2'})
xline(20,'--',{'B, N2'})
xline(25,'--',{'M, N2'})
xline(40,'--',{'B, N2'})


%________ October 6th NO exposure
figure(50)
hold on
plot((SCUID_Test_Results(7).TimeUE(:,:)-SCUID_Test_Results(7).TimeUE(1,:))./60, SCUID_Test_Results(7).P1(:,:))
xlabel('time [min]')
ylabel('pressure [mbar]')
title('Oct 6th, AMES 18')
xline(6,'--',{'membrane flow N2'})
xline(36,'--',{'bypass flow, N2/NO'})
xline(41,'--',{'-->membrane flow, N2/NO'})
xline(52,'--',{'membrane flow, N2'})
xline(57,'--',{'bypass flow, N2/NO'})
xline(64,'--',{'-->membrane flow, N2/NO'})

figure(51)
hold on
plot((SCUID_Test_Results(7).TimeUE(:,:)-SCUID_Test_Results(7).TimeUE(1,:))./60, SCUID_Test_Results(7).RH(:,:))
xlabel('time [min]')
ylabel('RH [%]')
title('Oct 6th, AMES 18')
xline(6,'--',{'membrane flow N2'})
xline(36,'--',{'bypass flow, N2/NO'})
xline(41,'--',{'-->membrane flow, N2/NO'})
xline(52,'--',{'membrane flow, N2'})
xline(57,'--',{'bypass flow, N2/NO'})
xline(64,'--',{'-->membrane flow, N2/NO'})

figure(52)
hold on
plot((SCUID_Test_Results(7).TimeUE(:,:)-SCUID_Test_Results(7).TimeUE(1,:))./60, SCUID_Test_Results(7).Sensors(:,1:6)./1000)
xlabel('time [min]')
ylabel('resistance P1-6 [kOhm]')
title('Oct 6th, AMES 18')
xline(6,'--',{'membrane flow N2'})
xline(36,'--',{'bypass flow, N2/NO'})
xline(41,'--',{'-->membrane flow, N2/NO'})
xline(52,'--',{'membrane flow, N2'})
xline(57,'--',{'bypass flow, N2/NO'})
xline(64,'--',{'-->membrane flow, N2/NO'})

figure(53)
hold on
plot((SCUID_Test_Results(7).TimeUE(:,:)-SCUID_Test_Results(7).TimeUE(1,:))./60, SCUID_Test_Results(7).Temp1(:,:))
xlabel('time [min]')
ylabel('Board Temperature [^o C]')
title('Oct 6th, AMES 18')
xline(6,'--',{'membrane flow N2'})
xline(36,'--',{'bypass flow, N2/NO'})
xline(41,'--',{'-->membrane flow, N2/NO'})
xline(52,'--',{'membrane flow, N2'})
xline(57,'--',{'bypass flow, N2/NO'})
xline(64,'--',{'-->membrane flow, N2/NO'})


%_______________________ Oct 14th
figure(60)
hold on
plot((SCUID_Test_Results(9).TimeUE(:,:)-SCUID_Test_Results(9).TimeUE(6,:))./60, SCUID_Test_Results(9).P1(:,:))
xlabel('time [min]')
ylabel('pressure [mbar]')
title('Oct 14th, AMES 18')
xline(0,'--',{'B+M, N2'})
xline(28,'--',{'B, N2 - no NO'})
xline(34,'--',{'-->B+M, N2 no NO'})
xline(87,'--',{'B, N2/NO'})
xline(87,'--',{'bypass flow, N2/NO'})
xline(92,'--',{'-->B+M, N2/NO'})

figure(61)
hold on
plot((SCUID_Test_Results(9).TimeUE(:,:)-SCUID_Test_Results(9).TimeUE(6,:))./60, SCUID_Test_Results(9).RH(:,:))
xlabel('time [min]')
ylabel('RH [%]')
title('Oct 14th, AMES 18')
xline(0,'--',{'B+M, N2'})
xline(28,'--',{'B, N2 - no NO'})
xline(34,'--',{'-->B+M, N2 no NO'})
xline(87,'--',{'B, N2/NO'})
xline(87,'--',{'bypass flow, N2/NO'})
xline(92,'--',{'-->B+M, N2/NO'})

figure(62)
hold on
plot((SCUID_Test_Results(9).TimeUE(:,:)-SCUID_Test_Results(9).TimeUE(6,:))./60, SCUID_Test_Results(9).Temp1(:,:))
xlabel('time [min]')
ylabel('Board Temperature [^o C]')
title('Oct 14th, AMES 18')
xline(0,'--',{'B+M, N2'})
xline(28,'--',{'B, N2 - no NO'})
xline(34,'--',{'-->B+M, N2 no NO'})
xline(87,'--',{'B, N2/NO'})
xline(87,'--',{'bypass flow, N2/NO'})
xline(92,'--',{'-->B+M, N2/NO'})

figure(63)
hold on
plot((SCUID_Test_Results(9).TimeUE(:,:)-SCUID_Test_Results(9).TimeUE(6,:))./60, SCUID_Test_Results(9).Sensors(:,1:6)./1000)
xlabel('time [min]')
ylabel('Resistance [Ohm]')
title('Oct 14th, AMES 18')
xline(0,'--',{'B+M, N2'})
xline(28,'--',{'B, N2 - no NO'})
xline(34,'--',{'-->B+M, N2 no NO'})
xline(87,'--',{'B, N2/NO'})
xline(87,'--',{'bypass flow, N2/NO'})
xline(92,'--',{'-->B+M, N2/NO'})


%% _______________________ Oct 18th
%clear; close all; clc;
load("SCUID_Test_Results.mat")
entry = 10;
figure(70)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).P1(:,:))
xlabel('time [min]')
ylabel('pressure [mbar]')
title('Oct 18th, AMES 18')
xline(0,'--',{'B+M, Open SCUID Gas Side'})
xline(7,'--',{'B+M, Close SCUID Gas Side'})
xline(18,'--',{'B'})
xline(23,'--',{'B+M'})
xline(28,'--',{'B'})
xline(33,'--',{'B+M'})
xline(39,'--',{'M'})
xline(44,'--',{'B+M'})

figure(71)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).RH(:,:))
xlabel('time [min]')
ylabel('RH [%]')
title('Oct 18th, AMES 18')
xline(0,'--',{'B+M, Open SCUID Gas Side'})
xline(7,'--',{'B+M, Close SCUID Gas Side'})
xline(18,'--',{'B'})
xline(23,'--',{'B+M'})
xline(28,'--',{'B'})
xline(33,'--',{'B+M'})
xline(39,'--',{'M'})
xline(44,'--',{'B+M'})

figure(72)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).Temp1(:,:))
xlabel('time [min]')
ylabel('Board Temperature [^o C]')
title('Oct 18th, AMES 18')
xline(0,'--',{'B+M, Open SCUID Gas Side'})
xline(7,'--',{'B+M, Close SCUID Gas Side'})
xline(18,'--',{'B'})
xline(23,'--',{'B+M'})
xline(28,'--',{'B'})
xline(33,'--',{'B+M'})
xline(39,'--',{'M'})
xline(44,'--',{'B+M'})

figure(73)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).Sensors(:,1:6)./1000)
xlabel('time [min]')
ylabel('Resistance [Ohm]')
title('Oct 18th, AMES 18')
xline(0,'--',{'B+M, Open SCUID Gas Side'})
xline(7,'--',{'B+M, Close SCUID Gas Side'})
xline(18,'--',{'B'})
xline(23,'--',{'B+M'})
xline(28,'--',{'B'})
xline(33,'--',{'B+M'})
xline(39,'--',{'M'})
xline(44,'--',{'B+M'})

figure(74)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).Sensors(:,7:12)./1000)
xlabel('time [min]')
ylabel('Resistance [Ohm]')
title('Oct 18th, AMES 18')
xline(0,'--',{'B+M, Open SCUID Gas Side'})
xline(7,'--',{'B+M, Close SCUID Gas Side'})
xline(18,'--',{'B'})
xline(23,'--',{'B+M'})
xline(28,'--',{'B'})
xline(33,'--',{'B+M'})
xline(39,'--',{'M'})
xline(44,'--',{'B+M'})

%% _______________________ Oct 20th
%clear; close all; clc;
load("SCUID_Test_Results.mat")
entry = 11;
figure(80)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).P1(:,:))
xlabel('time [min]')
ylabel('pressure [mbar]')
title('Oct 20th, AMES 5')


figure(71)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).RH(:,:))
xlabel('time [min]')
ylabel('RH [%]')
title('Oct 20th, AMES 5')


figure(72)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).Temp1(:,:))
xlabel('time [min]')
ylabel('Board Temperature [^o C]')
title('Oct 20th, AMES 5')


figure(73)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).Sensors(:,1:6)./1000)
xlabel('time [min]')
ylabel('Resistance [Ohm]')
title('Oct 20th, AMES 5')


figure(74)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, SCUID_Test_Results(entry).Sensors(:,7:12)./1000)
xlabel('time [min]')
ylabel('Resistance [Ohm]')
title('Oct 20th, AMES 5')

figure(75)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, O2_sat(:,:))
xlabel('time [min]')
ylabel('O2 Saturation [%]')
title('Oct 20th, AMES 5')

figure(76)
hold on
plot((SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60, O2_col(:,:))
xlabel('time [min]')
ylabel('O2  [%]')
title('Oct 20th, AMES 5')

figure(77)
hold on
plot(O2_col(:,:))
xlabel('time [min]')
ylabel('O2  [%]')
title('Oct 20th, AMES 5')

t_O2_fit=(SCUID_Test_Results(entry).TimeUE(:,:)-SCUID_Test_Results(entry).TimeUE(6,:))./60;