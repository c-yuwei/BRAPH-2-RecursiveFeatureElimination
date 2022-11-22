%EXAMPLE_CON_MP_GA_WU
% Script example pipeline CON MP GA WU

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('SubjectCON_MP')) filesep 'example data CON_MP' filesep 'aal90_atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectFUN_MP
im_gr1 = ImporterGroupSubjectCON_MP_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_MP')) filesep 'example data CON_MP' filesep 'xls' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_MP_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectCON_MP')) filesep 'example data CON_MP' filesep 'xls' filesep 'GroupName2'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

%% Analysis Group CON_MP WU
a_WU1 = AnalyzeGroup_CON_MP_GA_WU( ...
    'GR', gr1 ...
    );

a_WU2 = AnalyzeGroup_CON_MP_GA_WU( ...
    'GR', gr2 ...
    );

% measure calculation
g_WU1 = a_WU1.get('G');
overlappingdegree_WU1 = g_WU1.getMeasure('OverlappingDegree').get('M');
overlappingdegree_av_WU1 = g_WU1.getMeasure('OverlappingDegreeAv').get('M');
edgeoverlap_WU1 = g_WU1.getMeasure('EdgeOverlap').get('M');

g_WU2 = a_WU2.get('G');
overlappingdegree_WU2 = g_WU2.getMeasure('OverlappingDegree').get('M');
overlappingdegree_av_WU2 = g_WU2.getMeasure('OverlappingDegreeAv').get('M');
edgeoverlap_WU2 = g_WU2.getMeasure('EdgeOverlap').get('M');

% comparison
c_WU = CompareGroup( ...
    'P', 10, ...
    'A1', a_WU1, ...
    'A2', a_WU2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

overlappingdegree_WU_diff = c_WU.getComparison('OverlappingDegree').get('DIFF');
overlappingdegree_WU_p1 = c_WU.getComparison('OverlappingDegree').get('P1');
overlappingdegree_WU_p2 = c_WU.getComparison('OverlappingDegree').get('P2');
overlappingdegree_WU_cil = c_WU.getComparison('OverlappingDegree').get('CIL');
overlappingdegree_WU_ciu = c_WU.getComparison('OverlappingDegree').get('CIU');

overlappingdegree_av_WU_diff = c_WU.getComparison('OverlappingDegreeAv').get('DIFF');
overlappingdegree_av_WU_p1 = c_WU.getComparison('OverlappingDegreeAv').get('P1');
overlappingdegree_av_WU_p2 = c_WU.getComparison('OverlappingDegreeAv').get('P2');
overlappingdegree_av_WU_cil = c_WU.getComparison('OverlappingDegreeAv').get('CIL');
overlappingdegree_av_WU_ciu = c_WU.getComparison('OverlappingDegreeAv').get('CIU');

edgeoverlap_WU_diff = c_WU.getComparison('EdgeOverlap').get('DIFF');
edgeoverlap_WU_p1 = c_WU.getComparison('EdgeOverlap').get('P1');
edgeoverlap_WU_p2 = c_WU.getComparison('EdgeOverlap').get('P2');
edgeoverlap_WU_cil = c_WU.getComparison('EdgeOverlap').get('CIL');
edgeoverlap_WU_ciu = c_WU.getComparison('EdgeOverlap').get('CIU');