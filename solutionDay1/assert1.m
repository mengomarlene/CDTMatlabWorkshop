numbers=[1.5, 2.3, 0.7, 3.2, 4.4];
total=0;

for n = numbers
    assert(n >= 0);
    total=total + n;
end