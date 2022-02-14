randvec=randn(1,10000);
n=20;
figure;
histogram(randvec,n); hold on;

mean(randvec)
std(randvec)

mu=2;
sigma=sqrt(2);
randvec=randn(1,10000)*sigma+mu;

histogram(randvec,n);

mean(randvec)
std(randvec)