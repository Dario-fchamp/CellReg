% Extract spatial footprint
folder = '/home/dariobolli/Desktop/Github/CellReg/Dystonia_Data/NeuralData/';  
myFiles = dir(fullfile(folder,'*.mat'));
length(myFiles)
%padding to have same size spatial footprints
y_dim = 0;
x_dim = 0;
for k = 1:length(myFiles)
  file_name = myFiles(k).name;
  load([folder,file_name], 'neuron');
  %Define max window for padding
  if size(neuron.Cn,1) > x_dim
      x_dim = size(neuron.Cn,1);
  end
  if size(neuron.Cn,2) > y_dim
    y_dim = size(neuron.Cn,2);
  end
   
end

% if exist(file_name(1:end-4),'dir')~=7
%     mkdir(file_name(1:end-4));
% end

% Padding
for k = 1:length(myFiles)
  file_name = myFiles(k).name;
  session_number = int2str(k);
  load([folder,file_name], 'neuron');
  %Reshape spatial masks
  %neuron.A is stored as a sparse matrix (index of non-zero elements), need
  %to convert to regular matrix to reshape
  spatial_footprints = reshape(full(neuron.A),size(neuron.Cn,1),size(neuron.Cn,2),size(neuron.A,2));
  
  
% % % %   %x padding
% % % %   x_pad = x_dim-size(neuron.Cn,1);
% % % %   %even padding needed on x dim
% % % %   if mod(x_pad,2) == 0
% % % %      x_pad = fix(x_pad/2);
% % % %      spatial_footprints = padarray(spatial_footprints,[x_pad,0,0],0,'both');
% % % %   %uneven padding needed on x dim
% % % %   else
% % % %       x_pad = fix(x_pad/2);
% % % %       spatial_footprints = padarray(spatial_footprints,[x_pad,0,0],0,'both');
% % % %       spatial_footprints = padarray(spatial_footprints,[1,0,0],0,'pre');
% % % %   end
% % % % 
% % % %   %y padding
% % % %   y_pad = y_dim-size(neuron.Cn,2);
% % % %   %even padding needed on y dim
% % % %   if mod(y_pad,2) == 0
% % % %      y_pad = fix(y_pad/2);
% % % %      spatial_footprints = padarray(spatial_footprints,[0,y_pad,0],0,'both');
% % % %   %uneven padding needed on y dim
% % % %   else
% % % %       y_pad = fix(y_pad/2);
% % % %       spatial_footprints = padarray(spatial_footprints,[0,y_pad,0],0,'both');
% % % %       spatial_footprints = padarray(spatial_footprints,[0,1,0],0,'pre');
% % % %   end
 
  %spatial_footprint = padarray(neuron.Cn,[x_pad y_pad],0,'both');
  size(spatial_footprints)
  
  %Permute axes for cell reg
  %NxMxK, where N is the number of neurons, M is the number of pixels in the y axis and K is the number of pixels in the x axis.
  spatial_footprints_CellReg = permute(spatial_footprints,[3,1,2]);
  size(spatial_footprints_CellReg)
  %Save spatial footprint
  
  save([folder(1:end-11),file_name(1:end-4),'_spatial_footprints_',session_number,'.mat'],'spatial_footprints_CellReg');
  
%   % Display Neuron spatial map for a session (Correlation Cn of Fluorescence over time)
%   h = heatmap(spatial_footprint,'GridVisible', 'off');
%   s=struct(h);
%   s.XAxis.Visible='off';
%   s.YAxis.Visible='off';
%   figure;
end