function matched = rep_match( to_be_matched , match_against )
%   usage: 
%       matched = rep_match( to_be_matched , match_against )
%   It's common to need to repmat a row or column vector to form a matrix
%   the same size as some existing matrix, to get the most out of MATLAB's
%   enhanced matrix processing rather than looping. Rep_match takes in the
%   vector you want to repmat - to_be_matched - and matches its size to
%   that of the matrix match_against; if no match can be made, the original
%   to_be_matched vector is returned as a result of a repmat with dimension
%   arguments that are all equal to 1. 
%
%   Example:
%       to_be_matched   = sin( -pi : pi / 20 : pi )                     ; 
%       match_against   = randn( numel( to_be_matched ) )               ; 
%       matched         = rep_match( to_be_matched , match_against )    ; 
%
%       size_of_matched = size( matched ) 
%       size_of_ref     = size( match_against )
%       % the last two results should be equal. 


sz_against      = size( match_against )         ;
sz_tbm          = size( to_be_matched )         ;
non_match       = not( sz_against == sz_tbm )   ;
transp_against  = size( match_against' )        ;
transp_tbm      = size( to_be_matched' )        ;

if sum( sz_against == sz_tbm ) == sum( transp_against == sz_tbm )
    disp( 'Match could work against transposed reference matrix, check result.' )
end

dimensions                  = ones( size( sz_against )  )               ;
dimensions( non_match )     = sz_against( non_match )                   ;
matched                     = repmat( to_be_matched , dimensions )      ;

if all( dimensions == 1 )
    disp( 'No match could be found, original vector returned.' )
    if any( transp_tbm == sz_against )
        disp( 'Transposed source vector could produce a viable result.' )
    end
end

end