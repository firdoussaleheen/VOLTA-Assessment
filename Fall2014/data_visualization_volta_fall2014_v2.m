
x = 1:1:11;
y_control_pre  = [64.44 36.67 64.21 51.76 83.33 68.75 76.67 76 71.11 52.5 68.57];
y_control_post = [66.67 47.78 62.22 48.24 90.00 82.67 72.94 82.67 76.47 65 70.59];
y_expt_pre     = [58.89 47.14 58.75 68.57 68.57 61.54 66.67 86.67 63.08 65.45 74.29];
y_expt_post    = [71.11 40.01 57.50 65.00 74.29 64.62 68 93.33 84.62 76.36 87.14];
y_control_gain = [2.23 11.11 -1.99 -3.52 6.67 13.92 -3.73 6.67 5.36 12.5 2.02];
y_expt_gain    = [12.22 -7.13 -1.25 -3.57 5.72 3.08 1.33 6.66 21.54 10.91 12.85];

figure;
subplot(2,2,1);
plot(x,y_control_post,x,y_control_pre);
title('Pre-test/Post-test score: Control Group')
legend('Post-test score', 'Pre-test score');

subplot(2,2,2);
plot(x,y_expt_post,x,y_expt_pre);
title('Pre-test/Post-test score: Experimental Group');
legend('Post-test score', 'Pre-test score');

subplot(2,2,[3,4]);
plot(x,y_control_gain,'b',x,y_expt_gain,'g');
title('Average Gain : Control and Experimental Group');
legend('Control Group', 'Experimental Group');

%%

figure('Units', 'pixels', ...
    'Position', [100 100 800 600]);
hold on;
h = plot(x,y_control_gain,'rs', x,y_expt_gain,'bo');

set(h                           , ...
  'LineStyle'       , '-'      , ...
  'LineWidth'       , 2.5           , ...
  'MarkerSize'      , 10           , ...
  'MarkerEdgeColor' , [.2 .2 .2]  , ...
  'MarkerFaceColor' , [.7 .7 .7]  );


legend('Control Group', 'Experimental Group');
hTitle =title('Average gain of Control versus Experimental Group (Fall 2014)');
hXLabel = xlabel('Lab assignment number');
hYLabel = ylabel('Average gain');

set( gca                       , ...
    'FontName'   , 'Helvetica', 'FontSize'   , 19 );


set([hTitle,hXLabel, hYLabel]  , ...
    'FontSize'   , 16          );

set(gca, ...
  'xlim'        , [1,11]  , ...
  'Box'         , 'off'     , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'LineWidth'   , 1         );


