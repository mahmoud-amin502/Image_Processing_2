function [h01,h02] = Untitled(  )

N=2;
n=1;
p1=0;
q1=0;
p=[];
q=[];
for k=1:N
    k1=k-1;
    t=2^p1+q1-1;
    while(t~=k1)
        q1=q1+1;
        if(q1>=1&&q1<=2^p1)
            t=2^p1+q1-1;
        else
            p1=p1+1;
            q1=q1-p1-1;
            if(q1>=1&&q1<=2^p1)
                q1=1;
                t=2^p1+q1-1;
            end
        end
    end
    p=[p;p1];
    q=[q;q1];
end

%%%%%%%%%%%%%%%%%%% HAAR MATRIX CONSTRUCTION %%%%%%%%%%%%%%%

for i=1:N
    p2=p(i);
    q2=q(i);
    for j=1:N
        if(i==1)
            h(i,j)=(1/sqrt(N));
        else
            z=(j-1)/N;
            if((z >=((q2-1)/2.^p2) )  && ( z < ((q2-0.5)/2.^p2)))
                h(i,j)=2.^(p2/2)*(1/sqrt(N));
            elseif (( z >= ((q2-0.5)/2.^p2) )  && ( z < (q2/2.^p2) ))
                h(i,j)=-2.^(p2/2)*(1/sqrt(N));
            else
                h(i,j)= 0;
            end
        end
    end
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%% TESTING FILTERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


h01=h(1,1:N);
h02=h(2,1:N);

% h11=h(2,1:N);
% h12=h(5,1:N);



% g01=fliplr(h01);
% g02=fliplr(h02);
% 
% g11=fliplr(h11);
% g12=fliplr(h12);


end

