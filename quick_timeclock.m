function quick_timeclock( varargin )

a   = [ 7.93 , 12.48 , 12.92 ]                  ;
b   = [ 7.93 , 12.48 , 12.92 , 17 ]             ;

time_vec        = a(:)                          ;
input_is_odd    = mod( numel( time_vec) , 2 )   ;

if input_is_odd,
    time_vec( end + 1 ) = 0                     ;
end

num_pairs       = idivide( numel( time_vec ) , uint8( 2 ) )     ;
rectangle_time  = reshape( time_vec , [ num_pairs , 2 ] )       ;
time_earned     = sum( diff( rectangle_time )  )                ;
desired_hours   = [ 8 8.5 9 ]                                   ;

if input_is_odd,
    c             = clock                                       ;
    now_time      = c(4) + c(5)/60 + c(6)/3600                  ;
    earned        = sum( diff( reshape(                         ...
                    [ time_vec( 1 : end-1 ) ; now_time ],       ...
                    [ num_pairs , 2 ] ) ) )                     ;
    hours_to_work = mod( desired_hours - time_earned , 12 )     ;
    fprintf( 'If you leave now you will have worked %2.2f hours.\n' ,     ...
             earned )
end

fprintf( '%2.2f %2.2f %2.2f\n%2.2f %2.2f %2.2f\n' ,             ...
         hours_to_work , desired_hours ) 


end