function [ individual,total ] = PGmotion_with_rest( data, rest )
% calculates the joint travel of the mocap suit wrt the rest position

[r,c] = size(data); % find the size of the motion data
individual = ones(1,c); % initiate the column vector of the output
path = 0; %initialize path length
total = 0; %initialize total path length
for i = 1:c
    jointpos=data(:,i);  % each colum is the data from a particular joint
    for j = 1:1:r  % from data point 2 by ones to r
        % path_inc = jointpos(j) - jointpos(j-1);  % path distance between adjacent data points
        path_inc = jointpos(j) - rest(i); % find deviation from rest position
        path = path + abs(path_inc); % add abs value of path increment to path
        j=j+1;
    end
    individual(i) = path; % write the joint path to the output vector
    i=i+1; % move to next joint
end

total = sum(individual);  % add the joint motions

end

