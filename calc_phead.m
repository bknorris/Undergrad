load C:/Users/bknorris/Documents/Thesis/usurf.mat
load C:/Users/bknorris/Documents/Thesis/usurfGL.mat
load C:/Users/bknorris/Documents/Thesis/thk.mat
load C:/Users/bknorris/Documents/Thesis/thkGL.mat

Ro_ice = 900; %kg/m^3
Ro_water = 1000; %kg/m^3

h_head_ANT = (usurf - (1-(Ro_ice/Ro_water)).*thk);
ANThead = rot90(h_head_ANT);

h_head_GL = (usurfGL - (1-(Ro_ice/Ro_water)).*thkGL);
GLhead = rot90(h_head_GL);

ind = find(ANThead == 0);ANThead(ind) = -9999;
save ANThead.txt -ascii ANThead
ind = find(GLhead == 0);GLhead(ind) = -9999;
save GLhead.txt -ascii GLhead

