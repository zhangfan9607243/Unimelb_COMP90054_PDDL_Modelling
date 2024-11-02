(define (problem p4-UpdsideDown)

    (:domain UpdsideDown)
    
    (:objects
        
        cell-1 cell-2 cell- cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 - cells
        red green - colour
        m1 - matches
        k1 k2 - keys
        
    )
    
    (:init
  
        ;Initial Hero Location
        (cell-has-hero cell-1)
        
        ;She starts with a free arm
        (hero-hand-empty)
        
        ;Initial location of the keys
        (cell-has-key k1 cell-2)
        (cell-has-key k2 cell-4)
        
        ;Initial location of the matches
        (cell-has-match m1 cell-6)
        
        ;Initial location of Monsters
        (cell-has-monster cell-7)
        
        ;Initial lcocation of open gates
        (cell-has-gate-open cell-3 red)
        (cell-has-gate-open cell-5 green)
        
        ;Key uses
        (key-infinite-uses k1)
        (key-two-use k2)
        
        ;Key Colours
        (key-colour k1 red)
        (key-colour k2 green)
        
        ;Graph Connectivity
        (cell-connected cell-1 cell-2)
        (cell-connected cell-2 cell-1)
        (cell-connected cell-2 cell-3)
        (cell-connected cell-3 cell-2)
        (cell-connected cell-3 cell-4)
        (cell-connected cell-4 cell-3)
        (cell-connected cell-4 cell-5)
        (cell-connected cell-5 cell-4)
        (cell-connected cell-5 cell-6)
        (cell-connected cell-6 cell-5)
        (cell-connected cell-6 cell-7)
        (cell-connected cell-7 cell-6)
        (cell-connected cell-7 cell-8)
        (cell-connected cell-8 cell-7)
    
    )
    
    (:goal 
        (and
        
            ;Hero's Goal Location
            (cell-has-hero cell-8)
            
            ;All gates are closed
            (cell-has-gate-closed cell-3)
            (cell-has-gate-closed cell-5)
            
        )
    )
  
)
