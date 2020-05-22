classdef DummyMultigraph < Graph

    methods  % Constructor
        function g = DummyMultigraph(~, varargin)
            
            A = get_from_varargin( ...
                {
                rand(3)	{}      {}
                {}      rand(3) {}
                {}      {}      rand(3)
                }, ...
                'A', ...
                varargin);
            
            g = g@Graph(A, varargin{:});
        end
    end
    methods (Static)  % Descriptive methods
        function graph_class = getClass()
            % GETCLASS returns the class of the graph.
            %
            % GRAPH_CLASS = GETCLASS() returns the class, 'GraphBD'.
            %
            % See also getName().
            
            graph_class = 'DummyMultigraph';
        end
        function name = getName()
            % GETNAME returns the name of the graph.
            %
            % NAME = GETCLASS() returns the name, 'Binary Directed Graph'.
            %
            % See also getClass().
            
            name = 'Dummy Multigraph';
        end
        function description = getDescription()
            % GETDESCRIPTION returns the description of the graph.
            %
            % DESCRIPTION = GETDESCRIPTION() returns the description of GRAPHBD.
            %
            % See also getName().
            
            description = [ ...
                'Dummy Multipgraph used mainly' ...
                'for unit testing and debugging. ' ...
                ];
        end
        function graph_type = getGraphType()
            graph_type = Graph.MULTIGRAPH;
        end
        function connectivity_type = getConnectivityType(varargin)
            
            if isempty(varargin)
                layernumber = 3;
            else
                layernumber = varargin{1};
            end
            
            connectivity_type = diag(Graph.WEIGHTED * ones(1, layernumber));
        end
        function directionality_type = getDirectionalityType(varargin)
            
            if isempty(varargin)
                layernumber = 3;
            else
                layernumber = varargin{1};
            end
            
            directionality_type = diag(Graph.DIRECTED * ones(1, layernumber));
        end
        function selfconnectivity_type = getSelfConnectivityType(varargin)
            
            selfconnectivity_type = Graph.SELFCONNECTED;
        end
        function negativity_type = getNegativityType(varargin)
            % GETNEGATIVITYTYPE checks if the graph is non-negative or negative
            %
            % BOOL = GETNEGATIVITYTYPE() returns NONNEGATIVE for GRAPHBD.
            %
            % See also getConnectivityType(), getEdgeType(), getGraphType() and getSelfConnectivityType().
            
            negativity_type =  Graph.NONNEGATIVE;
        end
    end
end