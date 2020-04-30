function value =  get_data_from_varargin(rule, measure_code, data_number, brainregion_number, varargin)

if Measure.is_global(measure_code)
    value = get_from_varargin( ...
        repmat({0}, 1, data_number), ...
        rule, ...
        varargin{:});
elseif Measure.is_nodal(measure_code)
    value = get_from_varargin( ...
        repmat({zeros(brainregion_number, 1)}, 1, data_number), ...
        rule, ...
        varargin{:});
elseif Measure.is_binodal(measure_code)
    value = get_from_varargin( ...
        repmat({zeros(brainregion_number)}, 1, data_number), ...
        rule, ...
        varargin{:});
end

end