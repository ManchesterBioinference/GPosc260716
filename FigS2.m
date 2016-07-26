load Fig6

BICdiffTOT = BICdiffTOT4;
BICdiffsynthTOT = (BICdiffsynthTOT4);

BICdiffTOT(BICdiffTOT<0) = 0;
BICdiffsynthTOT(BICdiffsynthTOT<0) = 0;

subplot(3,1,1)
histogram(BICdiffTOT(1:1000),0:30)
t = title(['Gillespie with trend. Mean = ',num2str(mean(BICdiffTOT(1:1000)),'%.2f')]);
t.FontWeight = 'normal';
xlim([0 30])
% ylim([0 700])
xlabel('LLR')
ylabel('Frequency')
a = xlim();
b = ylim();
text(a(1)-0.1*(a(2)-a(1)),b(2)+0.06*(b(2)-b(1)),{'A'},...
    'FontSize',9,'HorizontalAlignment','right', 'VerticalAlignment','bottom','color','k')
subplot(3,1,2)
histogram(BICdiffsynthTOT,0:30)
xlim([0 30])
% ylim([0 700])
xlabel('LLR')
ylabel('Frequency')
t = title(['Bootstrap with trend. Mean = ',num2str(mean(BICdiffsynthTOT),'%.2f')]);
t.FontWeight = 'normal';
a = xlim();
b = ylim();
text(a(1)-0.1*(a(2)-a(1)),b(2)+0.06*(b(2)-b(1)),{'B'},...
    'FontSize',9,'HorizontalAlignment','right', 'VerticalAlignment','bottom','color','k')


subplot(3,1,3)
histogram(par0TOT4(:,2),0:0.2:5)
t = title(['\sigma_{SE} estimate (true=1). Mean = ',num2str(mean(par0TOT4(:,2)),'%.2f')]);
t.FontWeight = 'normal';
xlabel('\alpha')
ylabel('Frequency')
xlim([0 5])
a = xlim();
b = ylim();
text(a(1)-0.1*(a(2)-a(1)),b(2)+0.06*(b(2)-b(1)),{'C'},...
    'FontSize',9,'HorizontalAlignment','right', 'VerticalAlignment','bottom','color','k')
