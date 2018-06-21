function [ rest_pos ] = PGmotion_find_rest_pos( data )
% finds the home position of the calibaration of the mocap suit

[r,c] = size(data); % find the size of the motion data
rest_pos = ones(1,c); % initiate the column vector of the output

for i = 1:c %initialize loop per column
    rest_pos(1,i) = mean(data(i,:));
    i=i+1; % move to next joint
end
% output is a column vector
end

