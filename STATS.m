%some statistics for the BSc thesis:

%compare arcgis and manual methods: Antarctica:

man = [63425,734200,13775,458075,206850,289150,107600,111100,162925,112575,...
    1259200,64850,167100,143975,105350,604575,798900,73325,164125,175875,391350,...
    83775,498175,224350,391700]';

auto = [53700,1167075,9675,161175,281050,192349.999,107900,52650,142525,...
    121275,922775,51399.999,106624.999,142049.999,102999.999,109024.999,...
    841950,270525,119149.999,285800,49025,74850,233875,453325,82724.999]';

M = [man,auto];

[p,anovatab,stats] = anova1(M);
xlabel('Manual & Automatic Methods')
ylabel('Basin Size (km^2)')
title('ANOVA test: Antarctica')

%greenland
man = [56550,14925,36825,46125,27640,41575,46875,109100,69625,13550,35150,...
160875,76150,45500,33700,65425,65425,51775,8300,77100,34975,57600,83450,...
21900,97575,39350,150400]';

auto = [62200,14900,164500,20550,21825,74500,38325,157325,54175,9300,30500,155575,...
47275,52775,17550,17800,65325,24875,3700,65400,43775,48275,84675,22350,...
57600,39100,153500]';

M = [man,auto];
[p,anovatab,stats] = anova1(M);
xlabel('Manual & Automatic Methods')
ylabel('Basin Size (km^2)')
title('ANOVA test: Greenland')

%Montecarlo
org = [77100 109100 1259200 105350 175875]';

mc = [58000 96500 864350 121050 182550]';

M = [org,mc];
p = anova1(M);
xlabel('Original & MonteCarlo Resampling of Basins')
ylabel('Basin Size (km^2)')
title('ANOVA test: MonteCarlo')

%Rignot & Thomas comparison of Antarctic CB's
ours = [63425,734200,13775,458075,206850,289150,107600,111100,162925,112575,...
    1259200,64850,167100,143975,105350,604575,798900,73325,164125,175875,391350,...
    83775,498175,224350,391700]';
his = [108400,9100,52600,162300,164800,720900,29500,1070400,115000,214300,278700,...
    82600,537900,186300,953700,104000,196700,122500,99900,66700,499200,964300,221600,NaN,166900]';

M = [ours,his];
p = anova1(M);
xlabel('Norris et al. vs. Rignot & Thomas, 2002')
title('ANOVA test: Dataset Comparisons Antarctica')

%Lewis & Smith comparison of Greenlandic CB's

ours = [390125,87975,296375,741750,77350,142750,569125]';
hers = [324822,114719,289629,711844,68324,132743,634235]';

M = [ours,hers];
p = anova1(M);
xlabel('Norris et al. vs. Lewis & Smith, 2009')
title('ANOVA test: Dataset Comparisons Antarctica')

