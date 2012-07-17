% Makes all graphs kickass. Call after making all modifications to plot
%       function [] = beautify(fontSizes)
% fontSizes = [Axis,Labels,Title]

%TODO: Support for multiple axes

% Deepak Cherian 05/11/2010

function [] = beautify(fontSizes)
    
    if ~exist('fontSizes','var'), fontSizes = [16 18 20]; end

    % Get required handles for current figure
    hFig = evalin('caller','gcf');
    hAxis = evalin('caller','gca');

    if ~ishandle(hFig) || ~ishandle(hAxis)
     fprintf('\n Error in beautify.m. Invalid Handle');
    end

    % Get some more handles
    hXLabel = get(hAxis,'XLabel');
    hYLabel = get(hAxis,'YLabel');
    hZLabel = get(hAxis,'ZLabel');
    hTitle  = get(hAxis,'Title');

    % Aaaand..  Presto!
    set(hFig, ...
         'Color','white', ...
         'renderer', 'painters');
    %    set(hPlots(1)                       , ...
    %          'LineWidth'       , 1.5         );
    %    link = linkprop(hPlots,{'LineWidth'});
    %    set([hLegend, gca]             , ...
    %         'FontSize'   , 16           );
   
    set(hTitle, ...
         'FontSize'   , fontSizes(3) , ...
         'FontWeight' , 'normal', ...
         'FontName'   , 'AvantGarde');

    set([hXLabel, hYLabel, hZLabel]  , ...
         'FontName'   , 'AvantGarde', ... 
         'FontWeight' , 'normal', ...
         'FontSize'   , fontSizes(2)         );

    set(hAxis, ...
         'FontName'    , 'Helvetica', ...
         'Box'         , 'off'     , ...
         'TickDir'     , 'out'     , ...
         'TickLength'  , [.015 .015] , ...
         'FontWeight'  , 'normal', ...
         ...%'XMinorTick'  , 'on'      , ...
         ...%'YMinorTick'  , 'on'      , ...
         ...%'ZMinorTick'  , 'on'      , ...
         'XGrid'       , 'off'      , ...
         'YGrid'       , 'off'      , ...
         'ZGrid'       , 'off'      , ...
         'XColor'      , [.3 .3 .3], ...
         'YColor'      , [.3 .3 .3], ...
         'ZColor'      , [.3 .3 .3], ...
         'FontSize'    , fontSizes(1), ...
         'LineWidth'   , 1.5         );

    % Makes Fullscreen
   %set(hFig,'un','n','pos',[0,0,0.95,0.95]); figure(hFig);
   
%    %Remove whitespace around graph - use export_fig
%     T = get(hAxis,'tightinset');
%     set(hAxis,'position',[T(1) T(2) 1-T(1)-T(3) 1-T(2)-T(4)]);

    % WYSIWYG output apparently if print called after beautify
    %set(hFig, 'PaperPositionMode', 'auto');