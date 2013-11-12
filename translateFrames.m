function translateFrames(self)
            %   This function translates GPR samples into corresponding
            %   video frames.
            a             = self.gprData.pre.sampleAssignment(:)                    ;
            postAssign    = ones( max( a ) - min( a ) , 1 )                         ;
            postTimes     = postAssign                                              ;
            gprTimes      = self.gprDataRaw.bscan.timeStamps                        ;
            for i = unique( a )' ,
                aLocations                      = ( find( a == ( i ) ) )            ;
                postAssign( a( i ) )            = mean( aLocations )             	;
                postTimes( i )                  = mean( gprTimes( aLocations ) )    ;
            end
            self.normalizedFrameAssignment      = postAssign / max( postAssign )   	;
            self.absoluteFrameAssignment        = postAssign                       	;
            self.resampledTimes                 = postTimes                         ;
        end