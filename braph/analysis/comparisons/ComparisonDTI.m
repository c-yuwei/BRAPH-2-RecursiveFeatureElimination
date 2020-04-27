classdef ComparisonDTI < Comparison
    properties
        measure_code  % class of measure
        difference_mean  % dm
        difference_all   % dall
        p_single  % p value single tailed
        p_double  % p value double tailed
        percentiles   % percentiles
    end
    methods
        function c =  ComparisonDTI(id, atlas, groups, varargin)
            
            c = c@Comparison(id, atlas, groups, varargin{:});
        end
        function measure_code = getMeasureCode(c)
            measure_code = c.measure_code;
        end
        function difference_mean = getDifferenceMean(c)
            difference_mean = c.difference_mean;
        end
        function difference_all = getDifferenceAll(c)
            difference_all = c.difference_all;
        end
        function p_single = getPSingleTail(c)
            p_single = c.p_single;
        end
        function p_double = getPDoubleTail(c)
            p_double = c.p_double;
        end
        function percentile = getPercentile(c)
            percentile = c.percentile;
        end
    end
    methods (Access=protected)
        function initialize_data(c, varargin)
            
            atlases = c.getBrainAtlases();
            atlas = atlases{1};
            groups =  c.getGroups();
            c.measure_code = get_from_varargin('',  'ComparisonDTI.measure_code', varargin{:});
            
            if Measure.is_global(c.getMeasureCode())
                dm = get_from_varargin( ...
                    repmat({0}, 1, groups{1}.subjectnumber()), ...
                    'ComparisonDTI.difference_mean', ...
                    varargin{:});
            elseif Measure.is_nodal(c.getMeasureCode())
                dm = get_from_varargin( ...
                    repmat({zeros(atlas.getBrainRegions().length(), 1)}, ...
                    1,  groups{1}.subjectnumber()), ...
                    'ComparisonDTI.difference_mean', ...
                    varargin{:});
            elseif Measure.is_binodal(c.getMeasureCode())
                dm = get_from_varargin( ...
                    repmat({zeros(atlas.getBrainRegions().length())}, ...
                    1,  groups{1}.subjectnumber()), ...
                    'ComparisonDTI.difference_mean', ...
                    varargin{:});
            end
            c.difference_mean = dm;
            c.difference_all =  get_from_varargin(0,'ComparisonDTI.difference_all', varargin{:});
            c.p_single = get_from_varargin(0, 'ComparisonDTI.psingle', varargin{:});
            c.p_double = get_from_varargin(0, 'ComparisonDTI.pdobule', varargin{:});
            c.percentiles = get_from_varargin(0, 'ComparisonDTI.percentiles', varargin{:});
        end
    end
    methods (Static)
        function measurementClass = getClass(c) %#ok<*INUSD>
            measurementClass = 'ComparisonDTI';
        end
        function name = getName(c)
            name = 'Comparison DTI';
        end
        function description = getDescription(c)
            % measurement description missing
            description = '';
        end
        function atlas_number = getBrainAtlasNumber(c)
            atlas_number =  1;
        end
        function group_number = getGroupNumber(c)
            group_number = 2;
        end
        function sub = getComparison(comparisonClass, id, varargin)
            sub = eval([comparisonClass '(id, varargin{:})']);
        end
    end
end