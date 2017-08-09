
x = 1:1:11;
y_control_pre  = [61.11 48.89 67.06 74.44 85.56 77.78 54.44 76.67 85.56 54.44 47.78];
y_control_post = [68.89 54.44 68.24 83.33 84.44 77.78 47.78 81.11 83.33 54.44 48.89];
y_expt_pre     = [68.00 44.00 76.00 54.00 84.00 76.00 62.00 70.00 70.00 56.00 74.00];
y_expt_post    = [76.00 56.00 88.00 66.00 90.00 90.00 68.00 84.00 96.00 74.00 76.00];
y_control_gain = [7.78 5.56 1.18 8.89 -1.11 0.00 -6.67 4.44 -2.22 0.00 1.11];
y_expt_gain    = [8.00 12.00 12.00 12.00 6.00 14.00 6.00 14.00 26.00 18.00 2.00];

figure;
subplot(2,2,1);
plot(x,y_control_post,'-r','Marker','o','MarkerSize',10,'LineWidth',2.5);hold on;
plot(x,y_control_pre,'--r','Marker','s','MarkerSize',10,'LineWidth',2.5);
title('Pre-test/Post-test score: Control Group')
legend('Post-test score', 'Pre-test score');

subplot(2,2,2);
plot(x,y_expt_post,'-b','Marker','o','MarkerSize',10,'LineWidth',2.5);hold on;
plot(x,y_expt_pre,'--b','Marker','s','MarkerSize',10,'LineWidth',2.5);
title('Pre-test/Post-test score: Experimental Group');
legend('Post-test score', 'Pre-test score');

subplot(2,2,[3,4]);
plot(x,y_control_gain,'-r', 'Marker','s','MarkerSize',10,'LineWidth',2.5)
hold on;
plot(x,y_expt_gain,'-b','Marker','>','MarkerSize',10,'LineWidth',2.5);
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
hTitle =title('Average gain of Control versus Experimental Group (Spring 2015)');
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