sim('CxTh_Suff_Neurosci_2004');
%------------------Output signal----------------------------
axes('position', [0.1 0.7 0.85 0.15]) 
epoch3 = 5001:25000;
plot(V_Cx(epoch3,1)- V_Cx(epoch3(1),1), -V_Cx(epoch3,2), 'k')
title('Simulated epoch','Fontsize', 16)
ylabel('mV','Fontsize', 16)
set(gca, 'Fontsize', 16)
axis([0 20 -5 5])
xlabel('seconds','Fontsize', 16, 'VerticalAlignment','middle')

%------------------------------ Spectrum normal ------------------------------
axes('position', [0.1 0.35 0.375 0.15]) 

epoch1 = 5000:10000;
V_Cx1(epoch1,2) = V_Cx(epoch1,2)./std(V_Cx(epoch1,2));


h = spectrum.welch('Hann', 512);   %Welch spectral estimation.
h.overlappercent = 25;
h.FFTLength = 'UserDefined';
Hpsd = psd(h,detrend(V_Cx1(epoch1,2)),'Fs',1000,'NFFT',1024);  
plot(Hpsd.Frequencies, 5*log(Hpsd.Data),'k')
xlabel('Hz','Fontsize', 16)
ylabel('dB','Fontsize', 16, 'VerticalAlignment','Middle')
title('Spectrum - normal','Fontsize', 16)
set(gca, 'Fontsize', 16,'XTick', [0 10 20 30 40 50])
axis([0 50 -70 0])

%------------------------------ Spectrum paroxysmal------------------------------
axes('position', [0.575 0.35 0.375 0.15]) 
epoch2 = 18000:23000;
V_Cx1(epoch2,2) = V_Cx(epoch2,2)./std(V_Cx(epoch2,2));
Hpsd = psd(h,detrend(V_Cx1(epoch2,2)),'Fs',1000,'NFFT',1024);
plot(Hpsd.Frequencies, 5*log(Hpsd.Data),'k')
title('Spectrum - paroxysmal','Fontsize', 16)
xlabel('Hz','Fontsize', 16)
ylabel('dB','Fontsize', 16, 'VerticalAlignment','Middle')
set(gca, 'Fontsize', 16,'XTick', [0 10 20 30 40 50])

axis([0 50 -70 0])



