%% Import data from text file.
% Script for importing data from the following text file:
%
%    /dagher/dagher11/filip/OBAL/output/wholebrain_pval.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2020/01/23 15:16:17

%% Initialize variables.
filename = '/dagher/dagher11/filip/OBAL/output/wholebrainVOLWHR_pval.csv';
delimiter = {''};
startRow = 2;

%% Format for each line of text:
%   column1: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
wholebrainpval = [dataArray{1:end-1}];
%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

%% Initialize variables.
filename = '/dagher/dagher11/filip/OBAL/output/wholebrainVOLWHR_tval.csv';
delimiter = {''};
startRow = 2;

%% Format for each line of text:
%   column1: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
wholebraintval = [dataArray{1:end-1}];
%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;


%%%%%%%%%% PLOT DKT MAPS %%%%%%%%%%
addpath(genpath('/dagher/dagher11/filip/Software/freesurfer_statsurf_display/'))
wholebraintval((wholebrainpval(:,1)>0.05),:)=0;
maskvals=wholebrainpval<0.05;

figure(2)
freesurfer_statsurf_scalar({wholebraintval(1:31),wholebraintval(32:62)},{maskvals(1:31),maskvals(32:62)},'dkt','UseShortLabels', false, 'MedialLateralLabels', false, 'MainTitle', 'WHR correlation with volume','ScalarName','T-value')
saveas(gcf,'WHR_VOL.tif')