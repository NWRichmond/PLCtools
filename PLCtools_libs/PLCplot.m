function plothandle = PLCplot(fighandle,plcobj,param)
% Plots graph and sets up a custom data tip update function
% for a plot with one component
plothandle = imagesc(param);
dcm_obj = datacursormode(fighandle);
set(dcm_obj,'UpdateFcn',{@PlotDataCursorText,plcobj,param})
end

function txt = PlotDataCursorText(~,event_obj,plcobj,param)
% Customizes text of data tips
obj_size_x = plcobj.total_size(1);
obj_size_y = plcobj.total_size(2);
pos = get(event_obj,'Position');
txt = {...
    ['X: ',num2str(round(pos(1))/obj_size_x)],...
    ['Y: ',num2str(1-(round(pos(2))/obj_size_y))],...
    ['Value: ',num2str(param(pos(1),pos(2)))]};
end