%EXAMPLE_CON_FUN_MP_BUT
% Script example pipeline CON FUN MP BUT

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON_FUN_MP XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectCON
im_gr1 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON_FUN_MP XLS' filesep 'CON_FUN_MP_Group_1_XLS.CON'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1_CON = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON_FUN_MP XLS' filesep 'CON_FUN_MP_Group_2_XLS.CON'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2_CON = im_gr2.get('GR');

%% Load Groups of SubjectFUN
im_gr1 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON_FUN_MP XLS' filesep 'CON_FUN_MP_Group_1_XLS.FUN'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1_FUN = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_FUN_MP')) filesep 'Example data CON_FUN_MP XLS' filesep 'CON_FUN_MP_Group_2_XLS.FUN'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2_FUN = im_gr2.get('GR');

%% Combine Groups of SubjectCON with Groups of SubjectFUN
co_gr1 = CombineGroups_CON_FUN_MP( ...
    'GR_CON', gr1_CON, ...
    'GR_FUN', gr1_FUN, ...
    'WAITBAR', true ...
    );

gr1 = co_gr1.get('GR_CON_FUN_MP');

co_gr2 = CombineGroups_CON_FUN_MP( ...
    'GR_CON', gr2_CON, ...
    'GR_FUN', gr2_FUN, ...
    'WAITBAR', true ...
    );

gr2 = co_gr2.get('GR_CON_FUN_MP');

%% Analysis CON FUN MP BUT
thresholds = .7:.1:.9;

a_BUT1 = AnalyzeEnsemble_CON_FUN_MP_BUT( ...
    'GR', gr1, ...
    'THRESHOLDS', thresholds ...
    );

a_BUT2 = AnalyzeEnsemble_CON_FUN_MP_BUT( ...
    'TEMPLATE', a_BUT1, ...
    'GR', gr2, ...
    'THRESHOLDS', thresholds ...
    );

% measure calculation
degree_BUT1 = a_BUT1.get('MEASUREENSEMBLE', 'Degree').get('M');
degreeav_BUT1 = a_BUT1.get('MEASUREENSEMBLE', 'DegreeAv').get('M');
distance_BUT1 = a_BUT1.get('MEASUREENSEMBLE', 'Distance').get('M');
% % % multiplexparticipation_BUT1 = a_BUT1.get('MEASUREENSEMBLE', 'MultiplexParticipation').get('M');
% % % ovdegree_av_BUT1 = a_BUT1.get('MEASUREENSEMBLE', 'OverlappingDegreeAv').get('M');
% % % edgeov_BUT1 = a_BUT1.get('MEASUREENSEMBLE', 'EdgeOverlap').get('M');

degree_BUT2 = a_BUT2.get('MEASUREENSEMBLE', 'Degree').get('M');
degreeav_BUT2 = a_BUT2.get('MEASUREENSEMBLE', 'DegreeAv').get('M');
distance_BUT2 = a_BUT2.get('MEASUREENSEMBLE', 'Distance').get('M');
% % % multiplexparticipation_BUT2 = a_BUT2.get('MEASUREENSEMBLE', 'MultiplexParticipation').get('M');
% % % ovdegree_av_BUT2 = a_BUT2.get('MEASUREENSEMBLE', 'OverlappingDegreeAv').get('M');
% % % edgeov_BUT2 = a_BUT2.get('MEASUREENSEMBLE', 'EdgeOverlap').get('M');

% comparison
c_BUT = CompareEnsemble( ...
    'P', 10, ...
    'A1', a_BUT1, ...
    'A2', a_BUT2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

degree_BUT_diff = c_BUT.get('COMPARISON', 'Degree').get('DIFF');
degree_BUT_p1 = c_BUT.get('COMPARISON', 'Degree').get('P1');
degree_BUT_p2 = c_BUT.get('COMPARISON', 'Degree').get('P2');
degree_BUT_cil = c_BUT.get('COMPARISON', 'Degree').get('CIL');
degree_BUT_ciu = c_BUT.get('COMPARISON', 'Degree').get('CIU');

degreeav_BUT_diff = c_BUT.get('COMPARISON', 'DegreeAv').get('DIFF');
degreeav_BUT_p1 = c_BUT.get('COMPARISON', 'DegreeAv').get('P1');
degreeav_BUT_p2 = c_BUT.get('COMPARISON', 'DegreeAv').get('P2');
degreeav_BUT_cil = c_BUT.get('COMPARISON', 'DegreeAv').get('CIL');
degreeav_BUT_ciu = c_BUT.get('COMPARISON', 'DegreeAv').get('CIU');

distance_BUT_diff = c_BUT.get('COMPARISON', 'Distance').get('DIFF');
distance_BUT_p1 = c_BUT.get('COMPARISON', 'Distance').get('P1');
distance_BUT_p2 = c_BUT.get('COMPARISON', 'Distance').get('P2');
distance_BUT_cil = c_BUT.get('COMPARISON', 'Distance').get('CIL');
distance_BUT_ciu = c_BUT.get('COMPARISON', 'Distance').get('CIU');

% % % multiplexparticipation_BUT_diff = c_BUT.get('COMPARISON', 'MultiplexParticipation').get('DIFF');
% % % multiplexparticipation_BUT_p1 = c_BUT.get('COMPARISON', 'MultiplexParticipation').get('P1');
% % % multiplexparticipation_BUT_p2 = c_BUT.get('COMPARISON', 'MultiplexParticipation').get('P2');
% % % multiplexparticipation_BUT_cil = c_BUT.get('COMPARISON', 'MultiplexParticipation').get('CIL');
% % % multiplexparticipation_BUT_ciu = c_BUT.get('COMPARISON', 'MultiplexParticipation').get('CIU');

% % % ovdegree_av_BUT_diff = c_BUT.get('COMPARISON', 'OverlappingDegreeAv').get('DIFF');
% % % ovdegree_av_BUT_p1 = c_BUT.get('COMPARISON', 'OverlappingDegreeAv').get('P1');
% % % ovdegree_av_BUT_p2 = c_BUT.get('COMPARISON', 'OverlappingDegreeAv').get('P2');
% % % ovdegree_av_BUT_cil = c_BUT.get('COMPARISON', 'OverlappingDegreeAv').get('CIL');
% % % ovdegree_av_BUT_ciu = c_BUT.get('COMPARISON', 'OverlappingDegreeAv').get('CIU');

% % % edgeov_BUT_diff = c_BUT.get('COMPARISON', 'EdgeOverlap').get('DIFF');
% % % edgeov_BUT_p1 = c_BUT.get('COMPARISON', 'EdgeOverlap').get('P1');
% % % edgeov_BUT_p2 = c_BUT.get('COMPARISON', 'EdgeOverlap').get('P2');
% % % edgeov_BUT_cil = c_BUT.get('COMPARISON', 'EdgeOverlap').get('CIL');
% % % edgeov_BUT_ciu = c_BUT.get('COMPARISON', 'EdgeOverlap').get('CIU');
% % % mpc_av_BUT_ciu = c_BUT.get('COMPARISON', 'MultiplexParticipationAv').get('CIU');