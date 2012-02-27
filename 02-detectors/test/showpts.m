function h = showpts(pts, props, cutoff)
% SHOWPTS(PTS) - draws points into image, PTS can be either 2xN [x;y] or 3xN [x;y;s] matrix. S is used as a scale of
% the point and circles with radius 3*S are drawn by default.
% SHOWPTS(PTS, PROPS) - draws points using properties in PROPS 
% SHOWPTS(PTS, PROPS, CUTOFF) - draws points using properties in PROPS and uses multiplier CUTOFF (default =3.0) to get
% radius of the circle.
%
   if (nargin<2)
      props.color = 'r';      
   end;
   if (nargin<3)
      cutoff = 3;
   end;
   marker = 'x';
   
   unit = linspace(0,2*pi,36);
   % show 3*\sigma neighbourhood
   ux = cutoff*cos(unit);
   uy = cutoff*sin(unit);
   
   if (isstruct(pts))
      
      if (isfield(pts, 's'));
         % scale invariant points
         h=zeros(length(pts));
         for i=1:length(pts)
            p = pts(i);
            h(i)=line(p.x+ux*p.s+1, p.y+uy*p.s+1, props);
         end;
      else
         if (isfield(pts, 'x'))
            % translation invariant points
            h=line(x+1,y+1, 'linestyle','none', 'marker', marker, props);
         end;
      end;
   else
      switch size(pts,1)
         case 3
           % scale invariant points x;y;s
           h=zeros(size(pts,2));
           for p=1:size(pts,2)
              h(p)=line(pts(1,p)+ux*pts(3,p)+1, pts(2,p)+uy*pts(3,p)+1, props);
           end;
        case 2
          h=line(pts(1,:)+1, pts(2,:)+1, 'linestyle','none', 'marker', marker, props);
      end;
   end;   