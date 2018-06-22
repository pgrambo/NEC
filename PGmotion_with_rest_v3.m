function [ individual,total ] = PGmotion_with_rest_v3( data, rest )
% calculates the joint travel of the mocap suit wrt the rest position
format compact
[r,c] = size(data); % find the size of the motion data
individual = ones(1,c); % initiate the column vector of the output
total = 0; %initialize total path length
for i = 1:c
    jointdata=data(:,i);  % each colum is the data from a particular joint , size 5000x1
    jointdata_ave = mean(jointdata); % find the average position of the joint, size 1x1
    jointmotion = jointdata_ave - rest(i); % motion of the joint, average position minus home position, 1x1
    individual(i) = abs(jointmotion); % write the joint path to the output vector
    i=i+1; % move to next joint
end
total = sum(individual);  % add the joint motions
end

