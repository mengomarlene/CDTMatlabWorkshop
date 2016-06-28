for idx = 1:6
    fileName = sprintf('..\..\dataFiles_day2\staticInstron_%d.raw',idx);
    [displ,force] = importfile(fileName);
    plot(displ,force)
    hold on
    difForce = diff(force);
    minVal = min(difForce);
    threshold = minVal/5;
    forceOfInterest = find(difForce<threshold);
    plot(displ(forceOfInterest(1)),force(forceOfInterest(1)),'*')
end