function idxBreak = getIdxBreak(Extension,Force,doFigs,color)
    if nargin<3
        doFigs = false;
    elseif nargin<4
        color = 'b';
    end
    assert(length(Extension) == length(Force), 'Extension and Force must have the same length');
    minValue = abs(min(diff(Force)));
    idxBreak = find(diff(Force)<-minValue/5);
    idxBreak = idxBreak(1);
    if doFigs
        figure(1)
        plot(Extension(2:end),diff(Force))
        hold on
        figure(2)
        plot(Extension,Force,'--','LineWidth',2,'color',color)
        hold on
        plot(Extension(idxBreak),Force(idxBreak),'*','color',color,'MarkerSize',15,'LineWidth',2)
        hold on
        figure(1)
        ylabel('Force gradient (N/mm)')
        xlabel('Extension (mm)')
        figure(2)
        title('Identified points of first failure (*)')
        ylabel('Force (N)')
        xlabel('Extension (mm)')
    end
end