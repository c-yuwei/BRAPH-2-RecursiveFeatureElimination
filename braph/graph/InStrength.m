classdef InStrength < Measure
    methods
        function m = InStrength(g, varargin)
            m = m@Measure(g, varargin{:});
        end
    end    
    methods (Access=protected)
        function calculate(m)
            g = m.getGraph();
            A = g.getA();
            in_strength = sum(A, 1)';  % column sum of A        
            m.setValue(in_strength);
        end
    end  
    methods (Static)
        function name = getName()
            name = 'In-Strength';
        end
        function description = getDescription()
            description = [ ...
                'The in-strength of a node is ' ...
                'the sum of the weights of all ' ...
                'the inward edges connected to a node.' ...
                'For WD graphs, out-strengths are calculated ' ...
                'as sums over columns of ' ...
                'the weighted connectivity matrix. ' ...
                ];
        end
        function bool = is_global()                        
            bool = false;
        end
        function bool = is_nodal()
            bool = true;
        end
        function list = compatible_graph_list()  
            list = { ...
                'GraphWD' ...
                };
        end
    end
end