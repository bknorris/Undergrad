clear

fname = 'methodsGL.txt';
fid = fopen(fname);
str = fgetl(fid);
params = textscan(str,'%s');Ps = params{1};
FRMT = '%s%s%s';

data = textscan(fid,FRMT,'delimiter','\t');

arc = cellfun(@str2num,data{2});
mat = cellfun(@str2num,data{1});
names = data{3};

%get best fit line & calculate data statistics
pPoly = polyfit(arc,mat,1);
lineX = [0 12e5];
lineY = polyval(pPoly,[min(arc),max(arc)]);
yfit = polyval(pPoly,arc);resid = mat-yfit;
SSresid = sum(resid.^2); %calculate r^2
SStotal = (length(mat)-1)*var(mat);
rsq = 1-SSresid/SStotal; %calculate simple r-squared value of the polynomial fit
rsq_dof = 1 - SSresid/SStotal*(length(mat)-1)/(length(mat)-length(pPoly)-1); %calculate r-squared
%adjusted for degrees of freedom
yString = 'Best Fit';
xString = 'x';

figure(1)
h = scatter(arc,mat,'b','*');
hold on
% set(h,'LineStyle','*')
line(lineX,lineY,'Color','k')
% add textbox to figure with best fit line equation
textb = uicontrol('style','text');
set(textb,'String',[yString,' = ',num2str(pPoly(1)),'*',...
xString,' + ',num2str(pPoly(2)),'; R-Squared',' = ',num2str(rsq)])
set(textb,'Position',[1120,460,350,12])

text(arc(1:13),mat(1:13),names(1:13),'HorizontalAlignment','left','VerticalAlignment','top','FontSize',8)
text(arc(14:18),mat(14:18),names(14:18),'HorizontalAlignment','left','VerticalAlignment','top','FontSize',8)
text(arc(19:27),mat(19:27),names(19:27),'HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',8)
ylabel('Matlab Method - Basin Area (km^2)','FontSize',12)
xlabel('ArcGIS Method - Basin Area (km^2)','FontSize',12)
title('Comparison of Drainge Basin Delineation Method Results - Greenland','FontSize',14)