function idxBreak = getIdxBreak(Extension,Force,doFigs)
    if nargin<3
        doFigs = false;
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
        plot(Extension,Force,'--','LineWidth',2)
        hold on
        plot(Extension(idxBreak),Force(idxBreak),'*')
        hold on
    end
end