classdef ObjCoordinates   
    
    properties
        
        Original % Originalmatrix // leider kenne ich keine Möglichkeit das zu vermeiden
        XYZ % Matrix mit den Koordinaten // Z ist eigenlich der Value
        Factor % Schrumpffaktor
        GridedData % neue Matrix gemäß dem Schrumpffaktor
        
    
    end % properties
    
    methods
        
        function td = ObjCoordinates(Original)
            
            if nargin >0
                
                td.Original = Original; %getCoord(XYZ);
                td.Factor = Factor;
                
            end 
            
        end % setzt das Originalbild

        
        function XYZ = get.XYZ(obj)
            
            Image = obj.Original;
            
            [Row Col Value] = find(Image>0); % irgendwie muss ich hier noch die größe einbauen....

            XYZ = [Row, Col, Value];
            
        end % getXYZ
        
        
        function GridedData = get.GridedData(obj)
            
                  Original = obj.Original;
                  XYZ = obj.XYZ;
                  Factor = obj.Factor;
               
                  [Yim Xim NonUsed] = size (Original);
                  Xim = Xim*Factor; Yim = Yim*Factor; 

                  GridedDataZwischenvariable = zeros(Yim, Xim);

                  [Nrounds NonUsed] = size(XYZ(:,3));
                    
                  if Factor <=1
                      
                         for n = 1:Nrounds
    
                            Ycoord=round(XYZ(n,1)*Factor); 
                            Xcoord=round(XYZ(n,2)*Factor);
    
                            GridedDataZwischenvariable(Ycoord, Xcoord)= XYZ(n,3);
    
                         end
                         
                     GridedData = GridedDataZwischenvariable;
                    
                  else
                      
                      GridedData = 'Not available yet';
                      
                      
                  end
                  
                
            end % function GridedData

                             
                
    end % methods
    
end % classdef



