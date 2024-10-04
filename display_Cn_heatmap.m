% Display Neuron spatial map for a session (Correlation Cn of Fluorescence over time)
file_name = 'spatial_footprints_01';%'D1_01057_B1';
a = load(['/home/dariobolli/Desktop/Github/CellReg/SampleData/',file_name])%Dystonia_Data/Sources2D/
%size(neuron.Cn)
h = heatmap(a,'GridVisible', 'off');
s=struct(h);
s.XAxis.Visible='off';
s.YAxis.Visible='off';