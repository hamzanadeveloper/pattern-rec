% Plot the data for each class (Case 1 and 2) separately. On these plots
% also plot the unit standard deviation contour for each class.
%
% Febuary 12 2017
%
% Brady Kieffer - 20517665
% Krishn Ramesh - 20521942

%% Set the random state for consistency
rng(420);

%% Creates the class data
class_data;

samples_a = bivariate_normal(n_a, covar_a, mu_a);
samples_b = bivariate_normal(n_b, covar_b, mu_b);

samples_c = bivariate_normal(n_c, covar_c, mu_c);
samples_d = bivariate_normal(n_d, covar_d, mu_d);
samples_e = bivariate_normal(n_e, covar_e, mu_e);

%% Case 1
close all;

figure(1);
hold on;
scatter(samples_a(:, 1), samples_a(:, 2), 'rx');
scatter(samples_b(:, 1), samples_b(:, 2), 'bo');

plot(mu_a(1), mu_a(2), 'gx');
plot(mu_b(1), mu_b(2), 'go');

theta_a = atan(eig_vecs_a(2,2)/eig_vecs_a(2,1));
plot_ellipse(mu_a(1),mu_a(2), theta_a,covar_a(1,1),covar_a(2,2), 'r');

theta_b = atan(eig_vecs_b(2,2)/eig_vecs_b(2,1));
plot_ellipse(mu_b(1),mu_b(2), theta_b,covar_b(1,1),covar_b(2,2), 'b');

title('Plot of Samples of Class A and Class B');
legend('Class A', 'Class B', 'Location', 'northeast');
hold off;

%% Case 2
figure(2);
hold on;
scatter(samples_c(:, 1), samples_c(:, 2), 'rx');
scatter(samples_d(:, 1), samples_d(:, 2), 'bo');
scatter(samples_e(:, 1), samples_e(:, 2), 'k+');

plot(mu_c(1), mu_c(2), 'gx');
plot(mu_d(1), mu_d(2), 'go');
plot(mu_e(1), mu_e(2), 'g+');

theta_c = atan(eig_vecs_c(1,2)/eig_vecs_c(1,1));
plot_ellipse(mu_c(1),mu_c(2), theta_c,covar_c(1,1),covar_c(2,2), 'r');

theta_d = atan(eig_vecs_d(1,2)/eig_vecs_d(1,1));
plot_ellipse(mu_d(1),mu_d(2), theta_d,covar_d(1,1),covar_d(2,2), 'b');

theta_e = atan(eig_vecs_e(1,2)/eig_vecs_e(1,1));
plot_ellipse(mu_e(1),mu_e(2), theta_e,covar_e(1,1),covar_e(2,2), 'k');

title('Plot of Samples of Class C, Class D & Class E');
legend('Class C', 'Class D', 'Class E', 'Location', 'northeast');
hold off;

%% Decision boundaries
xx = -5.0:0.5:20;
yy =  0.0:0.5:25;

ged_boundary = get_decision_boundary(@generalized_euclidean_distance, xx, yy, covar_a, mu_a, covar_b, mu_b);

figure(3);
hold on;
scatter(samples_a(:, 1), samples_a(:, 2), 'rx');
scatter(samples_b(:, 1), samples_b(:, 2), 'bo');
contour(xx, yy, ged_boundary,[0,0], 'Color', 'black', 'LineWidth', 3);

plot(mu_a(1), mu_a(2), 'gx');
plot(mu_b(1), mu_b(2), 'go');

theta_a = atan(eig_vecs_a(2,2)/eig_vecs_a(2,1));
plot_ellipse(mu_a(1),mu_a(2), theta_a,covar_a(1,1),covar_a(2,2), 'r');

theta_b = atan(eig_vecs_b(2,2)/eig_vecs_b(2,1));
plot_ellipse(mu_b(1),mu_b(2), theta_b,covar_b(1,1),covar_b(2,2), 'b');

title('Plot of Decision Boundaries between Class A and Class B');
legend('Class A', 'Class B', 'Location', 'northeast');
hold off;