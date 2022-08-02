% This script reads the sensor data from Chip 5 taken on 6/16/2022.
% It does baseline correction on the data, and finds the response vs
% concentration plot.
% This script only deals with the data from Pads 7-12.
% Author: Jerry Chen
% Date Created: 7/13/2022
% Last Updated: 7/13/2022

%% OPTIONS
clear; close all; clc;
% Some Options
% entry index in struct.
entry = 18;
% - Ignore result of relative humidity check. If true, the program will
%       proceed even if relative humidity is not zero.
ignore_rh_chk = true;
% - Enable/disable response data smoothing (using movmean)
rsp_smooth = true;
% - Enable/disable manual step width (in seconds)
step_man_range = true;
step_man_width = 180;
% - Hide/Show Figures:
minimize_figures = false;
if minimize_figures == true
    figure_state = "minimized";
else
    figure_state = "normal";
end
% - Time window finding method: 
% ----- true  = auto define from flow file info
% ----- false = manually pick window
time_wndw_auto_find = false;
% ----- If use auto find, please fill in the following flow file info

if time_wndw_auto_find == true
    n_run = 3;                  % number of runs
    n_expo = 7;                 % number of total exposures per run
    t_expo = 1 * 60;            % exposure duration in seconds
    t_pre_purge = 10 * 60;      % pre-purge time in seconds
    t_exp_purge = 5 * 60;       % purge time after each exposure in seconds
    t_post_purge = 10 * 60;     % purge time after the last run is done
    t_i = t_pre_purge + n_expo * (t_expo + t_exp_purge) + t_post_purge;
    t_f = t_i + t_pre_purge + n_expo * (t_expo + t_exp_purge) + t_post_purge;
else
    % ----- If use manual find, define the time window in seconds below.
    t_i = 3.8 * 60 * 60;
    t_f = 4.8 * 60 * 60;
end

%% LOADING DATA

% I put the .mat file in the same directory as this script. Make sure you
% specify the directory when you use this script.
load("CNT_Results_NO.mat")

%% DATA PROCESSING
% Define start of collection to be zero second.
time = CNT_Results_NO(entry).timeE - CNT_Results_NO(entry).timeE(1);
% define the time window interested
run_range = find(time >= t_i & time <= t_f);
% pick out that time period
time_wndw = time(run_range);
% Check relative humidity within the time period. If not consistently zero,
% notify. 
if mean(CNT_Results_NO(entry).rh) ~= 0
    disp('Relative Humidity is NOT consistently zero!')
    if ignore_rh_chk == false
        disp('The script will terminate itself due to non-zero RH!')
        return
    else
        disp('You asked to ignore non-zero RH!')
        disp('The script will proceed!')
    end
else
    disp('Relative Humidity is consistently zero.')
end


% pick out concentration data in that period
noppm_wndw = CNT_Results_NO(entry).noppm(run_range);
NO_free_indices = find(~noppm_wndw);

% Process the noppm data to remove pre-spikes.
noppm_spike = figure('Name', 'NO Spike Removal', 'NumberTitle', 'off');
noppm_spike.WindowState = figure_state;
plot(time_wndw, noppm_wndw, 'r-'); hold on;

noppm_wndw_rmspk = hampel(noppm_wndw, 15);
plot(time_wndw, noppm_wndw_rmspk, 'b-', LineWidth=2); 
title('NO Concentration over time')
legend('Original Data', 'Pre-Spikes Removed')
xlabel('Time (s)')
ylabel('Concentration')
hold off

% Auto detect start and end of exposure
stp_i = detect_start(noppm_wndw_rmspk);
disp('beginings')
disp(stp_i)
stp_f = zeros(size(stp_i));
if step_man_range == false
    stp_f = detect_end(noppm_wndw_rmspk);
else
    for stp = 1:length(stp_i)
        [~, end_ind] = min(abs((time_wndw(stp_i(stp)) + step_man_width)-time_wndw));
        stp_f(stp) = end_ind;
    end
    disp('endings')
    disp(stp_f)
end
disp('intervals')
disp(time_wndw(stp_f) - time_wndw(stp_i))
%%
% average concentration within each exposure
noppm_stp_avg = zeros(size(stp_i));
for step = 1:length(stp_i)
    noppm_stp_avg(step) = mean(noppm_wndw_rmspk(stp_i(step):stp_f(step)));
end

% Plotting response vs concentration (raw response)
rsp_vs_noppm = figure('Name', 'Response vs. Concentration', ...
    'NumberTitle', 'off');
rsp_vs_noppm.WindowState = figure_state;
tiledlayout(1,1)
ax1 = nexttile;
hold(ax1, "on")
legend()
title('Response at Different Added NO Concentration');
subtitle(strcat('Chip ', num2str(CNT_Results_NO(entry).chip), ', Pads 7-12, ', CNT_Results_NO(entry).addinfo));
xlabel('NO Concentration');
ylabel('Response');

% Plotting response over time (baseline corrected)
rsp_blc = figure('Name', 'Response - Baseline Corrected', ...
    'NumberTitle', 'off');
