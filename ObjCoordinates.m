classdef ObjCoordinates   
    
    properties
        
        XYZ
        Yim
        Xim
        Factor
        GridedData
        
    
    end % properties
    
    methods
        
        function td = ObjCoordinates(XYZ)
            
            if nargin >0
                
                td.XYZ = XYZ.*2; %getCoord(XYZ);
                
            end 
            
        end % Grundfunktion

            
        function XYZ = get.XYZ(obj)
            
            
            XYZ = getCoord(obj.XYZ);
            
        end % getXYZ
        
        function Yim =get.Yim(obj)
            
            [Yim Xim]=size
            
        end
        
        
        
        function GridedData = get.GridedData(obj)
               
                  [Yim Xim Zim] = size (obj.XYZ);
                  Xim = Xim.* obj.Factor; Yim = Yim.* obj.Factor; 

                  GridedData = zeros(Yim, Xim);

                  Nrounds = size(obj.XYZ(:,3));

                  for n = 1:Nrounds
    
                    Ycoord=round(obj.XYZ(n,1).*obj.Factor); Xcoord=round(obj.XYZ(n,2).*obj.Factor);
    
                    GridedData(Ycoord, Xcoord)= obj.XYZ(n,3);
    
                  end

                
                
            end % function GridedData
                
                
            
        
    end % methods
    
end % classdef


        function [XYZ] = getCoord(Image)

            [Row Col Value] = find(Image>0); % irgendwie muss ich hier noch die größe einbauen....

            XYZ = [Row, Col, Value];

        end
            


