% Test fdr

%% Test 1: Basics
pvalues = [ ...
    .341, .384, .569, .594, .696, ...
    .222, .251, .269, .275, .34, ...
    .060, .074, .205, .212, .216, ...
    .001, .008, .039, .041, .042, ...
    .940, .942, .975, .986, .762 ...
    ];
q = .25;
% Critical value described by Benjamini and Hochberg(1995) is (i/m)Q where
% i is the rank of the test, m the total number of tests and Q the fdr
% treshhold value we choose, in this case will be 0.25 We look for the
% largest P value that is smaller than its critical value: P < (i/m)Q 
fdr_calculated  = fdr(pvalues, q);
fdr_expected = .060;

assert(isequal(fdr_expected, fdr_calculated), ...
    [BRAPH2.STR ':FDR:' BRAPH2.FAIL_TEST], ...
    'Error in fdr calculation')