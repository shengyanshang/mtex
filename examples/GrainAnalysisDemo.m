%% Example for 2d EBSD Data analysis
%
%  data by Daniel Rutte with Bret Hacker, Stanford.
%
% The following script mainly generate the figures shown in "Grain detection
% from 2d and 3d EBSD data - Specification of the MTEX algorithm" - section "Practical
% application to a 2d EBSD data set". The only imposed restriction is the size of the
% data set, which was scaled down.
%

%% Open in Editor
%

%% Data import
% plotting convention

mtexdata mylonite

plotx2east

%% Phase map
% Phase map of multi-phase rock specimen with Andesina (blue), Quartz (red),
% Biotite (green) and Orthoclase (yellow)

figure('position',[100 100  750 300]);
plot(ebsd,'property','phase')

%% Restrict to the region of interest (RoI)
% the box is indicating a region of interest (RoI).

legend off
region = polygon([19000 1500; 23000 1500; 23000 3000; 19000 3000; 19000 1500]);
plot(region,'color','k','linewidth',2)

%%
% to which we restrict the data

ebsd_region = ebsd(inpolygon(ebsd,[19000 1500 23000 3000]))

%% Recover grains
% Next we reconstruct the grains (and grain boundareis in the region of interest

[grains ebsd_region] = calcGrains(ebsd_region,'angle',15*degree)

%% Plot grain boundaries and phase
% (RoI) Detailed phase map with measurement locations and reconstructed grain
% boundaries.

figure('position',[100 100  750 300]);
hold all
plot(ebsd_region,'property','phase')
plotboundary(grains,'color','k')
hold off
% set(gcf,'renderer','zbuffer')

%%
% (RoI) Individual orientation measurements of quartz together with the grain
% boundaries.

figure('position',[100 100 750 300]);
hold all
plot(grains,'property','phase','phase',[1 3 4],'FaceAlpha',0.2)
plotboundary(grains,'color','black');
plot(ebsd_region,'phase','Quartz-new','colorcoding','hkl','h',zvector)
legend off
hold off
% set(gcf,'renderer','zbuffer')

%%
% colored according to the false color map of its inverse polefigure

colorbar('Position',[825 100 300 300])

%%
% (RoI) The reconstructed grains. The quartz grains are colored according to
% their mean orientation while the remaining grains are colored according to
% there phase.

figure('position',[100 100  750 300]);
hold all
plot(grains,'property','phase','phase',[1 3 4],'FaceAlpha',0.2)
plot(grains,'phase','Quartz-new','colorcoding','hkl')
legend off
hold off
% set(gcf,'renderer','zbuffer')


%% Highlight specific boundaries
% (RoI) Phase map with grain boundaries highlighted, where adjacent grains have
% a misorientation with rotational axis close to the c-axis.

figure('position',[100 100  750 300]);
hold all
plot(grains,'property','phase','FaceAlpha',0.4)
plotboundary(grains,'property',Miller(0,0,1),'linewidth',2,'color','red')
hold off
% set(gcf,'renderer','zbuffer')

