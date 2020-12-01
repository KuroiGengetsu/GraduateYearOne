%% RP 半径/周期 deep深度 source RG
R = load("R").R*1e3;
G = load("G").G*1e3;
T = load("T").T;

fig = figure;
%% 绘制 深度0.2um 三种RP
hold on;
subplot(2, 2, 1);
plot(G, T(:, [2, 6, 10]), "linewidth", 3);
legend(["200/300", "300/400", "400/500"], 'NumColumns', 3);
title("Si 深度200nm 半径/周期分别为 200/300、300/400、400/500", ...
    "FontWeight", "bold");
xlabel("绿光 lambda (nm)");
ylabel("透射率 T");
ylim([0 1]);
hold off;

hold on;
subplot(2, 2, 2);
plot(R, T(:, [1, 5, 9]), "linewidth", 3);
legend(["200/300", "300/400", "400/500"], 'Location', 'southeast');
title("Si 深度200nm 半径/周期分别为 200/300、300/400、400/500", ...
    "FontWeight", "bold");
xlabel("红光 lambda (nm)");
ylabel("透射率 T");
ylim([0 1]);
hold off;

%% 绘制 深度0.4um 三种RP
% figure;

hold on;
subplot(2, 2, 3);
plot(G, T(:, [4, 8, 12]), "linewidth", 3);
legend(["200/300", "300/400", "400/500"]);
title("Si 深度400nm 半径/周期分别为 200/300、300/400、400/500", ...
    "FontWeight", "bold");
xlabel("绿光 lambda (nm)");
ylabel("透射率 T");
ylim([0 1]);
hold off;

hold on;
subplot(2, 2, 4);
plot(R, T(:, [3, 7, 11]), "linewidth", 3);
legend(["200/300", "300/400", "400/500"], "Location", "northeast");
title("Si 深度400nm 半径/周期分别为 200/300、300/400、400/500", ...
    "FontWeight", "bold");
xlabel("红光 lambda (nm)");
ylabel("透射率 T");
ylim([0 1]);
hold off;
