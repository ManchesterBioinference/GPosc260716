function [ BICdiffM ] = BICdistDATAsynth( dataTOT,x,par1TOT,repeats);
%BICDIST Summary of this function goes here
%   Detailed explanation goes here
% fit models to data 

par1M = zeros(size(dataTOT,2),3);
par2M = zeros(size(dataTOT,2),4);
BICdiffM = zeros(size(dataTOT,2),1);
% create vector of noise parameters
% b=repmat(current,1,repeats);
NoisePar = par1TOT(:,3);
NoiseVec=repmat(NoisePar,1,repeats)';NoiseVec=NoiseVec(:);

% load cell data for current experiment - loops through cells

% have parallelised it...
parfor i = 1:size(dataTOT,2);
%     disp(i)
    y1 = dataTOT(:,i);  
    xcurr = x;
%     x = time;
    xcurr(y1==0) = []; %deletes times from which no signal
    samp = length(xcurr);
    y1(y1==0) = [];
    y1 = y1 - mean(y1);
    Noise = NoiseVec(i);
    
% remove trend from data

%     Noise = stdev/std(y1);
    y1 = y1/std(y1);
% have removed detrending for     
%     raw = y1;
%IMPORTANT PARAMETER - number (3rd input) controls how slow
% trend is for cell data
%     [m] = detrenddata(raw,x,-5);
%     y1 = y1-m; %detrended y1   
%     y1 = y1/std(y1);        

% fit OU and OUoscillatory models

    [BICdiff, par1, par2] = getBICdiff(xcurr,y1,Noise);
    par1M(i,:) = par1;
    par2M(i,:) = par2;
    BICdiffM(i,:) = BICdiff;
% show figure - comment out "showfigure" is don't want 
%individual cell figures popping up
%     showfigure(x,m,raw,y1,BICdiff,par1,par2,i)

end

end

