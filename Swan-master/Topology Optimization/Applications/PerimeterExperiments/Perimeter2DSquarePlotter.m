classdef Perimeter2DSquarePlotter < handle
    
    properties (Access = public)
        
    end
    
    properties (Access = private)
        perimeterCase
        filesPath
        testName
        testPath
        fieldsData
        perimeterName
        perimeterSym
        perimterExactSym
        perimeterFactor
        perimeterFactorStr
        linesData
        barData
    end
    
    properties (Access = private)
        
    end
    
    methods (Access = public)
        
        function obj = Perimeter2DSquarePlotter()
            obj.init();
            obj.loadFieldsData();
            obj.plotData();
        end
        
    end
    
    methods (Access = private)

        function init(obj)
            obj.perimeterCase = 'Total';
            obj.perimeterName = 'Perimeter';
            obj.perimeterSym  = 'Rob';
            obj.perimterExactSym = 'T';
              obj.perimeterFactor = 1/2;
              obj.perimeterFactorStr = '\frac{1}{2}';
            
%            obj.perimeterCase = 'Relative';
%             obj.perimeterName = 'PerimeterInterior';
%             obj.perimeterSym  = 'Neu';
%             obj.perimterExactSym = 'R';
%             obj.perimeterFactor = 1/2;
%             obj.perimeterFactorStr = '\frac{1}{2}';            
            

            obj.testName = ['PerimeterVolumeTestSquare',obj.perimeterCase];
            obj.filesPath = '/media/alex/My Passport/PerimeterResults/';
            obj.testPath = fullfile(obj.filesPath,obj.testName);
            obj.linesData = [1:6,9:14];            
            obj.barData = [7,8];              
        end
        
        function loadFieldsData(obj)
            s.testPath  = obj.testPath;
            s.linesData = obj.linesData;
            s.barData   = obj.barData;            
            m = MonitoringDataLoader(s);
            obj.fieldsData = m.obtainData();
        end        
      
        function plotData(obj)
            obj.plotCostFigure();
            obj.plotPerimeterAproxVsExactFigure();
            obj.plotTheta();
        end
        
        function plotCostFigure(obj)
            [xP,yP] = obj.obtainField([obj.perimeterName,' (wt. 1.00)']);
            %[xP,yP] = obj.obtainField('PerimeterInterior (wt. 0.20)');
            [xV,yV] = obj.obtainField('Volum');            
            [xL,yL] = obj.obtainField('\lambda_V_o_l_u_m_e_C_o_n_s_t_r_a_i_n_t');            
            f = figure();
            hold on
            p{1} = plot(xP,yP);
            p{2} = plot(xV,yV);            
            p{3} = plot(xL,yL);                        
            perString = ['{\textrm{P}}^{',obj.perimeterSym,'}_{\varepsilon}(\chi_{\Omega})'];            
            leg{1} = ['$',perString,'$']; 
            leg{2} = '$\textrm{Vol}(\chi_{\Omega})$';        
            leg{3} = '$\lambda$';                                    
            leg = legend(leg,'Interpreter','latex','Location','Best');
            set(leg,'Interpreter','latex')            
            p = plotPrinter(f,p);
            p.print(fullfile(obj.testPath,['Cost']));            
        end
        
        function plotPerimeterAproxVsExactFigure(obj)
            [xPe,yPe] = obj.obtainField(['Geometric ',obj.perimeterCase,' Perimeter']);
            [xPa,yPa] = obj.obtainField('Perimeter non scaled');
            f = figure();
            hold on
            p{1} = plot(xPe,yPe*obj.perimeterFactor);
            p{2} = plot(xPa,obj.perimeterFactor*yPa);
            perString = ['{\textrm{P}}^{',obj.perimeterSym,'}_{\varepsilon}(\chi_{\Omega})'];            
            leg{1} = ['$\textrm{Exact ',lower(obj.perimeterCase),' perimeter }  ',obj.perimeterFactorStr,'{\textrm{P}}^',obj.perimterExactSym,'(\chi_{\Omega})','$'];                        
            leg{2} = ['$\textrm{Approximated ',lower(obj.perimeterCase),' perimeter }  ',perString,'$'];                        
            leg = legend(leg,'Interpreter','latex','Location','Best');
            set(leg,'Interpreter','latex')            
            p = plotPrinter(f,p);
            p.print(fullfile(obj.testPath,['Perimeter']));                        
        end
        
        function plotTheta(obj)
            [xPe,yPe] = obj.obtainField('\theta');
            [xPa,yPa] = obj.obtainField('epsilon over h');
            f = figure();
            hold on
            p{1} = plot(xPe,yPe);
            p{2} = plot(xPa,yPa);            
            leg{1} = '$\theta$';                        
            leg{2} = '$\varepsilon/h$';                        
            leg = legend(leg,'Interpreter','latex','Location','Best');
            set(leg,'Interpreter','latex')            
            p = plotPrinter(f,p);
            p.print(fullfile(obj.testPath,['Theta']));                        
        end        
        
        function [xV,yV] = obtainField(obj,fieldName)
            for iField = 1:numel(obj.fieldsData)
                title = obj.fieldsData{iField}.title;
                if strcmp(fieldName,title)
                    xV = obj.fieldsData{iField}.xValue;
                    yV = obj.fieldsData{iField}.yValue;
                end
            end
        end
        
    end
    
end