rsp_blc.WindowState = figure_state;
tiledlayout(1,1)
ax2 = nexttile;
hold(ax2, "on")
legend()
title('Response Over Time - Baseline Corrected');
subtitle("Chip " + num2str(CNT_Results_NO(entry).chip) + " Pads 7-12, " + ...
    CNT_Results_NO(entry).addinfo);
xlabel('Time (s)')
ylabel('Response');

% Plotting response over time (raw)
rsp_raw = figure('Name', 'Response - Raw Data', ...
    'NumberTitle', 'off');
rsp_raw.WindowState = figure_state;
tiledlayout(1,1)
ax3 = nexttile;
hold(ax3, "on")
legend()
title('Response Over Time - Raw Data');
subtitle("Chip " + num2str(CNT_Results_NO(entry).chip) + " Pads 7-12, " + ...
    CNT_Results_NO(entry).addinfo);
xlabel('Time (s)')
ylabel('Response');
%%
for pad = 7:12
    % pick out data for specific pad
    r_pad = CNT_Results_NO(entry).r(:,pad);
    r_pad_wndw = r_pad(run_range);

    % normalize data using r0 = response at end of pre-purge
    r0 = r_pad_wndw(stp_i(1)-10);
    r_pad_wndw_norm = (r_pad_wndw)./r0 * 100;
    plot(ax3, time_wndw, movmean(r_pad_wndw_norm, 15), ...
        DisplayName=['Pad ' num2str(pad)])

    rsp_raw = figure('Name', "Pad "+pad+" Response - Raw", 'NumberTitle', 'off');
    rsp_raw.WindowState = figure_state;
    plot(time_wndw, movmean(r_pad_wndw_norm,15)); hold on;
   
    %　BASELINE CORRECTION
    % Curve fitting on data when there isn't NO exposure
    X = time_wndw(NO_free_indices);
    Y = r_pad_wndw_norm(NO_free_indices);
    [r_pad_wndw_blfit, gof] = fit(X, Y, 'exp1');
    
    % Visual check of fit
    plot(r_pad_wndw_blfit, time_wndw, r_pad_wndw_norm);
    title('Response Before Baseline Correction')
    subtitle("chip " + num2str(CNT_Results_NO(entry).chip) + " - pad " + ...
        num2str(pad) + " - date: " + CNT_Results_NO(entry).addinfo)
    hold off;
    disp(gof)

    % Subtracting baseline from original response data
    r_pad_wndw_bl = r_pad_wndw_blfit(time_wndw);
    r_pad_wndw_blred = r_pad_wndw_norm - r_pad_wndw_bl;
    disp(length(r_pad_wndw_blred))
    [r_pad_wndw_blred_rmol, TF] = rmoutliers(r_pad_wndw_blred, 'mean');
    rm_indices = find(TF);
    time_wndw_rmol = time_wndw;
    time_wndw_rmol(rm_indices) = [];

    disp(length(time_wndw_rmol))
    disp(length(r_pad_wndw_blred_rmol))
    
    rsp_blc = figure('Name', "Pad "+pad+" Response - Baseline Corrected", ...
        'NumberTitle', 'off');
    rsp_blc.WindowState = figure_state;
    if rsp_smooth == true
        r_pad_wndw_blred_rmol = movmean(r_pad_wndw_blred_rmol, 15);
    end
    plot(time_wndw_rmol, r_pad_wndw_blred_rmol)
    title('Response After Baseline Correction')
    subtitle("chip " + num2str(CNT_Results_NO(entry).chip) + " - pad " + ...
        num2str(pad) + " - date: " + CNT_Results_NO(entry).addinfo)
    
    % Add plot to response over time graph (all pads in one)
    plot(ax2, time_wndw_rmol, r_pad_wndw_blred_rmol, ...
        DisplayName=['Pad ' num2str(pad)])
    

    % Add plot to response vs concentration graph (all pads in one)
    max_rsp = zeros(size(stp_i));
    for step = 1:length(stp_i)
        max_rsp(step) = max(r_pad_wndw_blred_rmol(stp_i(step):stp_f(step)));   
    end
    plot(ax1, noppm_stp_avg, max_rsp, '-.', DisplayName=['Pad ' num2str(pad)])
end

%% CUSTOM FUNCTIONS
% Detect Start of Exposure
function start_indices = detect_start(noppm)
    start_indices = [];
    for i = 16:length(noppm)-15
        if noppm(i) ~= 0
            if noppm(i-15:i-1) ==0
                if noppm(i+1:i+15) ~= 0
                    start_indices = [start_indices; i];
                end
            end
        end
    end
    disp('Found the start of exposures at the following indices:');
    disp(start_indices)
end
% Detect End of Exposure
function end_indices = detect_end(noppm)
    end_indices = [];
    for i = 16:length(noppm)-15
        if noppm(i) == 0
%             if noppm(i+1:i+15) ==0
                if noppm(i-15:i-1) ~= 0
                    end_indices = [end_indices; i];
                end
%             end
        end
    end
    disp('Found the end of exposures at the following indices:');
    disp(end_indices)
end
