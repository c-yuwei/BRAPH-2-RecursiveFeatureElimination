%EXAMPLE_CON_FUN_MP_WU
% Script example pipeline CON FUN MP WU

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
co_gr1 = CombineGroups_CON_FUN( ...
    'GR1', gr1_CON, ...
    'GR2', gr1_FUN, ...
    'WAITBAR', true ...
    );

gr1 = co_gr1.get('GR');

co_gr2 = CombineGroups_CON_FUN( ...
    'GR1', gr2_CON, ...
    'GR2', gr2_FUN, ...
    'WAITBAR', true ...
    );

gr2 = co_gr2.get('GR');

%% Analysis CON FUN MP WU
a_WU1 = AnalyzeEnsemble_CON_FUN_MP_WU( ...
    'GR', gr1 ...
    );

a_WU2 = AnalyzeEnsemble_CON_FUN_MP_WU( ...
    'TEMPLATE', a_WU1, ...
    'GR', gr2 ...
    );

% measure calculation
wmultiplexparticipation_WU1 = a_WU1.get('MEASUREENSEMBLE', 'WeightedMultiplexParticipation').get('M');
wmultiplexparticipation_av_WU1 = a_WU1.get('MEASUREENSEMBLE', 'WeightedMultiplexParticipationAv').get('M');
wedgeov_WU1 = a_WU1.get('MEASUREENSEMBLE', 'WeightedEdgeOverlap').get('M');

wmultiplexparticipation_WU2 = a_WU2.get('MEASUREENSEMBLE', 'WeightedMultiplexParticipation').get('M');
wmultiplexparticipation_av_WU2 = a_WU2.get('MEASUREENSEMBLE', 'WeightedMultiplexParticipationAv').get('M');
wedgeov_WU2 = a_WU2.get('MEASUREENSEMBLE', 'WeightedEdgeOverlap').get('M');

% % % % comparison
% % % c_WU = CompareEnsemble( ...
% % %     'P', 10, ...
% % %     'A1', a_WU1, ...
% % %     'A2', a_WU2, ...
% % %     'WAITBAR', true, ...
% % %     'VERBOSE', false, ...
% % %     'MEMORIZE', true ...
% % %     );
% % % 
% % % wmultiplexparticipation_WU_diff = c_WU.get('COMPARISON', 'WeightedMultiplexParticipation').get('DIFF');
% % % wmultiplexparticipation_WU_p1 = c_WU.get('COMPARISON', 'WeightedMultiplexParticipation').get('P1');
% % % wmultiplexparticipation_WU_p2 = c_WU.get('COMPARISON', 'WeightedMultiplexParticipation').get('P2');
% % % wmultiplexparticipation_WU_cil = c_WU.get('COMPARISON', 'WeightedMultiplexParticipation').get('CIL');
% % % wmultiplexparticipation_WU_ciu = c_WU.get('COMPARISON', 'WeightedMultiplexParticipation').get('CIU');
% % % 
% % % wmultiplexparticipation_av_WU_diff = c_WU.get('COMPARISON', 'WeightedMultiplexParticipationAv').get('DIFF');
% % % wmultiplexparticipation_av_WU_p1 = c_WU.get('COMPARISON', 'WeightedMultiplexParticipationAv').get('P1');
% % % wmultiplexparticipation_av_WU_p2 = c_WU.get('COMPARISON', 'WeightedMultiplexParticipationAv').get('P2');
% % % wmultiplexparticipation_av_WU_cil = c_WU.get('COMPARISON', 'WeightedMultiplexParticipationAv').get('CIL');
% % % wmultiplexparticipation_av_WU_ciu = c_WU.get('COMPARISON', 'WeightedMultiplexParticipationAv').get('CIU');
