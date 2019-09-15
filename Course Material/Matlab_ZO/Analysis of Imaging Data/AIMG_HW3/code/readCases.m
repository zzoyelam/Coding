clear all
close all

allFiles = dir('code/dat/107*.pts');

figure
N = length(allFiles);
Z = zeros(68,2,N);
for iI=1:N
  
  [Z(:,1,iI),Z(:,2,iI),cPts] = readPoints( strcat('dat/',allFiles(iI).name ) );
  drawFaceParts( -cPts, 'k-' );
  
end
% clear all
% close all
% 
% allFiles = dir('dat/107*.pts');
% 
% figure
% 
% for iI=1:length(allFiles)
%   
%   cPts = readPoints( strcat('dat/',allFiles(iI).name ) );
%   drawFaceParts( -cPts, 'k-' );
%   
% end