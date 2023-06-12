%% ¡header!
PanelPropString < PanelProp (pr, panel property string) plots the panel of a property string.

%%% ¡description!
PanelPropString plots the panel for a STRING property with an edit field.
It works for all categories.

%%% ¡seealso!
uieditfield, GUI, PanelElement, PanelProp

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the string property panel.
%%%% ¡default!
'PanelPropString'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the string property panel.
%%%% ¡default!
'PanelPropString plots the panel for a STRING property with an edit field. It works for all categories.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the string property panel.

%%% ¡prop!
ID (data, string) is a few-letter code for the string property panel.
%%%% ¡default!
'PanelPropString ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the string property panel.
%%%% ¡default!
'PanelPropString label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the string property panel.
%%%% ¡default!
'PanelPropString notes'

%%% ¡prop!
EL (data, item) is the element.
%%%% ¡default!
ConcreteElement()

%%% ¡prop!
PROP (data, scalar) is the property number.
%%%% ¡default!
ConcreteElement.ID

%%% ¡prop!
HEIGHT (gui, size) is the pixel height of the property panel.
%%%% ¡default!
s(4)

%%% ¡prop!
X_DRAW (query, logical) draws the property panel.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.X_DRAW, varargin{:}); % also warning
if value
    pr.memorize('EDITFIELD')
end

%%% ¡prop!
UPDATE (query, logical) updates the content and permissions of the editfield.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.UPDATE, varargin{:}); % also warning
if value
    el = pr.get('EL');
    prop = pr.get('PROP');
    
    switch el.getPropCategory(prop)
        case Category.CONSTANT
            set(pr.get('EDITFIELD'), ...
                'Value', el.get(prop), ...
                'Editable', 'off', ...
                'Enable', pr.get('ENABLE') ...
                )
            
        case Category.METADATA
            set(pr.get('EDITFIELD'), 'Value', el.get(prop))

            if el.isLocked(prop)
                set(pr.get('EDITFIELD'), ...
                    'Editable', 'off', ...
                    'Enable', pr.get('ENABLE') ...
                    )
            end
            
        case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
            set(pr.get('EDITFIELD'), 'Value', el.get(prop))

            prop_value = el.getr(prop);
            if el.isLocked(prop) || isa(prop_value, 'Callback')
                set(pr.get('EDITFIELD'), ...
                    'Editable', 'off', ...
                    'Enable', pr.get('ENABLE') ...
                    )
            end

        case {Category.RESULT Category.QUERY Category.EVANESCENT}
            prop_value = el.getr(prop);

            if isa(prop_value, 'NoValue')
                set(pr.get('EDITFIELD'), 'Value', el.getPropDefault(prop))
            else
                set(pr.get('EDITFIELD'), 'Value', el.get(prop))
            end
            
            set(pr.get('EDITFIELD'), ...
                'Editable', 'off', ...
                'Enable', pr.get('ENABLE') ...
                )
    end
end

%%% ¡prop!
REDRAW (query, logical) resizes the property panel and repositions its graphical objects.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.REDRAW, varargin{:}); % also warning
if value
    w_p = get_from_varargin(w(pr.get('H'), 'pixels'), 'Width', varargin);
    
    set(pr.get('EDITFIELD'), 'Position', [s(.3) s(.3) w_p-s(.6) s(1.75)])
end

%%% ¡prop!
DELETE (query, logical) resets the handles when the panel is deleted.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.DELETE, varargin{:}); % also warning
if value
    pr.set('EDITFIELD', Element.getNoValue())
end

%% ¡props!

%%% ¡prop!
ENABLE (gui, logical) switches the editfield between active and inactive appearance when not editable.
%%%% ¡default!
true

%%% ¡prop!
EDITFIELD (evanescent, handle) is the string value edit field.
%%%% ¡calculate!
el = pr.get('EL');
prop = pr.get('PROP');

editfield = uieditfield( ...
    'Parent', pr.memorize('H'), ... % H = p for Panel
    'Tag', 'EDITFIELD', ...
    'FontSize', BRAPH2.FONTSIZE, ...
    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
    'ValueChangedFcn', {@cb_editfield} ...
    );

value = editfield;
%%%% ¡calculate_callbacks!
function cb_editfield(~, ~)
    pr.get('EL').set(pr.get('PROP'), get(pr.get('EDITFIELD'), 'Value'))
end

%% ¡tests!

%%% ¡excluded_props!
[PanelPropString.PARENT PanelPropString.H PanelPropString.LISTENER_CB PanelPropString.EDITFIELD]

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡parallel!
false
%%%% ¡code!
warning('off', [BRAPH2.STR ':PanelPropString'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':PanelPropString'])