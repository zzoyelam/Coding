samplefreq = 1e3;
samplerate = 1/samplefreq;
%% Beta (13-30 Hz)
f_beta = 20;
t_major = 0:samplerate:2; %1kHz sample frequency for a duration of 1 sec 
beta = sin(2*pi*f_beta*t_major);
plot(t_major,beta);
ylim([0, 1.5]);

%% Alpha (8-13 Hz)
f_alpha = 12;
t = 0:samplerate:1; %1kHz sample frequency for a duration of 1 sec 
alpha = sin(2*pi*f_alpha*t);
plot(t,alpha);
ylim([0, 1.5]);

%% Theta (4-8 Hz)
f_theta = 7;
t = 0:samplerate:1; %1kHz sample frequency for a duration of 1 sec 
theta = sin(2*pi*f_theta*t);
plot(t,theta);
ylim([0, 1.5]);

%% Delta (0.5-4 Hz)
f_delta = 3;
t_minor = 0:samplerate:0.5;
delta = sin(2*pi*f_delta*t_minor);
plot(t_minor,delta);
ylim([0, 1.5]);

%% Composition of EEG
EEG = horzcat(beta,alpha(2:end),theta(2:end),delta(2:end));
endtime = (length(EEG)-1)/(samplerate);
time = 0:samplefreq:endtime;
plot(EEG);

%% Add artificial noise
EEG_noise = awgn(EEG,10,'measured');
plot(EEG_noise);
EEG_noise2 = randn(size(EEG_noise));
plot(EEG_noise2);
EEG_raw = EEG_noise + EEG_noise2;
plot(EEG_raw);
%% FFT
figure()
L = 4001;
EEG_fft = fft(EEG_raw);
P2 = abs(EEG_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = samplefreq*(0:(L/2))/L;
subplot(2,1,2)
plot(f,P1)
title('Single-Sided Amplitude Spectrum of Corrupted')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 100]);
subplot(2,1,1)
Y = fft(EEG);
P2c = abs(Y/L);
P1c = P2c(1:L/2+1);
P1c(2:end-1) = 2*P1c(2:end-1);
plot(f,P1c)
title('Single-Sided Amplitude Spectrum of Original')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 100]);
%% Create Time Windows
% Work in progress...

%% Sorting EEG via Modulated Frequencies
beta_time = 0;
alpha_time = 0;
theta_time = 0;
delta_time = 0;
for i = 1:length(f)
    if f(i) >= 13
        beta_mod = 26.5 + 13.5*cos(2*pi*t_major*f(i));
        beta_time = beta_time + 1;
    elseif f(i) < 13 && f(i) >= 8
        alpha_mod = 10.5 + 2.5*cos(2*pi*t*f(i));
        alpha_time = alpha_time + 1;
    elseif f(i) < 8 && f(i) >= 4
        theta_mod = 6 + 2*cos(2*pi*t*f(i));
        theta_time = theta_time + 1;
    else
        delta_time = delta_time + 1;
    end
    total_time = beta_time + alpha_time + theta_time + delta_time;
end
X = [(beta_time)/total_time, (alpha_time)/total_time, (theta_time)/total_time, (delta_time)/total_time];
labels = {'Beta','Alpha','Theta','Delta'};
pie(X,labels);

%% EEG Check
%Work in progress...
%Y = 'Beta waves, so concentrating :)';
%N = 'No Beta waves, so not concentrating :(';
%{
for i = 1:length(EEG)
    if i >= pwelch(sin(2*pi*13*t))
        disp(Y)
    else
        disp(N)
    end
end
%}

[pks,pksloc] = findpeaks(P1c,'SortStr','descend');

beta = pks(1);
betafreq = f(pksloc(1));

alpha = pks(2);
alphafreq = f(pksloc(2));

theta = pks(3);
thetafreq = f(pksloc(3));

delta = pks(4);
deltafreq = f(pksloc(4));

total = beta + alpha + theta + delta;
conc_perc = round((beta/total),2);
conc_thresh = 0.5;
reached = ['Great job! You were concentrating ',num2str(conc_perc*100),' % of the time.'];
notreached = ['You were concentrating ',num2str(conc_perc*100),' % of the time. Keep practicing, and you will get there!'];

if conc_perc >= conc_thresh
    disp(reached);
elseif conc_perc < conc_thresh
    disp(notreached);
end
X = [(beta)/total, (alpha)/total, (theta)/total, (delta)/total];
labels = {'Beta','Alpha','Theta','Delta'};
pie(X,labels);
