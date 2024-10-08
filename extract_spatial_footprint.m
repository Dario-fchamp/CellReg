%file_path = 'C:\Users\Dario\Documents\Github\CellReg\';
%file_name = 'neuron_42356_42356_RF_W9';
%Sources2D_to_simple_mat(file_name, file_path);
data_path = 'G:\My Drive\Data\';
% define file names of sample data:
myFiles = dir(fullfile(data_path,'**', '*BL1.mat'));
number_of_files=length(myFiles)
%loop over every neuron file
y_dim = 0;
x_dim = 0;
for file_index=1:number_of_files
    %file_names{file_index}=fullfile(myFiles(file_index).folder,myFiles(file_index).name);

    folder = myFiles(file_index).folder;
    file_name = myFiles(file_index).name;
    load(fullfile(folder,file_name), 'neuron');
    %Define max window for padding
    if size(neuron.Cn,1) > x_dim
        x_dim = size(neuron.Cn,1);
    end
    if size(neuron.Cn,2) > y_dim
      y_dim = size(neuron.Cn,2);
    end

    spatial_footprints = reshape(full(neuron.A),size(neuron.Cn,1),size(neuron.Cn,2),size(neuron.A,2));
    spatial_footprints_CellReg = permute(spatial_footprints,[3,1,2]);
    %Save spatial footprint
    if not(isfolder([folder(1:end-4),'\spatial_footprints\']))
        mkdir([folder(1:end-4),'\spatial_footprints\']);
    end
    save([folder(1:end-4),'\spatial_footprints\',file_name(8:end-4),'_spatial_footprints','.mat'],'spatial_footprints_CellReg');
end

%% BL2
myFiles = dir(fullfile(data_path,'**', '*BL2.mat'));
number_of_files=length(myFiles)

%loop over every neuron file
for file_index=1:number_of_files
    %file_names{file_index}=fullfile(myFiles(file_index).folder,myFiles(file_index).name);

    folder = myFiles(file_index).folder;
    file_name = myFiles(file_index).name;
    load(fullfile(folder,file_name), 'neuron');
    %Define max window for padding
    if size(neuron.Cn,1) > x_dim
        x_dim = size(neuron.Cn,1);
    end
    if size(neuron.Cn,2) > y_dim
      y_dim = size(neuron.Cn,2);
    end

    spatial_footprints = reshape(full(neuron.A),size(neuron.Cn,1),size(neuron.Cn,2),size(neuron.A,2));
    spatial_footprints_CellReg = permute(spatial_footprints,[3,1,2]);
    %Save spatial footprint
    if not(isfolder([folder(1:end-4),'\spatial_footprints\']))
        mkdir([folder(1:end-4),'\spatial_footprints\']);
    end
    save([folder(1:end-4),'\spatial_footprints\',file_name(8:end-4),'_spatial_footprints','.mat'],'spatial_footprints_CellReg');
end

%%W9
myFiles = dir(fullfile(data_path,'**', '*W9.mat'));
number_of_files=length(myFiles)
%loop over every neuron file
for file_index=1:number_of_files
    %file_names{file_index}=fullfile(myFiles(file_index).folder,myFiles(file_index).name);

    folder = myFiles(file_index).folder;
    file_name = myFiles(file_index).name;
    load(fullfile(folder,file_name), 'neuron');
    %Define max window for padding
    if size(neuron.Cn,1) > x_dim
        x_dim = size(neuron.Cn,1);
    end
    if size(neuron.Cn,2) > y_dim
      y_dim = size(neuron.Cn,2);
    end

    spatial_footprints = reshape(full(neuron.A),size(neuron.Cn,1),size(neuron.Cn,2),size(neuron.A,2));
    spatial_footprints_CellReg = permute(spatial_footprints,[3,1,2]);
    %Save spatial footprint
    if not(isfolder([folder(1:end-4),'\spatial_footprints\']))
        mkdir([folder(1:end-4),'\spatial_footprints\']);
    end
    save([folder(1:end-3),'\spatial_footprints\',file_name(8:end-4),'_spatial_footprints','.mat'],'spatial_footprints_CellReg');
end
%disp(['Padding size: ', x_dim, y_dim]);