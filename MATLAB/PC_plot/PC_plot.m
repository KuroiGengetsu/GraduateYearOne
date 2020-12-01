%% RP �뾶/���� deep��� source RG
R = load("R").R*1e3;
G = load("G").G*1e3;
T = load("T").T;

fig = figure;
%% ���� ���0.2um ����RP
hold on;
subplot(2, 2, 1);
plot(G, T(:, [2, 6, 10]), "linewidth", 3);
legend(["200/300", "300/400", "400/500"], 'NumColumns', 3);
title("Si ���200nm �뾶/���ڷֱ�Ϊ 200/300��300/400��400/500", ...
    "FontWeight", "bold");
xlabel("�̹� lambda (nm)");
ylabel("͸���� T");
ylim([0 1]);
hold off;

hold on;
subplot(2, 2, 2);
plot(R, T(:, [1, 5, 9]), "linewidth", 3);
legend(["200/300", "300/400", "400/500"], 'Location', 'southeast');
title("Si ���200nm �뾶/���ڷֱ�Ϊ 200/300��300/400��400/500", ...
    "FontWeight", "bold");
xlabel("��� lambda (nm)");
ylabel("͸���� T");
ylim([0 1]);
hold off;

%% ���� ���0.4um ����RP
% figure;

hold on;
subplot(2, 2, 3);
plot(G, T(:, [4, 8, 12]), "linewidth", 3);
legend(["200/300", "300/400", "400/500"]);
title("Si ���400nm �뾶/���ڷֱ�Ϊ 200/300��300/400��400/500", ...
    "FontWeight", "bold");
xlabel("�̹� lambda (nm)");
ylabel("͸���� T");
ylim([0 1]);
hold off;

hold on;
subplot(2, 2, 4);
plot(R, T(:, [3, 7, 11]), "linewidth", 3);
legend(["200/300", "300/400", "400/500"], "Location", "northeast");
title("Si ���400nm �뾶/���ڷֱ�Ϊ 200/300��300/400��400/500", ...
    "FontWeight", "bold");
xlabel("��� lambda (nm)");
ylabel("͸���� T");
ylim([0 1]);
hold off;
