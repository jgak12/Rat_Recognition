
%Written by Maya
%Debugged by John ~1 hour

function freeze_plot = freezing(table)

%%takes a table of rat position data and outputs a plot with the amount
%%of freezing in each minute of the video

%diff of frames to check distance
frame_diff = 5;
%array to represent all time points with freezing t/f
freezing_times = zeros(1, height(table));
%threshold of distance to count as freezing t/f
threshold = 10;

length = height(table);

%loop through entire table every frame diff
for ii = 1:frame_diff:length-1
    %if above threshold, set that point in time array to true
    if distance_traveled_version2(table, ii, ii +frame_diff,false) > threshold
        freezing_times(((ii-1)/frame_diff) + ii) = 1;
    end
end

%cutoff for a minute in time array
times_per_min = round(180 / frame_diff);

min_sums = [];

for ii = 1:times_per_min:size(freezing_times,2)-1
    if ii + times_per_min < size(freezing_times,2)-1
        min_sums = [min_sums sum(freezing_times(ii:(times_per_min + ii)))];
    else
        min_sums= [min_sums sum(freezing_times(ii:end))];
    end
end

freeze_plot = figure;

x_axis = 1:size(min_sums,2);
y_axis = min_sums;
plot(x_axis, y_axis);
xlabel('minutes');
ylabel('freezing duration');
title('Amount of time freezing');









