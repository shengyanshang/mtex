%% The Elasticity Tensor
% how to calculate the elasticity tensor
%
%% Open in Editor
%
%% Abstract
% MTEX offers a very simple way to compute elasticity properties of
% materials. This includes Young's modulus, linear compressibility,
% Cristoffel tensor, and elastic wave velocities.
%
%% Contents


%% Import an Elasticity Tensor
% Let us start by importing an elasticity tensor of a Olivin crystal in
% normal orientation from a file. 

fname = fullfile(mtexDataPath,'tensor','Olivine1997PC.GPa');

cs = symmetry('mmm',[4.7646 10.2296 5.9942]);

E = loadTensor(fname,cs,'name','elasticity','interface','generic')


%% Young's Modulus
% Young's modulus is .... It is computed for a specific direction x by the
% command <tensor/YoungsModulus.html YoungsModulus>.

x = xvector;
YoungsModulus(E,x)

%%
% It can be plotted by passing the option *YoungsModulus* to the
% <tensor/plot.html plot> command. 

set_mtex_option('defaultColorMap',seismicColorMap);
plot(E,'PlotType','YoungsModulus','complete')

%% Linear Compressibility
% The linear compressibility is ...
% It is computed for a specific direction x by the
% command <tensor/linearCompressibility.html linearCompressibility>.

linearCompressibility(E,x)

%%
% It can be plotted by passing the option *linearCompressibility* to the
% <tensor/plot.html plot> command.

plot(E,'PlotType','linearCompressibility','complete')

%% Cristoffel Tensor
% The Cristoffel Tensor for a specific direction x is ....
% It is computed for a specific direction x by the
% command <tensor/CristoffelTensor.html YoungsModulus>.

C = CristoffelTensor(E,x)

%% Elastic Wave Velocity
% The Cristoffel tensor is the basis for computing the direction dependent
% wave velocities of the p, s1, and s2 wave, as well as of the polarisation
% directions. In MTEX this is done by the command <tensor/velocity.html
% velocity>

[vp,vs1,vs2,pp,ps1,ps2] = velocity(E,xvector,1)

%%
% In order to visualize these quantities there are several posibilities.
% Let us first plot the direction depended wave speed of the p-wave

plot(E,'PlotType','velocity','vp','complete')


%%
% Next we plot on the top of this plot the p-wave polarisation direction.

hold on
plot(E,'PlotType','velocity','pp','complete')
hold off

%%
% Finally we visuallize the speed difference between the s1 and s2 waves
% together with the  fast sheer polarization.

plot(E,'PlotType','velocity','vs1-vs2','complete')

hold on
plot(E,'PlotType','velocity','ps1','complete')
hold off


%%
% set back default colormap

set_mtex_option('defaultColorMap',WhiteJetColorMap)
