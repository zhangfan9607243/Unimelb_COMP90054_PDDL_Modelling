(define (problem p1-UpdsideDown)

    (:domain UpdsideDown)
  
    (:objects
    
        cell-1 cell-2 cell- cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 cell-11 - cells
        red green blue - colour
        m1 - matches
        k1 k2 k3 - keys
        
    )
  
    (:init
  
        ;Initial Hero Location
        (cell-has-hero cell-1)
    
        ;She starts with a free arm
        (hero-hand-empty)
        
        ;Initial location of the keys
        (cell-has-key k1 cell-2)
        (cell-has-key k2 cell-8)
        (cell-has-key k3 cell-10)
        
        ;Initial location of the matches
        (cell-has-match m1 cell-4)
        
        ;Initial location of Monsters
        (cell-has-monster cell-3)
        
        ;Initial lcocation of open gates
        (cell-has-gate-open cell-5 red)
        (cell-has-gate-open cell-6 green)
        (cell-has-gate-open cell-9 green)
        (cell-has-gate-open cell-7 blue)
        
        ;Key uses
        (key-infinite-uses k1)
        (key-two-use k2)
        (key-one-use k3)
        
        ;Key Colours
        (key-colour k1 red)
        (key-colour k2 green)
        (key-colour k3 blue)
        
        ;Graph Connectivity
        (cell-connected cell-1 cell-2)
        (cell-connected cell-2 cell-1)
        (cell-connected cell-2 cell-3)
        (cell-connected cell-3 cell-2)
        (cell-connected cell-3 cell-4)
        (cell-connected cell-4 cell-3)
        (cell-connected cell-3 cell-11)
        (cell-connected cell-11 cell-3)
        (cell-connected cell-2 cell-5)
        (cell-connected cell-5 cell-2)
        (cell-connected cell-3 cell-6)
        (cell-connected cell-6 cell-3)
        (cell-connected cell-4 cell-7)
        (cell-connected cell-7 cell-4)
        (cell-connected cell-5 cell-6)
        (cell-connected cell-6 cell-5)
        (cell-connected cell-6 cell-7)
        (cell-connected cell-7 cell-6)
        (cell-connected cell-5 cell-8)
        (cell-connected cell-8 cell-5)
        (cell-connected cell-6 cell-9)
        (cell-connected cell-9 cell-6)
        (cell-connected cell-7 cell-10)
        (cell-connected cell-10 cell-7)
        (cell-connected cell-8 cell-9)
        (cell-connected cell-9 cell-8)
        (cell-connected cell-9 cell-10)
        (cell-connected cell-11 cell-9)
    
    )
  
    (:goal 
        (and
        
            ;Hero's Goal Location
            (cell-has-hero cell-11)
            
            ;All gates are closed
            (cell-has-gate-closed cell-5)
            (cell-has-gate-closed cell-6)
            (cell-has-gate-closed cell-9)
            (cell-has-gate-closed cell-7)
            
        )
    )
  
)
