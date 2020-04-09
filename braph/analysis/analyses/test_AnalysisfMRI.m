% test AnalysisfMRI
br1 = BrainRegion('BR1', 'brain region 1', 1, 11, 111);
br2 = BrainRegion('BR2', 'brain region 2', 2, 22, 222);
br3 = BrainRegion('BR3', 'brain region 3', 3, 33, 333);
br4 = BrainRegion('BR4', 'brain region 4', 4, 44, 444);
br5 = BrainRegion('BR5', 'brain region 5', 5, 55, 555);
atlas = BrainAtlas('brain atlas', {br1, br2, br3, br4, br5});

sub1 = SubjectfMRI(atlas, 'SubjectID', '1');
sub2 = SubjectfMRI(atlas, 'SubjectID', '2');
sub3 = SubjectfMRI(atlas, 'SubjectID', '3');
sub4 = SubjectfMRI(atlas, 'SubjectID', '4');
sub5 = SubjectfMRI(atlas, 'SubjectID', '5');

cohort = Cohort('Cohort fMRI', 'SubjectfMRI', atlas, {sub1, sub2, sub3, sub4, sub5});

%% Test 1: Instantiation
analysis = AnalysisfMRI(cohort, {});