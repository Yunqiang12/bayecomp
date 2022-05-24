data {
    int<lower=1> n;
    real<lower=0> y[n];
    real  IP;
    real  meanY;
    real  multipliermu;
    real  multipliersigma;
}
transformed data {
    real H;
    real musigma;
    H = multipliersigma *IP;
    musigma = multipliermu *IP;
}  
parameters {
    real<lower=1> nu;
    real mu;
    real<lower=0> sigma;
}
model {
    nu ~ gamma(2, 0.1);
    mu ~ normal(meanY, musigma);
    sigma ~ normal(0, H);
    y ~ student_t(nu, mu, sigma);
}
generated quantities{
    real  y_pred;
    y_pred = student_t_rng(nu, mu, sigma);
}
